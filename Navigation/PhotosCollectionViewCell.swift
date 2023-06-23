
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"

    private var photoImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    override init(frame: CGRect) {
        super .init(frame: .zero)

        setupSubview()


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func setupSubview() {
        addSubview(photoImageView)
    }

    func setup(
        with photo: Photo
    ) {

        photoImageView.image = UIImage(named: photo.photo)
        //        profileImageView.image = UIImage(named: profile.imageName)
        //        nameLabel.text = profile.name
        //        locationLabel.text = profile.location
        //        professionLabel.text = profile.profession
    }
}


