//
//  ViewController.swift
//  Silent-Moon
//
//  Created by Vinícius Couto on 10/09/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Lazy views

    private lazy var button: RoundedButton = RoundedButton.createBlueButton(title: "SIGN UP")

    private lazy var anotherButton: RoundedButton = {
        let btn = RoundedButton()

        btn.titleText = "Novo titulo"
        btn.backgroundColorName = "whiteText"
        btn.titleColorName = "blue"

        return btn
    }()

    // MARK: - Ciclo de vida da vc

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Adiciona ação de pressionar o botão
        button.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)

        // Adiciona botões como subview
        view.addSubview(button)
        view.addSubview(anotherButton)

        // Define constraints pra auto layout
        let constraints = [
            button.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),

            anotherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            anotherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -RoundedButton.LayoutMetrics.buttonHorizontalPadding),
            anotherButton.heightAnchor.constraint(equalToConstant: RoundedButton.LayoutMetrics.buttonHeight),
            anotherButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: LayoutMetrics.distanceBetweenButtons)
        ]

        // Ativa as constraints e posiciona na tela
        NSLayoutConstraint.activate(constraints)
    }

    @objc private func signinButtonTapped() {
        print("usuario fez login")
    }

    // MARK: - Layout Metrics

    // Ajuda a dar nome e significado para as constantes numéricas, além de facilitar a reutilização e manutenção delas
    private enum LayoutMetrics {
        static let distanceBetweenButtons: CGFloat = 40
    }
}

