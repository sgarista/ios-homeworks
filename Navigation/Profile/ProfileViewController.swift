import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView!



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
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
            profileHeaderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            profileHeaderView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)



        ])
    }
}
