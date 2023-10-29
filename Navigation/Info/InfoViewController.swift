import UIKit


class InfoViewController: UIViewController {
    
    static var taskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Задание 1"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.cornerRadius = 10
        label.numberOfLines = 0
        
        return label
    }()


    static var planetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Задание 2"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.cornerRadius = 10
        label.numberOfLines = 0

        return label
    }()
    
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("НАЖМИ!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 160, y: 250, width: 100, height: 50)
        
        return button
    }()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupTaskLabel()
        setupPlanetLabel()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlertButton()
        
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        
        view.backgroundColor = .white
        
        view.addSubview(InfoViewController.taskLabel)
        view.addSubview(InfoViewController.planetLabel)
        
        setupConstraints()

    }
    
    
    func setupConstraints() {
        
        
        let safeAreaLG = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            InfoViewController.taskLabel.leadingAnchor.constraint(equalTo: safeAreaLG.leadingAnchor, constant: 10),
            InfoViewController.taskLabel.trailingAnchor.constraint(equalTo: safeAreaLG.trailingAnchor, constant: -10),
            InfoViewController.taskLabel.centerYAnchor.constraint(equalTo: safeAreaLG.centerYAnchor),

            InfoViewController.planetLabel.topAnchor.constraint(equalTo: InfoViewController.taskLabel.bottomAnchor, constant: 40),
            InfoViewController.planetLabel.leadingAnchor.constraint(equalTo: InfoViewController.taskLabel.leadingAnchor),
            InfoViewController.planetLabel.trailingAnchor.constraint(equalTo: InfoViewController.taskLabel.trailingAnchor)


            
            
        ])
    }
    
    
    func setupAlertButton() {
        
        view.addSubview(alertButton)
    }


    func setupPlanetLabel() {

        let planetConfiguration: PlanetConfiguration = PlanetConfiguration.planet
        PlanetNetworkService.request(for: planetConfiguration)

    }


    func setupTaskLabel() {

        let appConfiguration: AppConfiguration = AppConfiguration.allCases.randomElement() ?? .first
        NetworkService.request(for: appConfiguration)

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
