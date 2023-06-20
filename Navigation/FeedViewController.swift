import UIKit

struct Post {

    var title: String
}


class FeedViewController: UIViewController {

    var redButton: UIButton = {
        let button = UIButton()

        button.setTitle("RED", for: .normal)
        button.setTitleColor(.red, for: .normal)

        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.red.cgColor
        button.backgroundColor = .white

        return button
    }()




    var blueButton: UIButton = {
        let button = UIButton()

        button.setTitle("BLUE", for: .normal)
        button.setTitleColor(.blue, for: .normal)

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

        redButton.addTarget(self, action: #selector(redButtonPressed(_:)), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(blueButtonPressed(_:)), for: .touchUpInside)
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


    @objc func redButtonPressed(_ sender: UIButton) {
        let currentPost = Post(title: "Манчестер Юнайтед")
        let postVC = PostViewController()
        postVC.post = currentPost
        postVC.view.backgroundColor = .systemRed

        navigationController?.pushViewController(postVC, animated: true)
    }


    @objc func blueButtonPressed(_ sender: UIButton) {
        let currentPost = Post(title: "Манчестер Сити")
        let postVC = PostViewController()
        postVC.post = currentPost
        postVC.view.backgroundColor = .systemBlue

        navigationController?.pushViewController(postVC, animated: true)
    }
}
