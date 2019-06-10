import Foundation
import UIKit

extension UILabel {
    func setText(width: CGFloat, text: String, lineSpacing: CGFloat = 0, paragraphSpacing: CGFloat = 0, letterSpacing: CGFloat = 0) {
        var lineCount = 0;
        let textSize = CGSize(width: width, height: CGFloat(Float.infinity))
        let rHeight = (text as NSString).boundingRect(with: textSize, options: [.usesLineFragmentOrigin], attributes: [.font: self.font], context: nil).height
        let charSize = self.font.lineHeight
        lineCount = Int((rHeight / charSize).rounded())
        
        if lineCount == 1 {
            let paraStyle = NSMutableParagraphStyle()
            
            paraStyle.alignment = self.textAlignment
            
            var attributes: [NSAttributedString.Key: Any] = [.paragraphStyle: paraStyle, .kern: letterSpacing]
            
            self.attributedText = NSAttributedString(string: text, attributes: attributes)
        } else {
            let paraStyle = NSMutableParagraphStyle()
            
            paraStyle.lineSpacing = lineSpacing
            paraStyle.paragraphSpacing = paragraphSpacing
            paraStyle.lineBreakMode = self.lineBreakMode
            paraStyle.alignment = self.textAlignment
            
            var attributes: [NSAttributedString.Key: Any] = [.paragraphStyle: paraStyle, .kern: letterSpacing]
            
            self.attributedText = NSAttributedString(string: text, attributes: attributes)
        }
    }
}
