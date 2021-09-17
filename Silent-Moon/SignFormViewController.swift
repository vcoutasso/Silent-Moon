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
        setupHierarchy()
        setupConstraints()
    }

    // MARK: - Private methods

    private func setupViews() {
        view.backgroundColor = .white
    }

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutMetrics.titleTopOffset)
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
    }
}
