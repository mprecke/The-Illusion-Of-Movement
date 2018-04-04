import UIKit
import PlaygroundSupport

var scopeAnimtation = BasicAnimation()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = scopeAnimtation

var myImageNames: [String] = []
func loadImageNames(){
    myImageNames.append("Phenakistiscope.png")
    for index in 0...12 {
        myImageNames.append("Phenakistiscope-\(index).jpg")
    }
}
loadImageNames()

var content = SceneContent(headerText: "This is a Phenakistiscope", imageFileNames: myImageNames, footerText: "It looks strange, but wait until you look through it.", footerAltTexts: nil)

scopeAnimtation.setup(content: content)
scopeAnimtation.rotate(timeForFullRotation: 10)
