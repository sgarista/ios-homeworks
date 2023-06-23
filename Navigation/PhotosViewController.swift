
import UIKit

class PhotosViewController: UIViewController {

    var photosCollectionView: UICollectionView = {

        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)

        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false


        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)


        return photosCollectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupCollectionView()
        setupUI()
    }


    func addSubviews() {
        view.addSubview(photosCollectionView)
    }

    func setupCollectionView() {

        photosCollectionView.backgroundColor = .systemBackground

        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self

    }

    private func setupUI() {
        navigationController?.navigationBar.isHidden = false

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            photosCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            photosCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            photosCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            photosCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),

        ])
    }
}



extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell

        let photo = photosArray[indexPath.row]
        cell.setup(with: photo)


        return cell
    }
}
