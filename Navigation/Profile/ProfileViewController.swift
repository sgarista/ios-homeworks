import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView!



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        title = "Profile"

        profileHeaderView = ProfileHeaderView()

        view.addSubview(profileHeaderView)

    }

    override func viewWillLayoutSubviews() {

        profileHeaderView.frame = view.frame
    }


//    override var preferredStatusBarStyle: UIStatusBarStyle {
//
//        return .lightContent
//    }


}
