//
//  ViewController.swift
//  CornerUIKit
//
//  Created by Adnan Joraid on 2024-06-27.
//

import UIKit
import SwiftUI

class ProfileImageView: UIView {
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 130),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupImage(_ image: UIImage?) {
        profileImageView.image = image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = self.frame.size.width / 2
    }
}

class ViewController: UIViewController {
    
    private var profileHeaderView: ProfileHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBackground()
        setupViews()
    }
    
    private func setupViewBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor(red: 222 / 255,
                    green: 223 / 255,
                    blue: 224 / 255,
                    alpha: 1.0).cgColor,
            UIColor(red: 202 / 255,
                    green: 204 / 255,
                    blue: 185 / 255,
                    alpha: 1.0).cgColor
        ]
        gradientLayer.locations = [0.0,
                                   0.5,
                                   1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupViews() {
        profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        
        let vc = UIHostingController(rootView: ProfileInfoView())
        let swiftUIView = vc.view!
        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
        swiftUIView.backgroundColor = view.backgroundColor
        view.addSubview(swiftUIView)
        
        let vc2 = UIHostingController(rootView: GridView())
        let gridSwiftUIView = vc2.view!
        gridSwiftUIView.translatesAutoresizingMaskIntoConstraints = false
        gridSwiftUIView.backgroundColor = view.backgroundColor
        view.addSubview(gridSwiftUIView)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            swiftUIView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            swiftUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            swiftUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            gridSwiftUIView.topAnchor.constraint(equalTo: swiftUIView.bottomAnchor, constant: 12),
            gridSwiftUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            gridSwiftUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            gridSwiftUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }
}
