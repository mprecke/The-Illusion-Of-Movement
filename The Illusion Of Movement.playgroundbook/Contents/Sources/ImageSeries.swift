import Foundation
import UIKit
import PlaygroundSupport

public class ImageSeries: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, PlaygroundLiveViewMessageHandler {
    
    //Elements for Header
    public var headerView: UIView!
    public var headerLabel: UILabel!
    
    //Elements for main content
    public var collectionView: UICollectionView!
    public var layout = UICollectionViewFlowLayout()
    public var images: [UIImage] = []
    public var numberOfImagesToDraw: Int = 0
    public var selectedCell: Int = -1
    
    //Elements for Footer
    public var footerView: UIView!
    public var footerLabel: UILabel!
    public var footerTextAlternatives: [String] = []
    
    //Elements for Sound Effects
    public var sound = Sound()
    public var fileNames: [String] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Setup
    public func setup(content: SceneContent, numberOfImagesToDraw: Int, imageSize: CGSize, audioFileNames: [String]){
        images.removeAll()
        images = content.images
        self.numberOfImagesToDraw = numberOfImagesToDraw
        
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
        footerTextAlternatives = content.footerAltTexts!
        
        //HeadFooterer Constraints
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        footerLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        footerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        //CollectionView Setup
        let frame = self.view.frame
        layout = UICollectionViewFlowLayout()
        layout.itemSize = imageSize
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 0.0
        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: 600), collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.alwaysBounceVertical = false
        
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
        stackView.addArrangedSubview(collectionView!)
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
        
        self.collectionView?.reloadData()
        
        //Loading Audio URLS
        fileNames.removeAll()
        fileNames = audioFileNames
    }
    
    // MARK: CollectionView Methods
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfImagesToDraw
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let cellImage = images[indexPath.item]
        let cellImageView = UIImageView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.layout.itemSize.width, height: self.layout.itemSize.height))
        cellImageView.image = cellImage
        cell.addSubview(cellImageView)
        
        if selectedCell == indexPath.row
        {
            UIView.animate(withDuration: 0.1, animations: {
                cellImageView.backgroundColor = UIColor(hue: 10.0, saturation: 85.0, brightness: 99.0, alpha: 0.1)
                cellImageView.backgroundColor = .white
            })
        }
        else
        {
            cellImageView.backgroundColor = .white
        }
        return cell
    }
    
    // MARK: SoundEffectslet
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = indexPath.row
        self.collectionView?.reloadData()
        sound.playOneOfManySounds(audioFileNames: fileNames)
    }
    
    // MARK: PlaygroundLiveView
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .integer(number):
            self.numberOfImagesToDraw = number
            if number < 1 {
                self.numberOfImagesToDraw = 1
                self.footerLabel.text = footerTextAlternatives[0]
            } else if number < 6 {
                self.footerLabel.text = footerTextAlternatives[1]
            } else if number < 12 {
                self.footerLabel.text = footerTextAlternatives[2]
            } else if number < 24 {
                self.footerLabel.text = footerTextAlternatives[3]
            } else if number == 24 {
                self.footerLabel.text = footerTextAlternatives[4]
            } else {
                self.footerLabel.text = footerTextAlternatives[5]
                self.numberOfImagesToDraw = 24
            }
            self.collectionView?.reloadData()
        default:
            self.collectionView?.reloadData()
        }
    }
    
}
