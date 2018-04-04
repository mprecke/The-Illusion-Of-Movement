import AVFoundation

public class Sound {
    
    public var audioPlayer:AVAudioPlayer!
    
    public init() {
        
    }
    
    public func playSound(audioFileName: String){
        let path = Bundle.main.path(forResource: audioFileName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            // error handling if file is not found
            print("there was an error")
        }
    }
    
    public func playOneOfManySounds(audioFileNames: [String]){
        var audioURLs: [URL] = []
        for i in 0...audioFileNames.count-1 {
            let path = Bundle.main.path(forResource: audioFileNames[i], ofType:nil)!
            audioURLs.append(URL(fileURLWithPath: path))
        }
        let random = Int(arc4random_uniform(UInt32(audioURLs.count)))
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURLs[random] )
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
        } catch {
            // error handling if file is not found
            print("there was an error")
        }
    }
    
    public func stopSound(){
        audioPlayer.stop()
    }
}

