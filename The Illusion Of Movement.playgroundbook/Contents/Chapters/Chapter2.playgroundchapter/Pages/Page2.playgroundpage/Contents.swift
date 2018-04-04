/*:# CAPTURING MOVEMENT:
 An image tells more than a 1000 words. This became even more true with the invention of photography. For the first time, people could accurately record the world's events. This led to amazing discoveries about motion. In the late 19th century for example, people were assuming a [running horse](glossary://horse) has always at least one hoove on the ground and were proven otherwise.
 
 * callout(The Horse in Motion by E. Muybridge, published 1878):
 ![flip book](TheHorseInMotion.jpg)
 
 **Try for yourself to see how the motion was captured or see an animation of the illustration for comparision.**
 */
//#-hidden-code
import PlaygroundSupport

var fpsAnimation = BasicAnimation()
PlaygroundPage.current.liveView = fpsAnimation
PlaygroundPage.current.needsIndefiniteExecution = true

var sound = Sound()
var myImageNames: [String] = []

func showAnimation(_ fps: Int, _ realPhotos: Bool){
    myImageNames.removeAll()
    if realPhotos {
        myImageNames.append("TheHorseInMotion-0.jpg")
        for index in 1...16 {
            myImageNames.append("TheHorseInMotionPhoto-\(index).jpg")
        }
        var content = SceneContent(headerText: "The Running Horse", imageFileNames: myImageNames, footerText: "By scrolling through the images, the horse starts running.", footerAltTexts: nil)
        fpsAnimation.setup(content: content)
        sound.playSound(audioFileName: "srs-foley-horse-galloping.mp3")
        fpsAnimation.animate(duration: Double(16/fps))
    } else {
        for index in 0...11 {
            myImageNames.append("TheHorseInMotion-\(index).jpg")
        }
        var content = SceneContent(headerText: "The Running Horse", imageFileNames: myImageNames, footerText: "By scrolling through the images, the horse starts running.", footerAltTexts: nil)
        fpsAnimation.setup(content: content)
        sound.playSound(audioFileName: "srs-foley-horse-galloping.mp3")
        fpsAnimation.animate(duration: Double(11/fps))
    }
}
//#-end-hidden-code
//Select the number of frames per seconds to adjust the animation.
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
var framesPerSecond: Int = /*#-editable-code Add ome Text*/16/*#-end-editable-code*/
var showRealPhotos: Bool = /*#-editable-code Add ome Text*/true/*#-end-editable-code*/
//#-hidden-code
showAnimation(framesPerSecond, showRealPhotos)
if framesPerSecond == 24 {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Nice! At this speed it is impossible to see individual images. Try even higher framerates to see the horse running really fast or move on to the [**next chapter**](@next).")
} 
//#-end-hidden-code

//: [Previous](@previous) ||
//: [Next](@next)
