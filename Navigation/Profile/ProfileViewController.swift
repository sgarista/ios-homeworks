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
        newsTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
    }


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

        newsTableView.sectionFooterHeight = 1
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postArray.count
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {

        case 0:
            let cell = newsTableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as! PhotosTableViewCell
            cell.configure(with: photosArray)

            return cell
        case 1:

            let cell = newsTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell

            let news = postArray[indexPath.row]
            cell.configure(with: news)

            return cell

        default:
            return UITableViewCell()
        }
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0, let headerView = newsTableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.headerID) as? ProfileTableHeaderView else {
            return nil
        }


        return headerView
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return tableView.sectionHeaderHeight
        }

        return 5
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}

