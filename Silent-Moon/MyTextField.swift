//
//  MyTextField.swift
//  Silent-Moon
//
//  Created by Vinícius Couto on 24/09/21.
//

import UIKit

class MyTextField: UITextField {

    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "textFieldBG")
        layer.cornerRadius = 15
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView = paddingView
        leftViewMode = .always
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
