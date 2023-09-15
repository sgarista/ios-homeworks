
import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    var imagePublisherFacade = ImagePublisherFacade()

    var photos = [UIImage]()

    var photosCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false

        return photosCollectionView
    }()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationController?.navigationBar.isHidden = false

        imagePublisherFacade.addImagesWithTimer(time: 0.8, repeat: 40, userImages: photosImages)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupCollectionView()
        setupUI()
        imagePublisherFacade.subscribe(self)

        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
    }


    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

        imagePublisherFacade.removeSubscription(for: self)
        imagePublisherFacade.rechargeImageLibrary()
    }


    func addSubviews() {
        view.addSubview(photosCollectionView)
    }


    func setupCollectionView() {

        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }


    private func setupUI() {

        title = "Photo Gallery"
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}


extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(with: photo)

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (photosCollectionView.frame.width - 32) / 3
        return CGSize(width: width, height: width)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


extension PhotosViewController: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        
        self.photos = images
        photosCollectionView.reloadData()

    }
}
