import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView!

    var makeStatusBiggerButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Tap me and look what can I do!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "Profile"

        profileHeaderView = ProfileHeaderView()

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileHeaderView)
        view.addSubview(makeStatusBiggerButton)

        setupConstraints()

        makeStatusBiggerButton.addTarget(UIEvent(), action: #selector(funnyButtonPressed(_:)), for: .touchUpInside)


    }

    override func viewWillLayoutSubviews() {

        profileHeaderView.frame = view.frame
    }

    func setupConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),


            makeStatusBiggerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            makeStatusBiggerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            makeStatusBiggerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        ])
    }


    @objc func funnyButtonPressed(_ sender: UIButton) {

        var result = ""
        if let status = profileHeaderView.statusLabel.text {

            for char in status {
                if char.isUppercase {
                    result += char.lowercased()
                } else if char.isLowercase {
                    result += char.uppercased()
                } else {
                    result += String(char)
                }
            }
            profileHeaderView.statusLabel.text = result
        }
    }
}
