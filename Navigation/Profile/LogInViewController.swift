import UIKit


class LogInViewController: UIViewController {


    var loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var loginTextField: UITextField = {
        let login = UITextField()

        login.translatesAutoresizingMaskIntoConstraints = false
        login.textColor = .black
        login.font = .systemFont(ofSize: 16, weight: .regular)
        login.tintColor = .lightGray
        login.autocapitalizationType = .none
        login.placeholder = "Email or phone"
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        login.backgroundColor = .systemGray6
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done
        login.clearButtonMode = UITextField.ViewMode.whileEditing
        

        return login
    }()

    var passwordTextField: UITextField = {
        let password = UITextField()

        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black
        password.font = .systemFont(ofSize: 16, weight: .regular)
        password.tintColor = .lightGray
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.backgroundColor = .systemGray6
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always

        return password
    }()

    var stackView: UIStackView = {
        var stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -1

        return stackView
    }()

    var loginStatusButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        let bluePixel = UIImage(named: "BluePixel")
        button.setBackgroundImage(bluePixel, for: .normal)
        button.setBackgroundImage(bluePixel?.alpha(0.8), for: .selected)
        button.setBackgroundImage(bluePixel?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(bluePixel?.alpha(0.8), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()

        loginStatusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)


    }

    private func setupView() {

        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false

    }


    private func addSubviews() {

        view.addSubview(loginImageView)

        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        view.addSubview(stackView)

        view.addSubview(loginStatusButton)

    }

    private func setupConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            loginImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loginImageView.heightAnchor.constraint(equalToConstant: 100),
            loginImageView.widthAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            

            loginStatusButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginStatusButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }


    @objc func buttonPressed(_ sender: UIButton) {

        navigationController?.pushViewController(ProfileViewController(), animated: true)

    }

}





extension UIImage {

    func alpha(_ value: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
