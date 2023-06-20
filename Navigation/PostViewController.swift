import UIKit


class PostViewController: UIViewController {

    var post = [Post]()


    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()

    @objc func showInfoViewController() {

        let infoNavigationController = InfoViewController()
        infoNavigationController.modalTransitionStyle = .coverVertical
        infoNavigationController.modalPresentationStyle = .formSheet
        present(infoNavigationController, animated: true)

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        showBarButton()
        setupPostButtonView()
        activateConstarints()
        postButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    func setupPostButtonView() {


        view.backgroundColor = .gray
        view.addSubview(postButton)
    }

    func showBarButton() {

        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfoViewController))
        navigationItem.rightBarButtonItem = infoButton
    }

    func activateConstarints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([postButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0), postButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 240.0), postButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 280.0), postButton.heightAnchor.constraint(equalToConstant: 44.0)])
    }


    @objc func buttonPressed(_ sender: UIButton) {

        navigationController?.popViewController(animated: true)
    }

}

