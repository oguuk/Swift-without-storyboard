//
//  CollectionViewController.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/19.
//

import UIKit

private let collectionCellIdentifier = "cell"
private let collectionHeaderCellIdentifier = "header"

class CollectionViewController:UICollectionViewController {
    
    //Mark: Properties
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    //Mark: Configures
    func configure(){
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)

        collectionView.register(CollectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionHeaderCellIdentifier)
    }
}

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  collectionCellIdentifier, for: indexPath) as! CollectionCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderCellIdentifier, for: indexPath) as! CollectionHeaderCell
        
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: (view.frame.width / 3) - 2, height: (view.frame.width / 3) - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.width / 3) * 2)
    }
}
