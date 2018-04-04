import UIKit
import PlaygroundSupport

public class BasicAnimation:UIViewController, PlaygroundLiveViewMessageHandler {
    
    //Elements for Header
    public var headerView: UIView!
    public var headerLabel: UILabel!
    
    //Elements for Footer
    public var footerView: UIView!
    public var footerLabel: UILabel!
    
    //Elements for main contnetElements
    public let imageView = UIImageView()
    public var images: [UIImage] = []
    
    //Animation for rotation
    public let rotation = CABasicAnimation(keyPath: "transform.rotation")
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setup(content: SceneContent){
        //Header Setup
        headerView = UIView()
        headerView.backgroundColor = .white
        headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Helvetica", size: 32)
        headerLabel.textColor = .black
        headerLabel.text = content.headerText
        headerView.addSubview(headerLabel)
        
        //Header Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        headerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        //Footer Setup
        footerView = UIView()
        footerView.backgroundColor = .white
        footerLabel = UILabel()
        footerLabel.textAlignment = .center
        footerLabel.font = UIFont(name: "Helvetica", size: 18)
        footerLabel.textColor = .black
        footerLabel.text = content.footerText
        footerLabel.numberOfLines = 0
        footerLabel.lineBreakMode = .byWordWrapping
        footerView.addSubview(footerLabel)
        
        //Footer Constraints
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        footerLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        footerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        //Image View
        images.removeAll()
        images = content.images
        imageView.image = images[0]
        imageView.backgroundColor = .clear
        imageView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
    
        
        //Dummy View so Footer does not upscruct PLayground controls
        let dummyView = UIView()
        dummyView.backgroundColor = .white
        
        //Dummy Constraints
        dummyView.translatesAutoresizingMaskIntoConstraints = false
        dummyView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        dummyView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        //Stack View Setup
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing   = 10.0
        
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(footerView)
        stackView.addArrangedSubview(dummyView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        
        //Horizontal Stackview Constraints
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[stackView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["stackView":stackView])
        //Vertical Stackview Constraints
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[stackView]-10-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: ["stackView":stackView])
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)

    }
    
    public func rotate(timeForFullRotation: Double){
        rotation.fromValue = 0.0
        rotation.toValue = Float.pi * 2.0
        rotation.duration = timeForFullRotation
        rotation.repeatCount = Float.infinity
        imageView.layer.add(rotation, forKey: nil)
    }
    
    public func animate(duration: Double) {
        var animationImages: [UIImage] = []
        for index in 1..<images.count {
            animationImages.append(images[index])
        }
        imageView.animationImages = animationImages
        imageView.animationDuration = duration
        imageView.startAnimating()
    }
    
    public func animateFrames(duration: Double, showFramingErrors: Bool) {
        var selectedImages: [UIImage] = []
        if showFramingErrors {
            var counter = 0
            while counter < 128 {
                selectedImages.append(images[counter])
                if counter % 4 == 0 {
                    counter += 1
                } else {
                    let n = Int(arc4random_uniform(9))
                    if n == 0 {
                        counter += 4
                    } else {
                        counter += 3
                    }
                }
            }
        } else {
            for index in 1..<images.count/4 {
                selectedImages.append(images[index*4])
            }
        }
        imageView.animationImages = selectedImages
        imageView.animationDuration = duration
        imageView.startAnimating()
    }
    
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .string(text):
            print("I don't know what to do with a string")
        case let .integer(number):
            self.animate(duration: Double((images.count-1)/number))
        default:
            print("nothing was received")
        }
    }
}

