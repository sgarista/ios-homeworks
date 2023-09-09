import UIKit


struct LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {

        return login == Checker.shared.login && password == Checker.shared.password ? true : false

    }
}
