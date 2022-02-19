//
//  TableCell.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
// NAvigationViewController로 view 구현하기

import UIKit

class TalbeCell:UITableViewCell{
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
    
    //Mark: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
