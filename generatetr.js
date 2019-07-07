var OpenCC = require('opencc');
var path = require('path')
var fs = require('fs')
var opencc2Tw = new OpenCC("s2twp.json");
var opencc2Tr = new OpenCC("s2t.json");
var exec = require('child_process').exec;

var projectDir = "projectDir"

var targets = [
    {
        'language': 'zh-Hans',
        'translateFunc': function (text) {
            return text
        }
    },
    {
        'language': 'zh-Hant',
        'translateFunc': function (text) {
            return opencc2Tr.convertSync(text)
        }
    },
    {
        'language': 'zh-Hant-TW',
        'translateFunc': function (text) {
            return opencc2Tw.convertSync(text)
        }
    },
    {
        'language': 'en',
        'translateFunc': function (text) {
            return text
        }
    }
]

console.log("Searching strings from project...")

execute('./genstrings.swift').then((result) => {
    let basePairs = getPairsFromString(result)
    return Promise.all(targets.map(t => convertForTarget(basePairs, t)))
}).catch((err) => {
    console.log(err)
})

/**
 * 转换 target
 * @param {*} basePairs 
 * @param {*} target 
 */
function convertForTarget(basePairs, target) {
    let path = getLanguagePath(target.language)
    let translateFunc = target.translateFunc

    return getPairsFromPath(path).then((pairs) => {
        let baseKeys = Object.keys(basePairs)
        let newPairsForWrite = []
        let existedPairsForWrite = []
        let unusedPairsForWrite = []

        baseKeys.map((key) => {
            if (pairs[key] === undefined) {
                newPairsForWrite.push({
                    key: key,
                    value: translateFunc ? translateFunc(basePairs[key]) : "",
                })
            } else {
                existedPairsForWrite.push({
                    key: key,
                    value: pairs[key]
                })
            }
        })

        Object.keys(pairs).forEach((key) => {
            if (baseKeys.indexOf(key) < 0) {
                unusedPairsForWrite.push({
                    key: key,
                    value: pairs[key]
                })
            }
        })

        return writePairsForTarget(newPairsForWrite, existedPairsForWrite, unusedPairsForWrite, target).then(() => {
            var logText = `${target.language} ✓`

            if (newPairsForWrite.length > 0) {
                logText += `\n${newPairsForWrite.length} new`
            }

            console.log(logText)
        }).catch((err) => {
            console.log(`${target.language} ✗`)

            return Promise.reject(err)
        })
    })
}

function getPairsFromString(string) {
    let pairs = {}
    var lines = string.trim("\n").replace(/\n{2,}/g, "\n").split('\n')

    lines.forEach((line) => {
        let keyMatches = line.match(/^"([^"]+)"/)
        let valueMatches = line.match(/"([^"]*)";/)

        if (keyMatches && valueMatches) {
            pairs[keyMatches[1]] = valueMatches[1]
        }
    })

    return pairs
}

/**
 * 读取 pairs
 * @param {*} filePath 
 */
function getPairsFromPath(filePath) {
    var pairs = []

    let promise = new Promise((resolve, reject) => {
        fs.readFile(filePath, (err, data) => {
            if (err) {
                reject(err)
                return
            }

            let pairs = getPairsFromString(data.toString())

            resolve(pairs)
        })
    })

    return promise
}

/**
 * 写入 pairs
 * @param {*} pairsForWrite 
 * @param {*} unusedPairsForWrite 
 * @param {*} target 
 */
function writePairsForTarget(newPairsForWrite, existedPairsForWrite, unusedPairsForWrite, target) {
    let language = target.language
    let path = getLanguagePath(language)

    return new Promise((resolve, reject) => {
        var stringForWrite = ""

        if (newPairsForWrite.length > 0) {
            stringForWrite += "/*\n * NEW\n */\n"

            stringForWrite += newPairsForWrite.map((pair) => {
                return `"${pair.key}" = "${pair.value}";`
            }).join("\n")

            stringForWrite += "\n\n"
        }

        stringForWrite += existedPairsForWrite.map((pair) => {
            return `"${pair.key}" = "${pair.value}";`
        }).join("\n")

        if (unusedPairsForWrite.length > 0) {
            stringForWrite += "\n\n/*\n * UNUSED\n */\n"

            stringForWrite += unusedPairsForWrite.map((pair) => {
                return `"${pair.key}" = "${pair.value}";`
            }).join("\n")
        }

        fs.writeFile(path, stringForWrite, function (err) {
            err ? reject(err) : resolve()
        })
    })
}

/**
 * 获取语言文件的路径
 * @param {*} language 
 */
function getLanguagePath(language) {
    let dir = path.join(__dirname, projectDir)

    return path.join(dir, `${language}.lproj/Localizable.strings`)
}

function execute(command) {
    return new Promise((resolve, reject) => {
        exec(command, function (error, stdout, stderr) {
            if (error) {
                reject(error)
                return
            }

            resolve(stdout)
        });
    })
};
