//
//  ViewController.swift
//  WidgetExample
//
//  Created by monkey on 2021/4/14.
//

import UIKit
import WidgetKit

class ViewController: UIViewController {

    private lazy var field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text..."
        field.backgroundColor = .white
        field.becomeFirstResponder()
        return field
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        view.addSubview(field)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        field.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 40, height: 52)
        
        button.frame = CGRect(x: 30, y: field.frame.maxY + 10, width: view.frame.size.width - 60, height: 52)
    }
}

extension ViewController {
    
    @objc func didTapBtn(_ sender: UIButton) {

        let userDefaults = UserDefaults(suiteName: "group.gyjwidgetcache")
        
        field.resignFirstResponder()
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        userDefaults?.setValue(text, forKey: "text")
        
        WidgetCenter.shared.reloadAllTimelines()
    }
}
