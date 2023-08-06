import UIKit


class CurrentUserService: UserService {

    var currentUser: User?


    func loginCheck(login: String) -> User? {

        for user in users {
            if login == user.login {
                currentUser = user
            }
        }
        return currentUser
    }
}
