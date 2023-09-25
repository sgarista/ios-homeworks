import UIKit



class FeedViewController: UIViewController {


    private var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "РЕЗУЛЬТАТ"

        return label
    }()

    var checkTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        textField.text = "пароль"


        return textField
    }()



    var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "Проверить", titleColor: .red)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.backgroundColor = .white

        return button
    }()


    private lazy var redButton: CustomButton = {
        let button = CustomButton(title: "RED", titleColor: .red, buttonAction: { [weak self] in

            self?.navigationController?.pushViewController(InfoViewController(), animated: true)
        })

        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.red.cgColor
        button.backgroundColor = .white

        return button
    }()


    private lazy var blueButton: CustomButton = {
        let button = CustomButton(title: "BLUE", titleColor: .blue, buttonAction: { [weak self] in

            self?.navigationController?.pushViewController(PostViewController(), animated: true)
        })

        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.blue.cgColor
        button.backgroundColor = .white

        return button
    }()

    
    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
        setupView()
        
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(blueButton)
        
        setupConstraints()

        checkGuessButton.addTarget(self, action: #selector(checkGuessButtonTapped), for: .touchUpInside)

    }
    
    
    func setupStackView() {
        
        view.addSubview(stackView)
        view.backgroundColor = .systemGray2
        title = "Feed"
    }


    func setupView() {

        view.addSubview(resultLabel)
        view.addSubview(checkTextField)
        view.addSubview(checkGuessButton)
    }
    
    
    func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([

            checkTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            checkTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            checkTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -20),
            checkTextField.heightAnchor.constraint(equalToConstant: 50),

            resultLabel.topAnchor.constraint(equalTo: checkTextField.topAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            resultLabel.bottomAnchor.constraint(equalTo: checkTextField.bottomAnchor),

            checkGuessButton.topAnchor.constraint(equalTo: checkTextField.bottomAnchor, constant: 40),
            checkGuessButton.leadingAnchor.constraint(equalTo: checkTextField.leadingAnchor),
            checkGuessButton.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),

            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50.0),
            stackView.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 40.0),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200.0)
        ])
    }


    @objc func checkGuessButtonTapped() {
        if let word = checkTextField.text {
            if word.isEmpty {
                resultLabel.text = "Не густо"
                resultLabel.backgroundColor = .systemGray
            } else {
                let feedModel = FeedModel()
                let isCorrect = feedModel.check(word: word)
                resultLabel.text = isCorrect ? "Верно" : "Неверно"
                resultLabel.backgroundColor = isCorrect ? .green : .red
            }
        }
    }
}
