import UIKit


class FeedModel {

    let secretWord = "пароль"


    func check(word: String) -> Bool {
        return word.uppercased() == secretWord.uppercased()
    }
}
