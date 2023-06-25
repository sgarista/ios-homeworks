import UIKit


class PostTableViewCell: UITableViewCell {
    
    static let  id = "PostTableViewCell"

    private var postTableCellContentView: UIView = {

        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()


    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel.font = .systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        
        return authorLabel
    }()
    
    private let postImageView: UIImageView = {
        var postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.clipsToBounds = true
        
        return postImageView
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        likesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.textAlignment = .right
        
        return viewsLabel
    }()
    
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with post: Post) {
        authorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    
    private func setupUI() {

        addSubview(postTableCellContentView)
        postTableCellContentView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(postImageView)
        postTableCellContentView.addSubview(descriptionLabel)
        postTableCellContentView.addSubview(likesLabel)
        postTableCellContentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([

            postTableCellContentView.topAnchor.constraint(equalTo: topAnchor),
            postTableCellContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            postTableCellContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postTableCellContentView.trailingAnchor.constraint(equalTo: trailingAnchor),





            authorLabel.topAnchor.constraint(equalTo: postTableCellContentView.topAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 40),
            
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: postTableCellContentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: postTableCellContentView.trailingAnchor, constant: -16),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: postTableCellContentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: postTableCellContentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: postTableCellContentView.leadingAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: postTableCellContentView.centerXAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: postTableCellContentView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.leadingAnchor.constraint(equalTo: postTableCellContentView.centerXAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: postTableCellContentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: postTableCellContentView.bottomAnchor, constant: -16)
            
        ])
    }
}
