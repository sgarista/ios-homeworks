import UIKit


class ProfileHeaderView: UIView {

    var userPic: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "UserPic"))

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.sizeToFit()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
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


    var status: UILabel = {
        var status = UILabel()

        status.translatesAutoresizingMaskIntoConstraints = false

        status.text = "Waiting for something..."
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray

        return status
    }()

    var newStatus: UITextField = {
        var newStatus = UITextField()

        newStatus.translatesAutoresizingMaskIntoConstraints = false

        newStatus.text = "  Listening to music"
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        newStatus.textColor = .black

        return newStatus
    }()

    var statusButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4.0
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

        layoutSubviews()

        statusButton.addTarget(UIEvent(), action: #selector(buttonPressed(_:)), for: .touchUpInside)
        newStatus.addTarget(UIEvent(), action: #selector(statusTextChanged(_:)), for: .editingChanged)


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()


        addSubview(userPic)
        addSubview(userName)
        addSubview(status)
        addSubview(newStatus)
        addSubview(statusButton)




        NSLayoutConstraint.activate([
            userPic.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userPic.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),


            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),


            status.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -74),
            status.leadingAnchor.constraint(equalTo: userName.leadingAnchor),


            newStatus.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 20),
            newStatus.leadingAnchor.constraint(equalTo: status.leadingAnchor),
            newStatus.trailingAnchor.constraint(equalTo: statusButton.trailingAnchor),
            newStatus.heightAnchor.constraint(equalToConstant: 40),


            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.topAnchor.constraint(equalTo: userPic.bottomAnchor, constant: 56),
            statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

        ])
    }



    @objc func statusTextChanged(_ textField: UITextField) {

        statusText = textField.text

    }


    @objc func buttonPressed(_ sender: UIButton) {

        let tempStatus = status.text

        if let newStatusText = statusText {
            status.text = newStatusText
        } else {
            status.text = tempStatus

        }
    }
}
