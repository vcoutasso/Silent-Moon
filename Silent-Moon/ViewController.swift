//
//  ViewController.swift
//  Silent-Moon
//
//  Created by Vinícius Couto on 10/09/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Lazy views

    private lazy var signUpButton: RoundedButton = RoundedButton.createBlueButton(title: "SIGN UP")

    private lazy var backgroundIV: UIImageView = {
        let image = UIImage(named: "BG Tela1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var ilustraIV: UIImageView = {
        let image = UIImage(named: "Ilustra_Tela1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var logoIV: UIImageView = {
        let image = UIImage(named: "Silent Moon Logo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleStackView: UIStackView = {
        let title = UILabel()
        title.text = "We are what we do"
        title.font = .systemFont(ofSize: 30, weight: .bold)
        title.textColor = UIColor(named: "black")

        let subtitle = UILabel()
        subtitle.text = "Thousands of people are using silent moon for small meditations"
        subtitle.font = .systemFont(ofSize: 16, weight: .light)
        subtitle.textColor = UIColor(named: "gray")
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [title, subtitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 30

        return stack
    }()

    private lazy var loginButton: UIButton = {
        let btn = UIButton()

        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ALREADY HAVE AN ACCOUNT? LOG IN", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(UIColor(named: "blue"), for: .normal)
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return btn
    }()

    // MARK: - Ciclo de vida da vc

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    // MARK: - Private methods

    private func setupViews() {
        view.backgroundColor = .white

        // Adiciona ação de pressionar o botão
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    private func setupHierarchy() {
        // Adiciona botões como subview
        view.addSubview(signUpButton)
        view.addSubview(backgroundIV)
        view.addSubview(ilustraIV)
        view.addSubview(logoIV)
        view.addSubview(titleStackView)
        view.addSubview(loginButton)
    }

    private func setupConstraints() {
        // Define constraints pra auto layout
        let constraints = [
            backgroundIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor),

            ilustraIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ilustraIV.bottomAnchor.constraint(equalTo: backgroundIV.topAnchor, constant: LayoutMetrics.ilustraOffset),

            logoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoIV.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutMetrics.logoTopOffset),

            titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleStackView.topAnchor.constraint(equalTo: backgroundIV.bottomAnchor, constant: 15),
            titleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutMetrics.titleHorizontalPadding),
            titleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutMetrics.titleHorizontalPadding),


            signUpButton.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: LayoutMetrics.signUpButtonBottomOffset),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
        ]

        // Ativa as constraints e posiciona na tela
        NSLayoutConstraint.activate(constraints)
    }

    @objc private func signUpButtonTapped() {
        // FIXME: não é modal, precisamos usar navigation controller
        present(SignFormViewController(), animated: true, completion: nil)
        print("usuario fez signup")
    }

    @objc private func loginButtonTapped() {
        print("usuario fez login")
    }

    // MARK: - Layout Metrics

    // Ajuda a dar nome e significado para as constantes numéricas, além de facilitar a reutilização e manutenção delas
    private enum LayoutMetrics {
        static let distanceBetweenButtons: CGFloat = 40
        static let ilustraOffset: CGFloat = 400
        static let logoTopOffset: CGFloat = 80
        static let signUpButtonBottomOffset: CGFloat = -128
        static let titleHorizontalPadding: CGFloat = 58
    }
}

