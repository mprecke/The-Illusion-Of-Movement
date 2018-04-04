import UIKit

public class References:UIViewController {
    
    //Elements for Header
    public var headerView: UIView!
    public var headerLabel: UILabel!
    
    //Elements for Footer
    public var footerView: UIView!
    public var footerLabel: UILabel!
    
    //Elements for main content Elements
    public var mainView: UIView!
    public var mainLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setup(header: String, footer: String, main: String){
        //Header Setup
        headerView = UIView()
        headerView.backgroundColor = .white
        headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Helvetica", size: 32)
        headerLabel.textColor = .black
        headerLabel.text = header
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
        footerLabel.text = footer
        footerLabel.numberOfLines = 0
        footerLabel.lineBreakMode = .byWordWrapping
        footerView.addSubview(footerLabel)
        
        //Footer Constraints
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        footerLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        footerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        //Main View
        mainView = UIView()
        mainView.backgroundColor = .white
        mainLabel = UILabel()
        mainLabel.textAlignment = .left
        mainLabel.font = UIFont(name: "Helvetica", size: 11)
        mainLabel.numberOfLines = 0
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.textColor = .black
        //mainLabel.text = "Welcome to my wonderful world"
        mainLabel.text = main
        mainView.addSubview(mainLabel)
        
        //Main Constraints
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
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
        stackView.addArrangedSubview(mainView)
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
    
}
