import UIKit
import PlaygroundSupport

var fpsAnimation = BasicAnimation()
PlaygroundPage.current.liveView = fpsAnimation
PlaygroundPage.current.needsIndefiniteExecution = true

var myImageNames: [String] = []
func loadImageNames(){
    myImageNames.append("TheHorseInMotion-0.jpg")
    for index in 1...16 {
        myImageNames.append("TheHorseInMotionPhoto-\(index).jpg")
    }
}
loadImageNames()
var content = SceneContent(headerText: "The Running Horse", imageFileNames: myImageNames, footerText: "So far, the horse is not moving.", footerAltTexts: nil)
fpsAnimation.setup(content: content)

