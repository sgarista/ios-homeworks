import UIKit


class ProfileHeaderView: UIView {

    var userPic: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "UserPic"))

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.sizeToFit()
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor

        return imageView
    }()


    var userName: UILabel = {
        let userName = UILabel()

        userName.translatesAutoresizingMaskIntoConstraints = false

        userName.text = "Randy Marsh"
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textColor = .black

        return userName
    }()


    var userStatus: UILabel = {
        var userStatus = UILabel()

        userStatus.translatesAutoresizingMaskIntoConstraints = false

        userStatus.text = "Waiting for something..."
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userStatus.textColor = .gray
        userStatus.lineBreakMode = .byWordWrapping
        userStatus.numberOfLines = 0

        return userStatus
    }()

    var newStatus: UITextField = {
        var newStatus = UITextField()

        newStatus.translatesAutoresizingMaskIntoConstraints = false

        newStatus.text = ""
        newStatus.placeholder = "Listening to music"
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        newStatus.textColor = .black
        newStatus.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: newStatus.frame.height))
        newStatus.leftViewMode = .always

        return newStatus
    }()

    var statusButton: UIButton = {
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
        button.layer.masksToBounds = true
        button.clipsToBounds = false

        return button
    }()

    private var statusText: String?



    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()

        statusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)
        newStatus.addTarget(UIEvent(), action: #selector(statusTextChanged(_:)), for: .editingChanged)


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayout() {


        addSubview(userPic)
        addSubview(userName)
        addSubview(userStatus)
        addSubview(newStatus)
        addSubview(statusButton)


        NSLayoutConstraint.activate([
            userPic.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userPic.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userPic.heightAnchor.constraint(equalToConstant: 100),
            userPic.widthAnchor.constraint(equalToConstant: 100),

            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 30),

            userStatus.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 60),
            userStatus.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 30),
            userStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            newStatus.topAnchor.constraint(equalTo: userStatus.bottomAnchor, constant: 17),
            newStatus.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 30),
            newStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            newStatus.heightAnchor.constraint(equalToConstant: 40),

            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: newStatus.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

        ])
    }



    @objc func statusTextChanged(_ textField: UITextField) {

        statusText = textField.text

    }


    @objc func buttonPressed(_ sender: UIButton) {

        if let newStatusText = statusText {
            if newStatusText.count > 0 {
                userStatus.text = newStatusText
            } else {
                userStatus.text = newStatus.placeholder ?? "ubiquitous emptiness"
            }
        } else {
            userStatus.text = newStatus.placeholder ?? "ubiquitous emptiness"
        }
    }
}


