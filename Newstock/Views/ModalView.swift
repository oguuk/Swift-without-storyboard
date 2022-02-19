//
//  ModalView.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import UIKit

protocol ModalViewDelegate {
    func closeButtonTapped()
}

class ModalView:UIView {
    
    //Mark: Properties
    var delegate:ModalViewDelegate?
    
    lazy var closeBtn:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Close", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //Mark: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Selectors
    @objc func closeButtonTapped(){
        delegate?.closeButtonTapped()
    }
    
    
    //Mark: Configure
    
    func configureViewComponents(){
        backgroundColor = .systemBackground
        layer.cornerRadius = 8
        
        addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        closeBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -50).isActive = true
    }
}
