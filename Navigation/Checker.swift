import UIKit


final class Checker {

    static let shared = Checker()

    private init() {

        login = "cartman"
        password = "fatman"

    }

    let login: String

    let password: String


    func check(login: String, password: String) -> Bool {

        return self.login == login && self.password == password ? true : false
    }
}

