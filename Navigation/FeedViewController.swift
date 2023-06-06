import UIKit

struct Post {

    var title: String
}


class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Читать", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupPostButtonView()
        activateConstraints()

        postButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

    }

    func setupPostButtonView() {

        view.addSubview(postButton)

        view.backgroundColor = .systemGray2
        title = "Feed"
    }


    func activateConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([postButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0), postButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 240.0), postButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -280.0), postButton.heightAnchor.constraint(equalToConstant: 44.0)])

    }


    @objc func buttonPressed(_ sender: UIButton) {
        let currentPost = Post(title: "Тестовый заголовок")
        let postVC = PostViewController()
        postVC.post = currentPost
        navigationController?.pushViewController(postVC, animated: true)

    }
}
