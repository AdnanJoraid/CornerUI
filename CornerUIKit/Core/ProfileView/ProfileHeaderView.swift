//
//  ProfileHeaderView.swift
//  CornerUIKit
//
//  Created by Adnan Joraid on 2024-06-27.
//

import UIKit
class ProfileHeaderView: UIView {
    private var profileImageView: ProfileImageView!
    
    private let username: UILabel = {
        let label = UILabel()
        label.text = "Dylan Dabrowski"
        label.font = UIFont(name: "Phonk Regular DEMO", size: 18)
        label.textColor = UIColor(red: 65 / 255,
                                  green: 65 / 255,
                                  blue: 66 / 255,
                                  alpha: 1.0)
        return label
    }()
    
    private let userTag: UILabel = {
        let label = UILabel()
        label.text = "@dylan"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 121 / 255,
                                  green: 121 / 255,
                                  blue: 123 / 255,
                                  alpha: 1.0)
        return label
    }()
    
    private let bioTextView: UITextView = {
       let tv = UITextView()
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textContainerInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        tv.textColor = UIColor(red: 76 / 255,
                               green: 76 / 255,
                               blue: 76 / 255,
                               alpha: 1.0)
        tv.text = "born in new york • traveling the world • hamon master and adventure seeker"
        return tv
    }()
    
    private let locationTextView: UITextView = {
        let locationTextView = UITextView()
        locationTextView.backgroundColor = .clear
        locationTextView.isEditable = false
        locationTextView.isScrollEnabled = false
        locationTextView.textContainerInset = .zero
        locationTextView.textContainer.lineFragmentPadding = 0
        locationTextView.attributedText = createAttributedString()
        return locationTextView
    }()
    
    private static func createAttributedString() -> NSAttributedString {
        let imageAttachment = NSTextAttachment()
        if let image = UIImage(systemName: "mappin.and.ellipse") {
            imageAttachment.image = image.withTintColor(UIColor(red: 169 / 255,
                                                                green: 169 / 255,
                                                                blue: 169 / 255,
                                                                alpha: 1.0))
            imageAttachment.bounds = CGRect(x: 0, y: -3, width: image.size.width, height: image.size.height)
        }
        
        let attributedString = NSMutableAttributedString(attachment: imageAttachment)
        
        attributedString.append(NSAttributedString(string: " "))
        
        let text = "new york city"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .medium),
            .foregroundColor: UIColor(red: 169 / 255,
                                      green: 169 / 255,
                                      blue: 169 / 255,
                                      alpha: 1.0)
        ]
        let textAttributedString = NSAttributedString(string: text, attributes: attributes)
        attributedString.append(textAttributedString)
        
        return attributedString
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        profileImageView = ProfileImageView()
        profileImageView.setupImage(UIImage(named: "dylan"))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(profileImageView)
        addSubview(username)
        addSubview(userTag)
        addSubview(bioTextView)
        addSubview(locationTextView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        username.translatesAutoresizingMaskIntoConstraints = false
        userTag.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        locationTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            username.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            username.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            userTag.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 8),
            userTag.leadingAnchor.constraint(equalTo: username.leadingAnchor),
            
            bioTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            bioTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bioTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            locationTextView.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 8),
            locationTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    func setupImage(_ image: UIImage?) {
        profileImageView.setupImage(image)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = self.frame.size.width / 2
    }
}
