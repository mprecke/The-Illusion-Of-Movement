/*:# IMAGE SEQUENCES:
 All human life is narratively routed. Even millennia ago our ancestors used graphic symbols to share their stories and knowledge. In fact the old Egyptians developed an entire writing system based on so called hieroglyphs. They also used image sequences to tell stories, e.g. in various murals that feature long [motions stories](glossary://egyptian).
 
 * callout(Wrestling Scene - Tomb of Baqt, Egypt, ca. 2000 BC):
    ![Egyptian Motion Story](EgyptianMotionStory.jpg)\
    Newspaper clipping, "Hufvudstadsbladet", published 1972
 
 **Try it for yourself and create you own motion story.**
 */
//#-hidden-code
import PlaygroundSupport

func show(_ message: Int) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.integer(message))
    }
}
//#-end-hidden-code
//Select a number between 1 and 24 to change the length of the story.
//#-code-completion(everything, hide)
var number: Int = /*#-editable-code Add ome Text*/12/*#-end-editable-code*/

//#-hidden-code
show(number)
if number == 24 {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome, you made it. You explored the whole length of this story. Move on to the [**next chapter**](@next).")
}
//#-end-hidden-code
//: [Previous](@previous) ||
//: [Next](@next)
