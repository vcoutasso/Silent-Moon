//
//  SignFormViewController.swift
//  Silent-Moon
//
//  Created by Vinícius Couto on 17/09/21.
//

import UIKit

class SignFormViewController: UIViewController {

    // MARK: - Attributes

    var type: SignType

    // MARK: - Lazy views

    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "BG Tela2")
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false

        return iv
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // Operador ternário -> (pergunta) ? se sim : se não
        label.text = (type == .signin) ? "Welcome Back!" : "Create your account"
        label.font = .systemFont(ofSize: LayoutMetrics.titleFontSize, weight: .bold)
        label.textColor = UIColor(named: "black")

        return label
    }()

    private lazy var facebookButton: RoundedButton = {
        .createBlueButton(title: "CONTINUE WITH FACEBOOK")
    }()

    private lazy var googleButton: RoundedButton = {
        .createWhiteButton(title: "CONTINUE WITH GOOGLE")
    }()

    private lazy var usernameTextField: MyTextField = {
        .init(placeholder: "Username")
    }()

    private lazy var emailTextField: MyTextField = {
        .init(placeholder: "Email address")
    }()

    private lazy var passwordTextField: MyTextField = {
        .init(placeholder: "Password")
    }()

    private lazy var logInButton: RoundedButton = {
        .createBlueButton(title: (type == .signin) ? "LOG IN" : "GET STARTED")
    }()


    // MARK: - Initialization

    init(type: SignType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Private methods

    private func setupViews() {
        view.backgroundColor = .white

        setupBackgroundImageView()
        setupTitleLabel()
        setupFacebookButton()
        setupGoogleButton()
        setupUsernameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupLogInButton()
    }

    private func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)

        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutMetrics.titleTopOffset)
        ])
    }

    private func setupFacebookButton() {
        view.addSubview(facebookButton)

        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutMetrics.facebookButtonTopOffset),
            facebookButton.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupGoogleButton() {
        view.addSubview(googleButton)

        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: LayoutMetrics.googleButtonTopOffset),
            googleButton.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupUsernameTextField() {
        if type == .signup {
            view.addSubview(usernameTextField)

            NSLayoutConstraint.activate([
                usernameTextField.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: LayoutMetrics.googleButtonTopOffset),
                usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
                usernameTextField.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight)
            ])
        }
    }

    private func setupEmailTextField() {
        view.addSubview(emailTextField)

        switch type {
        case .signin:
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: LayoutMetrics.googleButtonTopOffset),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            emailTextField.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight)
        ])
        case .signup:
            NSLayoutConstraint.activate([
                emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: LayoutMetrics.googleButtonTopOffset),
                emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
                emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
                emailTextField.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight)
            ])
        }
    }

    private func setupPasswordTextField() {

        view.addSubview(passwordTextField)

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: LayoutMetrics.googleButtonTopOffset),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            passwordTextField.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight)
        ])
    }

    private func setupLogInButton() {
        view.addSubview(logInButton)

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            logInButton.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight)
        ])
    }

    // MARK: - Enumerations

    enum SignType {
        case signin
        case signup
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let titleFontSize: CGFloat = 28
        static let titleTopOffset: CGFloat = 133
        static let facebookButtonTopOffset: CGFloat = 33
        static let googleButtonTopOffset: CGFloat = 20
    }
}
