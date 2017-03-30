import Foundation
import UIKit

extension UILabel {
    func setText(width: CGFloat, text: String, lineSpacing: CGFloat = 0, paragraphSpacing: CGFloat = 0) {
        let textSize = CGSize(width: width, height: CGFloat(Float.greatestFiniteMagnitude))
        let rHeight = (text as NSString).boundingRect(with: textSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: self.font], context: nil).height
        let charSize = self.font.lineHeight
        let lineCount = Int((rHeight / charSize).rounded())
        
        if lineCount == 1 {
            self.attributedText = NSAttributedString(string: text)
        } else {
            let paraStyle = NSMutableParagraphStyle()
            
            paraStyle.lineSpacing = lineSpacing
            paraStyle.paragraphSpacing = paragraphSpacing
            paraStyle.lineBreakMode = self.lineBreakMode
            paraStyle.alignment = self.textAlignment
            
            self.attributedText = NSAttributedString(string: text, attributes: [NSParagraphStyleAttributeName: paraStyle])
        }
    }
}
