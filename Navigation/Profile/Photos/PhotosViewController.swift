import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    var photosCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false

        return photosCollectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupCollectionView()
        setupUI()

        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)


        ImageProcessor().processImagesOnThread(sourceImages: photosImages, filter: .chrome, qos: .default) { [weak self] images in
                 photosImages = images
                     .compactMap { $0 }
                     .map { UIImage(cgImage: $0) }
                 DispatchQueue.main.async {
                     self?.photosCollectionView.reloadData()
                 }
             }
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationController?.navigationBar.isHidden = false
    }


    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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

        photosImages.count
        
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        let photo = photosImages[indexPath.row]
        cell.setup(with: photo )

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
