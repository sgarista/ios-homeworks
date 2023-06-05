import UIKit

class InfoViewController: UIViewController {

    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()

    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("НАЖМИ!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 160, y: 250, width: 100, height: 50)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let glass = UIImage(named: "Glass") {
            view.backgroundColor = UIColor(patternImage: glass)
        } else {
            view.backgroundColor = .systemBlue
        }

        view.addSubview(alertButton)
        view.addSubview(infoButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0), infoButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 240.0), infoButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -320.0), infoButton.heightAnchor.constraint(equalToConstant: 44.0)])




        infoButton.addTarget(self, action: #selector(showInfoViewController(_:)), for: .touchUpInside)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

    }

    @objc func showInfoViewController(_ sender: UIButton) {
        dismiss(animated: true)

    }

    @objc func showAlert() {

        let alert = UIAlertController(title: "Стакан наполовину полон или пуст?", message: "Сделай свой выбор!", preferredStyle: .alert)

        let fullAlert = UIAlertAction(title: "Полон", style: .default) {_ in print("Вы оптимист")}
        alert.addAction(fullAlert)

        let emptyAlert = UIAlertAction(title: "Пуст", style: .cancel) {_ in print("Вы пессимист")}
        alert.addAction(emptyAlert)

        present(alert, animated: true, completion: nil)
    }

}
