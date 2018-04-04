/*:# ILLUSTATION OF MOVEMENT:
 Imagery remained to be a cornerstone of storytelling over the centuries. People were especially fascinated by the illustration of movement. Examples from the 19th century are the [flip book](glossary://flipbook) or the [phenakistiscope](glossary://phenakistiscope), simple devices that create a fluid illusion of movement. Both concepts build on showing static images in a rapid sequence to create the effect of motion.
 
 * callout(Kineograph - by J. B. Linnet, published in 1886):
 ![flip book](kineograph.jpg)\
 
 **Try the phenakistiscope for yourself and make it turn.**
 */
//#-hidden-code
import UIKit
import PlaygroundSupport

var scopeAnimtation = BasicAnimation()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = scopeAnimtation

var sound = Sound()
var myImageNames: [String] = []

func loadImageNames(){
    myImageNames.append("Phenakistiscope.png")
    for index in 0...12 {
        myImageNames.append("Phenakistiscope-\(index).jpg")
    }
}
loadImageNames()

var content = SceneContent(headerText: "Look through the Phenakistiscope", imageFileNames: myImageNames, footerText: "By turning the scope, you can see the scene coming alive.", footerAltTexts: nil)
scopeAnimtation.setup(content: content)
 //#-end-hidden-code
//Select the number of seconds a rotation of the scope should take.
//#-code-completion(everything, hide)
var secondsPerRotation: Double = /*#-editable-code Add ome Text*/3.0/*#-end-editable-code*/
//#-hidden-code
sound.playSound(audioFileName: "bicycle-wheel-turning.mp3")
scopeAnimtation.animate(duration: Double(secondsPerRotation))
if secondsPerRotation == 0.54 {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Great! At this speed it is impossible to see individual images. Move on to the [**next page**](@next).")
}
//#-end-hidden-code

//: [Previous](@previous) ||
//: [Next](@next)
