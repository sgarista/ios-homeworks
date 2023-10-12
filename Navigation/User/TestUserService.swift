import UIKit


class TestUserService: UserService {

    var testUser = User(
        login: "randy",
        fullName: "Randy Marsh",
        avatar: UIImage(named: "UserPic"),
        status: "Если к утру мы будем живы, то будем знать, что мы не умерли!"
    )


    func loginCheck(login: String) -> User? {

        return testUser
    }
}
