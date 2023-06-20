import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView!



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "Profile"

        profileHeaderView = ProfileHeaderView()

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileHeaderView)

        setupConstraints()

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
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        ])
    }
}
