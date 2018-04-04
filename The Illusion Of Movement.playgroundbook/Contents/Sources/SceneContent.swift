import UIKit

public class SceneContent {
    
    public var headerText: String
    public var images: [UIImage]
    public var footerText: String
    public var footerAltTexts: [String]?
    
    public init(headerText: String, imageFileNames: [String], footerText: String, footerAltTexts: [String]?) {
        
        self.headerText = headerText
        self.images = []
        self.footerText = footerText
        self.footerAltTexts = footerAltTexts
        
        for index in 0..<imageFileNames.count {
            self.images.append(UIImage(named: imageFileNames[index])!)
        }
    }
}
