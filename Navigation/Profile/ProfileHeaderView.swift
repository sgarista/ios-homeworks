import UIKit
import SnapKit


class ProfileHeaderView: UITableViewHeaderFooterView {


    static let headerID = "profileHeaderView"

    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView(image: UIImage(named: "UserPic"))

        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor

        return avatarImageView
    }()


    var returnAvatarButton = UIButton()


    var avatarBackground = UIView()


    private var avatarOriginPoint = CGPoint()


    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()

        fullNameLabel.text = "Randy Marsh"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black

        return fullNameLabel
    }()


    var statusLabel: UILabel = {
        var statusLabel = UILabel()

        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.lineBreakMode = .byWordWrapping
        statusLabel.numberOfLines = 0

        return statusLabel
    }()


    var statusTextField: UITextField = {
        var statusTextField = UITextField()

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

        setupView()
        setupLayout()
        setupAvatarImage()

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
        addSubview(returnAvatarButton)
        addSubview(avatarBackground)
    }


    func setupLayout() {

        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(16)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }

        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(30)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(30)
            make.trailing.equalTo(-16)
        }

        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(17)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(30)
            make.trailing.equalTo(-16)
            make.height.equalTo(40)
        }

        setStatusButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(statusTextField.snp.bottom).offset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(-16)
        }
    }


    private func setupAvatarImage() {

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnAvatar))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)

        returnAvatarButton.alpha = 0
        returnAvatarButton.backgroundColor = .clear
        returnAvatarButton.contentMode = .scaleToFill
        returnAvatarButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))?.withTintColor(.black, renderingMode: .automatic), for: .normal)
        returnAvatarButton.tintColor = .black
        returnAvatarButton.addTarget(self, action: #selector(returnAvatarToOrigin), for: .touchUpInside)

        avatarBackground = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        avatarBackground.backgroundColor = .darkGray
        avatarBackground.isHidden = true
        avatarBackground.alpha = 0

        returnAvatarButton.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.trailing.equalTo(-16)
        }
    }

    @objc private func didTapOnAvatar() {
        avatarImageView.isUserInteractionEnabled = false

        ProfileViewController.newsTableView.isScrollEnabled = false
        ProfileViewController.newsTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false

        avatarOriginPoint = avatarImageView.center
        let scale = UIScreen.main.bounds.width / avatarImageView.bounds.width

        bringSubviewToFront(avatarImageView)

        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX,
                                                  y: UIScreen.main.bounds.midY - self.avatarOriginPoint.y)
            self.avatarImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarBackground.isHidden = false
            self.avatarBackground.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.returnAvatarButton.alpha = 1
            }
        }
    }

    @objc private func returnAvatarToOrigin() {
        UIImageView.animate(withDuration: 0.5) {
            UIImageView.animate(withDuration: 0.5) {
                self.returnAvatarButton.alpha = 0
                self.avatarImageView.center = self.avatarOriginPoint
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
                self.avatarBackground.alpha = 0
            }
        } completion: { _ in
            ProfileViewController.newsTableView.isScrollEnabled = true
            ProfileViewController.newsTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
            self.avatarImageView.isUserInteractionEnabled = true
        }
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

