import UIKit


class ProfileTableHeaderView: UITableViewHeaderFooterView {

    static let headerID = "profileHeaderView"

    var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView(image: UIImage(named: "UserPic"))
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor

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


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupLayout()

        setStatusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)
        statusTextField.addTarget(UIEvent(), action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayout() {

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)


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
}


