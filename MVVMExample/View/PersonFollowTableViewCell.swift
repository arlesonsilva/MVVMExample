//
//  PersonFollowTableViewCell.swift
//  MVVMExample
//
//  Created by Arleson Silva on 07/01/22.
//

import UIKit

protocol PersonFollowTableViewCellDelegate: AnyObject {
    func personFollowTableViewCellDelegate(_ cell: PersonFollowTableViewCell,
                                           didTapWith viewModel: PersonFollowTableViewCellViewModel)
}

class PersonFollowTableViewCell: UITableViewCell {

    static let indentifier = "PersonFollowTableViewCell"

    weak var delegate: PersonFollowTableViewCellDelegate?
    private var viewModel: PersonFollowTableViewCellViewModel?

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()

    private let button: UIButton = {
        let button = UIButton()
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc
    private func didTapButton() {
        guard let viewModel = viewModel else {
            return
        }
        var newViewModel = viewModel
        newViewModel.currentlyFollow = !viewModel.currentlyFollow
        delegate?.personFollowTableViewCellDelegate(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }

    func configure(with viewModel: PersonFollowTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollow {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: imageWidth,
                                     height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth + 10,
                                 y: 0,
                                 width: contentView.frame.size.width - imageWidth,
                                 height: contentView.frame.size.height / 2)
        usernameLabel.frame = CGRect(x: imageWidth + 10,
                                     y: contentView.frame.size.height / 2,
                                     width: contentView.frame.size.width - imageWidth,
                                     height: contentView.frame.size.height / 2)
        button.frame = CGRect(x: contentView.frame.size.width - 120,
                              y: 10,
                              width: 110,
                              height: contentView.frame.size.height - 20)
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}
