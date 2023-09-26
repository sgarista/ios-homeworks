import UIKit


class CustomButton: UIButton {

    private var buttonAction: (() -> Void)?

    init(title: String? = nil, titleColor: UIColor? = nil, buttonAction: (() -> Void)? = nil) {
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        self.buttonAction = buttonAction
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonTapped() {
        buttonAction?()
    }
}
