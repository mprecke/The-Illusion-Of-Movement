import UIKit
import PlaygroundSupport

var fpsAnimation = BasicAnimation()
PlaygroundPage.current.liveView = fpsAnimation
PlaygroundPage.current.needsIndefiniteExecution = true

var sound = Sound()
var myImageNames: [String] = []

func loadImageNames(){
    for index in 0...127 {
        myImageNames.append("bouncing-ball-\(index).jpg")
    }
}
loadImageNames()

var content = SceneContent(headerText: "The Movie Projector", imageFileNames: myImageNames, footerText: "So far, it's running at 1.5 frames per second.", footerAltTexts: nil)
fpsAnimation.setup(content: content)
fpsAnimation.animate(duration: Double(128/6))
