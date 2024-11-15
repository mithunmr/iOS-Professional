//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Mithun M R on 15/11/24.
//


import UIKit

class OnboardingViewController: UIViewController {
    let closeButton = UIButton()
    let stackView = UIStackView()
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let prevButton = UIButton()
    let nextButton = UIButton()

    let imageName: String
    let imageDescription: String

    init(imageName: String, description: String) {
        self.imageName = imageName
        self.imageDescription = description

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OnboardingViewController {
    private func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.titleLabel?.text = "Close"
        closeButton.backgroundColor = .blue

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = imageDescription

        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.titleLabel?.text = "Previous"
        nextButton.backgroundColor = .red

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.text = "Next"
        nextButton.backgroundColor = .green
    }

    private func layout() {
        view.addSubview(closeButton)
        view.addSubview(stackView)
        view.addSubview(prevButton)
        view.addSubview(nextButton)


        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            prevButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: prevButton.bottomAnchor, multiplier: 1)

        ])

        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: prevButton.bottomAnchor, multiplier: 1)

        ])

    }
}
