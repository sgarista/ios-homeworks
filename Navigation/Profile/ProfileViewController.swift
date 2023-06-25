import UIKit

class ProfileViewController: UIViewController {


    var newsTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()




    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()
        setupTableView()

        newsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        newsTableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.headerID)

//        newsTableView.headerView(forSection: 0)
    }

    //    override func viewWillLayoutSubviews() {
    //
    //    }
    //




    private func setupView() {

        view.backgroundColor = .white
        title = "Profile"


    }


    private func addSubviews() {

        view.addSubview(newsTableView)
        setupTableView()
        setupConstraints()

    }

    private func setupConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            newsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }


    func setupTableView() {

        newsTableView.dataSource = self
        newsTableView.delegate = self

    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }

        let news = postArray[indexPath.row]
        cell.configure(with: news)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0, let headerView = newsTableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.headerID) as? ProfileTableHeaderView else {
            return nil
        }

        return headerView

    }
}
