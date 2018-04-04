/*:# MOTION PICTURE PHOTOGRAPHY:
 The experiments with moving images and photography paved the way for [cinematography](glossary://cinematography). It allowed to record live action on strips of film material and to present the recording by projecting light through the frames onto a screen. By displaying ruffly 24 frames per second, we perceive the seamless movements and that's why we call it motion picture.
 
 * callout(35mm  motion picture filmstrip):
 ![flip book](filmstrip.jpg)\
 "Filmstrip" by B. Everson, licensed under CC BY-SA 2.0
 
 **Try it for yourself, to see this amazing effect.**
 */
//#-hidden-code
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
//#-end-hidden-code
//Adjust the framerate and check for framing errors for a smooth projection.
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
var framesPerSecond: Int = /*#-editable-code Add ome Text*/12/*#-end-editable-code*/
var showFramingErrors: Bool = /*#-editable-code Add ome Text*/true/*#-end-editable-code*/
//#-hidden-code
if showFramingErrors {
    var content = SceneContent(headerText: "The Movie Projector", imageFileNames: myImageNames, footerText: "The projector is not running smoothly.", footerAltTexts: nil)
    fpsAnimation.setup(content: content)
    sound.playSound(audioFileName: "film-01.mp3")
    fpsAnimation.animateFrames(duration: Double(32/framesPerSecond), showFramingErrors: showFramingErrors)

} else {
    var content = SceneContent(headerText: "The Movie Projector", imageFileNames: myImageNames, footerText: "Great, now everything is running smoothly.", footerAltTexts: nil)
    fpsAnimation.setup(content: content)
    sound.playSound(audioFileName: "film-01.mp3")
    fpsAnimation.animateFrames(duration: Double(32/framesPerSecond), showFramingErrors: showFramingErrors)
}
if showFramingErrors == false && framesPerSecond == 24 {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Great, you got it! At this framerate and with a smoothly running projector, it is impossible to see individual images. [**You completed this excercise**](@next).")
}
//#-end-hidden-code
//: [Previous](@previous) ||
//: [Next](@next)
