import UIKit


class ProfileTableHeaderView: UITableViewHeaderFooterView {


    static let headerID = "profileHeaderView"

    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView(image: UIImage(named: "UserPic"))
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor

        avatarImageView.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTap))

        tap.numberOfTapsRequired = 1
        avatarImageView.addGestureRecognizer(tap)

        return avatarImageView
    }()


    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false

        fullNameLabel.text = "Randy Marsh"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black

        return fullNameLabel
    }()


    var statusLabel: UILabel = {
        var statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.lineBreakMode = .byWordWrapping
        statusLabel.numberOfLines = 0

        return statusLabel
    }()


    var statusTextField: UITextField = {
        var statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        statusTextField.text = ""
        statusTextField.placeholder = "25 characters MAX"
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always

        return statusTextField
    }()


    var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.clipsToBounds = false

        return button
    }()


    private var statusText: String?

    // для анимации



    let backView: UIView = {
        var backView = UIView()
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            backView.frame = CGRect(x: 0, y: statusBarHeight + 5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        } else {
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            backView.frame = CGRect(x: 0, y: statusBarHeight + 5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        backView.translatesAutoresizingMaskIntoConstraints = false


        return backView
    }()


    let frontView: UIView = {
        var frontView = UIView()
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            frontView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)


        } else {
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            frontView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }

        frontView.translatesAutoresizingMaskIntoConstraints = false

        return frontView
    }()


    private lazy var closeButton: UIButton = {
        var closeButton = UIButton(frame: CGRect(x: frontView.frame.width - 60, y: 0, width: 60, height: 60))
        closeButton.setImage(UIImage(systemName: "cross.fill"), for: .normal)
        closeButton.tintColor = UIColor.black
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(cancelAnimation), for: .touchUpInside)

        
        return closeButton
    }()



    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupView()
        setupLayout()

        setStatusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)
        statusTextField.addTarget(UIEvent(), action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupView() {

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }


    func setupLayout() {

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 17),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)

        ])
    }


    func animationViewSetup() {
        guard let mainWindow = UIApplication.shared.windows.first else {
            return
        }

        let statusBarHeight = mainWindow.safeAreaInsets.top

        mainWindow.addSubview(backView)
        backView.addSubview(frontView)
        frontView.addSubview(avatarImageView)
        backView.addSubview(fullNameLabel)
        backView.addSubview(statusLabel)
        backView.addSubview(statusTextField)
        backView.addSubview(setStatusButton)
        backView.bringSubviewToFront(frontView)
        frontView.addSubview(closeButton)

        mainWindow.insertSubview(avatarImageView, aboveSubview: frontView)
        frontView.alpha = 0.0
        closeButton.alpha = 0.0

        avatarImageView.transform = CGAffineTransform(translationX: 0, y: statusBarHeight)
    }


    func removeSubView() {

        backView.removeFromSuperview()
        frontView.removeFromSuperview()
        closeButton.removeFromSuperview()

    }


    @objc func statusTextChanged(_ textField: UITextField) {

        statusText = textField.text
    }


    @objc func buttonPressed(_ sender: UIButton) {

        if let newStatusText = statusText {
            if newStatusText.count > 0 && newStatusText.count < 26 {
                statusLabel.text = newStatusText
            } else {
                statusLabel.text = statusTextField.placeholder ?? "ubiquitous emptiness"
            }
        } else {
            statusLabel.text = statusTextField.placeholder ?? "ubiquitous emptiness"
        }
    }


    @objc private func avatarTap() {

        animationViewSetup()
        layoutIfNeeded()

        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveLinear
        ) {
            self.avatarImageView.center = CGPoint(
                x: UIScreen.main.bounds.midX,
                y: UIScreen.main.bounds.midY
            )
            self.avatarImageView.transform = CGAffineTransform(
                scaleX: UIScreen.main.bounds.width / self.avatarImageView.bounds.width,
                y: UIScreen.main.bounds.width / self.avatarImageView.bounds.width
            )
            self.avatarImageView.layer.cornerRadius = 0
            self.frontView.backgroundColor = .systemBackground
            self.frontView.alpha = 0.8
        } completion: { finished in
            print("Avatar taped")

            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .curveLinear
            ) {
                self.closeButton.alpha = 1.0
            } completion: { finished in
                print("button created")
            }
        }
    }


    @objc func cancelAnimation() {

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveLinear
        ) {
            self.closeButton.alpha = 0.0
        } completion: { finished in
            print("button delete")

            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .curveLinear
            ) {
                self.setupLayout()
                self.layoutIfNeeded()
                self.avatarImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                self.avatarImageView.transform = .identity
                self.avatarImageView.layer.cornerRadius = 50
                self.frontView.alpha = 0.0
            } completion: { finished in
                print("image  small")

                self.setupView()
                self.setupLayout()
                self.layoutIfNeeded()
                self.removeSubView()

            }
        }
    }
}

