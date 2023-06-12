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


    var commentView: UILabel = {
        let commentView = UILabel()

        commentView.translatesAutoresizingMaskIntoConstraints = false

        commentView.text = "Waiting for something..."
        commentView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        commentView.textColor = .gray


        return commentView
    }()


    var statusButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)


        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)

        layoutSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
      super.layoutSubviews()


        addSubview(userPic)
        addSubview(userName)
        addSubview(commentView)
        addSubview(statusButton)


        NSLayoutConstraint.activate([

            userPic.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userPic.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),


            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),


            commentView.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            commentView.leadingAnchor.constraint(equalTo: userName.leadingAnchor),


            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.topAnchor.constraint(equalTo: userPic.bottomAnchor, constant: 16),
            statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

        ])

    }
}
