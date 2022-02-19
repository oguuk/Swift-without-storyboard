//
//  CollectionHeaderCell.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import Foundation
import UIKit

class CollectionHeaderCell:UICollectionReusableView {
    
    //Mark: Properties
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 40)
        label.text = "Header"
        return label
    }()
    
    //MArk:Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Configures
    func configure(){
        backgroundColor = .systemBackground
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
