//
//  CollectionCell.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
// CollectionViewController로 view 구현하기

import UIKit

class CollectionCell:UICollectionViewCell {
    
    //Mark: Properties
    var item:String? {
        didSet {
            self.label.text = item
        }
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Configures
    func configures(){
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
}
