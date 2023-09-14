import UIKit
import StorageService


class LogInViewController: UIViewController {


    static var loginDelegate: LoginViewControllerDelegate?


    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground

        return scrollView
    }()


    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.backgroundColor = .white

        return contentView
    }()


    private lazy var loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(named: "Logo")

        return imageView
    }()

    private lazy var loginTextField: UITextField = {
        let login = UITextField()

        login.translatesAutoresizingMaskIntoConstraints = false

        login.textColor = .black
        login.font = .systemFont(ofSize: 16, weight: .regular)
        login.tintColor = .lightGray
        login.autocapitalizationType = .none
        login.placeholder = "Email or phone"
        login.text = "cartman"
        login.backgroundColor = .systemGray6
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
        login.autocorrectionType = .no
        login.keyboardType = .default
        login.returnKeyType = .done
        login.clearButtonMode = .whileEditing
        login.contentVerticalAlignment = .center

        login.delegate = self

        return login
    }()


    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false

        password.textColor = .black
        password.font = .systemFont(ofSize: 16, weight: .regular)
        password.tintColor = .lightGray
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        password.text = "fatman"
        password.backgroundColor = .systemGray6
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.keyboardType = .default
        password.returnKeyType = .done
        password.clearButtonMode = .whileEditing
        password.contentVerticalAlignment = .center

        password.delegate = self

        return password
    }()


    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .lightGray
        separatorView.frame.size.height = 0.5


        return separatorView
    }()


    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5

        return stackView
    }()

    var loginStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "BluePixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = false
        button.layer.masksToBounds = true

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()

        loginStatusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }


    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }


    private func setupView() {

        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }


    private func addSubviews() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(loginImageView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(stackView)
        contentView.addSubview(loginStatusButton)
    }


    private func setupConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),

            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            loginImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            loginImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginImageView.heightAnchor.constraint(equalToConstant: 100),
            loginImageView.widthAnchor.constraint(equalToConstant: 100),

            separatorView.heightAnchor.constraint(equalToConstant: 0.5),

            stackView.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            loginStatusButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    @objc func buttonPressed(_ sender: UIButton) {

        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""

#if DEBUG
        let userService = TestUserService()
#else
        let userService = CurrentUserService()
#endif

        if Self.loginDelegate?.check(login: login, password: password) == true {

            let user = userService.loginCheck(login: login)

            ProfileViewController.currentUser = user

            navigationController?.pushViewController(ProfileViewController(), animated: true)

        } else {

            invalidLoginOrPassword()
        }
    }


    func invalidLoginOrPassword() {
        let alertController = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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

extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}
