//
//  ViewController.swift
//  toaster_swift
//
//  Created by achsum on 19/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let btClose: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("    Show Toaster Message    ", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.btClose)
        self.btClose.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.btClose.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.btClose.addTarget(self, action: #selector(self.btClose(_:)), for: .touchUpInside)
        
        
    }
    
    @IBAction func btClose(_: Any){
        print("Hey")
        let tmp = ToasterMessage()
//        tmp.setUpValues(in: self, title: "Success", message: "Your details updated successfully", backgroundColor: .black,titleColor: .green, messageColor: .white ,isTop: true)
        
        tmp.setUpValues(in: self, title: "Success", message: "Your details updated successfully", backgroundColor: .black,titleColor: .green, messageColor: .white ,isTop: false)
        
//        tmp.setUpValues(in: self, title: "Failed", message: "Check your email address and password", backgroundColor: .black,titleColor: .red, messageColor: .white ,isTop: true)
        
//        tmp.setUpValues(in: self, title: "Failed", message: "Check your email address and password", backgroundColor: .black,titleColor: .red, messageColor: .white ,isTop: false)
    }


}

