import UIKit



class FeedViewController: UIViewController {


    private lazy var redButton: CustomButton = {
        let button = CustomButton(title: "RED", titleColor: .red, buttonAction: { [weak self] in

            self?.navigationController?.pushViewController(InfoViewController(), animated: true)
        })

                button.layer.borderWidth = 4
                button.layer.borderColor = UIColor.red.cgColor
                button.backgroundColor = .white

        return button
    }()


    private lazy var blueButton: CustomButton = {
        let button = CustomButton(title: "BLUE", titleColor: .blue, buttonAction: { [weak self] in

            self?.navigationController?.pushViewController(PostViewController(), animated: true)
        })

                button.layer.borderWidth = 4
                button.layer.borderColor = UIColor.blue.cgColor
                button.backgroundColor = .white

        return button
    }()

    
    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
        
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(blueButton)
        
        activateConstraints()

    }
    
    
    func setupStackView() {
        
        view.addSubview(stackView)
        view.backgroundColor = .systemGray2
        title = "Feed"
    }
    
    
    func activateConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50.0),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100.0),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100.0)
        ])
    }
}
