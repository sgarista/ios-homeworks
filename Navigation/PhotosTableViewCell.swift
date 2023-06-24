

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let  id = "PhotosTableViewCell"
    
    private var photosHeaderLabel: UILabel = {
        let photosHeaderLabel = UILabel()
        photosHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        photosHeaderLabel.textColor = .black
        photosHeaderLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        return photosHeaderLabel
    }()
    
    
    private var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return arrowImageView
    }()
    
    
    private var firstPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    private var secondPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    private var thirdPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    private var fourthPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubviews() {
        
        addSubview(photosHeaderLabel)
        addSubview(arrowImageView)
        addSubview(firstPhotoImageView)
        addSubview(secondPhotoImageView)
        addSubview(thirdPhotoImageView)
        addSubview(fourthPhotoImageView)
    }
    
    
    func configure(with photo: [Photo]) {
        
        photosHeaderLabel.text = "Photos"
        arrowImageView.image = UIImage(systemName: "arrow.forward")
        firstPhotoImageView.image = UIImage(named: photo[0].photo)
        secondPhotoImageView.image = UIImage(named: photo[1].photo)
        thirdPhotoImageView.image = UIImage(named: photo[2].photo)
        fourthPhotoImageView.image = UIImage(named: photo[3].photo)
    }
    
    
    private func setupUI() {
        
        let imageViewWidth = (UIScreen.main.bounds.width - 48) / 4
        
        NSLayoutConstraint.activate([
            photosHeaderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            arrowImageView.centerYAnchor.constraint(equalTo: photosHeaderLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            firstPhotoImageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
            firstPhotoImageView.heightAnchor.constraint(equalToConstant: imageViewWidth),
            firstPhotoImageView.topAnchor.constraint(equalTo: photosHeaderLabel.bottomAnchor, constant: 16),
            firstPhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            firstPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            secondPhotoImageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
            secondPhotoImageView.heightAnchor.constraint(equalToConstant: imageViewWidth),
            secondPhotoImageView.leadingAnchor.constraint(equalTo: firstPhotoImageView.trailingAnchor, constant: 8),
            secondPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            thirdPhotoImageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
            thirdPhotoImageView.heightAnchor.constraint(equalToConstant: imageViewWidth),
            thirdPhotoImageView.leadingAnchor.constraint(equalTo: secondPhotoImageView.trailingAnchor, constant: 8),
            thirdPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            fourthPhotoImageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
            fourthPhotoImageView.heightAnchor.constraint(equalToConstant: imageViewWidth),
            fourthPhotoImageView.leadingAnchor.constraint(equalTo: thirdPhotoImageView.trailingAnchor, constant: 8),
            fourthPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            fourthPhotoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}

