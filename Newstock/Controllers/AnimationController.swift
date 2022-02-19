//
//  AnimationController.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import UIKit

class AnimationController:UIViewController{
    
    //Mark: Properties
    lazy var notiBtn:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Click", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(BtnTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var modalView:ModalView = {
       let view = ModalView()
        return view
    }()
    
    lazy var blurEffectView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    //Mark: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    //Mark: Selectors
    @objc func BtnTapped(){
        openModal()
    }
    
    //Mark: Helpers
    func closeModal(){
        UIView.animate(withDuration: 0.3, animations: {
            self.modalView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.blurEffectView.alpha = 0
        }) { (_) in
            self.modalView.removeFromSuperview()
        }
    }

    func openModal(){
        view.addSubview(modalView)
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25).isActive = true
        modalView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.8).isActive = true
        modalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        modalView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        modalView.delegate = self
        
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 1
            self.modalView.transform = CGAffineTransform.identity
        }
    }
    
    //Mark: Configures
    func configure(){
        configureViewComponents()
    }
    
    func configureViewComponents(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(notiBtn)
        notiBtn.translatesAutoresizingMaskIntoConstraints = false
        notiBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notiBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurEffectView.alpha = 0
        
    }
}

extension AnimationController: ModalViewDelegate {
    func closeButtonTapped() {
        closeModal()
    }
}
