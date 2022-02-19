//
//  ScrollViewController.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import UIKit

class ScrollViewController:UIViewController {
    
    //MarK: Properties
    lazy var scrollView:UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .systemBackground
        v.contentSize = CGSize(width: view.frame.width, height: 2000)
        return v
    }()
    
    lazy var labelOne:UILabel = {
        let label = UILabel()
        label.text = "Top"
        return label
    }()
    
    lazy var labelTwo:UILabel = {
        let label = UILabel()
        label.text = "Bottom"
        return label
    }()
    
    //Mark:Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    //Mark: Configure
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(labelOne)
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        labelOne.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 70).isActive = true
        labelTwo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
    }
}
