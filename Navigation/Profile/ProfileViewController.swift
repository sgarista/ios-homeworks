import UIKit
import StorageService

class ProfileViewController: UIViewController {


   static var currentUser: User?


   static var newsTableView: UITableView = {
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

        Self.newsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        Self.newsTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.headerID)
        Self.newsTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
    }


    private func setupView() {

        title = "Profile"
    }


     func addSubviews() {

         view.addSubview(Self.newsTableView)
        setupTableView()
        setupConstraints()
    }


     func setupConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            Self.newsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            Self.newsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            Self.newsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            Self.newsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }


    func setupTableView() {

        Self.newsTableView.dataSource = self
        Self.newsTableView.delegate = self
        Self.newsTableView.sectionFooterHeight = 1


#if DEBUG
        Self.newsTableView.backgroundColor = .systemTeal
#else
        Self.newsTableView.backgroundColor = .white
#endif


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
            let cell = Self.newsTableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as! PhotosTableViewCell
            cell.configure(with: photosArray)

            return cell
        case 1:

            let cell = Self.newsTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell

            let news = postArray[indexPath.row]
            cell.configure(with: news)

            return cell

        default:
            return UITableViewCell()
        }
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0, let headerView = Self.newsTableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.headerID) as? ProfileHeaderView else {
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

