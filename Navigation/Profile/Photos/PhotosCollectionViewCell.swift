
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"

    private var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()


    override init(frame: CGRect) {
        super .init(frame: .zero)

        setupSubview()
        setupLayouts()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupSubview() {

        contentView.addSubview(photoImageView)
    }


    private func setupLayouts() {

        let imageViewWidth = (UIScreen.main.bounds.width - 32) / 3
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: imageViewWidth),
            photoImageView.widthAnchor.constraint(equalToConstant: imageViewWidth)
        ])
    }


    func setup(with image: UIImage) {
        
        photoImageView.image = image

    }
}


