//
//  TableViewController.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import UIKit

private let reuseableIdentifire = "cell"

class TableViewController:UITableViewController{
    //Mark: Properties
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    //Mark: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //Mark: Configures
    func configure(){
        tableView.register(TalbeCell.self, forCellReuseIdentifier: reuseableIdentifire)
    }
    
}
//Mark: TableViewController Delegate and Datasource functions
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifire, for : indexPath) as! TalbeCell
        let item = self.items[indexPath.row]
        cell.item = item
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3{
            return 200
        } else{
            return 100
        }
        
    }
}
