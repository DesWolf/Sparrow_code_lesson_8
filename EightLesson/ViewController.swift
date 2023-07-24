//
//  ViewController.swift
//  EightLesson
//
//  Created by Максим Окунеев on 24.07.2023.
//

import UIKit

//На экране UINavigationController с большим заголовком и скрол вью. Справа от заголовка картинка аватара.
//
//- Картинка SF Symbols person.crop.circle.fill. Размер 36x36pt.
//- Картинка двигается и обрезается вместе с заголовком.

class ViewController: UIViewController, UIScrollViewDelegate {
    let grayColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)

    lazy var logoImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.tertiarySystemFill, renderingMode: .alwaysOriginal))

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = grayColor

        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        self.view.backgroundColor = grayColor
        
        if let navigationBar = self.navigationController?.navigationBar {
            
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.backgroundColor = .white
            navigationBar.standardAppearance = standardAppearance
            
            let scrollAppearance = UINavigationBarAppearance()
            scrollAppearance.backgroundColor = grayColor
            navigationBar.scrollEdgeAppearance = scrollAppearance

            self.navigationItem.title = "Avatar"
            navigationItem.largeTitleDisplayMode = .automatic
            navigationBar.clipsToBounds = true
            
            navigationBar.prefersLargeTitles = true
            navigationBar.sizeToFit()

            navigationBar.addSubview(logoImageView)

            logoImageView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                logoImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -15),
                logoImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -8),
                logoImageView.topAnchor.constraint(greaterThanOrEqualTo: navigationBar.topAnchor, constant:  52),
                logoImageView.heightAnchor.constraint(equalToConstant: 36),
                logoImageView.widthAnchor.constraint(equalToConstant: 36)
            ])
        }

        self.view.addSubview(scrollView)

        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 100)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            self.view.backgroundColor = .white
        } else {
            self.view.backgroundColor = grayColor
        }
    }
}
