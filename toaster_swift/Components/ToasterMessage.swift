//
//  ToasterMessage.swift
//  toaster_swift
//
//  Created by achsum on 19/12/20.
//

import Foundation
import UIKit

class ToasterMessage: UIView {
    let toasterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    let lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    let lblMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var vc: UIViewController?
    private var title: String?
    private var message: String?
    private var isTop: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func setUpValues(in vc: UIViewController,  title: String = "",  message: String = "", backgroundColor: UIColor = .white,  titleColor: UIColor = .black,  messageColor: UIColor = .black,  isTop: Bool = true) {
        self.vc = vc
        self.title = title
        self.message = message
        self.toasterView.backgroundColor = backgroundColor
        self.lblTitle.textColor = titleColor
        self.lblMessage.textColor = messageColor
        self.isTop = isTop
        self.setUp()
        self.lblMessage.text = self.message ?? ""
        self.lblTitle.text = self.title ?? ""
        
        
        UIView.animate(withDuration: 1, delay: 0.1, options: [.curveLinear]) {
            self.toasterView.alpha = 1
            
        } completion: { (completion) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                if ((self.vc?.view.isDescendant(of: self.toasterView)) != nil){
                    self.toasterView.removeFromSuperview()
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deint")
    }
    
    private func setUp(){
        guard let vc = self.vc else {
            return
        }
        self.setUpToasterView(in: vc)
        self.setUpTitle(in: vc)
        self.setUpMessage(in: vc)
    }
    
    private func setUpToasterView(in vc: UIViewController){
        vc.view.addSubview(self.toasterView)
        if self.isTop {
            self.toasterView.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        }
        else {
            self.toasterView.bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        }
        self.toasterView.widthAnchor.constraint(equalTo: vc.view.widthAnchor, multiplier: 0.88).isActive = true
        self.toasterView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        let tmp = self.toasterView.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        tmp.isActive = true
        tmp.priority = UILayoutPriority(250)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.btClose(_:)))
        self.toasterView.addGestureRecognizer(tapGesture)
    }
    
    private func setUpTitle(in vc: UIViewController){
        self.toasterView.addSubview(self.lblTitle)
        self.lblTitle.topAnchor.constraint(equalTo: self.toasterView.topAnchor, constant: 10).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.toasterView.leadingAnchor, constant: 10).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.toasterView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    private func setUpMessage(in vc: UIViewController){
        self.toasterView.addSubview(self.lblMessage)
        self.lblMessage.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 2).isActive = true
        self.lblMessage.leadingAnchor.constraint(equalTo: self.toasterView.leadingAnchor, constant: 10).isActive = true
        self.lblMessage.trailingAnchor.constraint(equalTo: self.toasterView.trailingAnchor, constant: -10).isActive = true
        self.lblMessage.bottomAnchor.constraint(equalTo: self.toasterView.bottomAnchor, constant: -10).isActive = true
    }
    
    @IBAction func btClose(_: Any){
        if ((self.vc?.view.isDescendant(of: self.toasterView)) != nil){
            self.toasterView.removeFromSuperview()
        }
    }
}

