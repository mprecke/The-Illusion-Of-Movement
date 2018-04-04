import UIKit
import PlaygroundSupport

var motionStory = ImageSeries()
PlaygroundPage.current.liveView = motionStory
PlaygroundPage.current.needsIndefiniteExecution = true

var myImageNames: [String] = []
func loadImageNames(){
    for index in 0...23 {
        myImageNames.append("EgyptianMotionStory-\(index).png")
    }
}
loadImageNames()

var content = SceneContent(headerText: "Your first Motion Story", imageFileNames: myImageNames, footerText: "There is nothing to see yet.", footerAltTexts: ["Start with at least 1 image. Add more to see how the story unfolds.","Looks like they are wrestling. What happens next?","Nice, this feels like an exciting story. Do you want to see more?","This is an intense wrestling match. Do you wonder how it ends?","Great. This was a captivating story, was it not?","There are only 24 images in this story. So you have reached the end."])

motionStory.setup(content: content, numberOfImagesToDraw: 0, imageSize: CGSize(width: 90, height: 90), audioFileNames: ["punch.mp3", "slap.mp3", "banana-slap.mp3"])
