import UIKit



class FeedViewModel {

    let model = FeedModel()

    var guessButtonTapped: ((Bool) -> Void)?

    func check(word: String) {
        let isCorrect = word.uppercased() == model.secretWord.uppercased()
        guessButtonTapped?(isCorrect)
    }
}


