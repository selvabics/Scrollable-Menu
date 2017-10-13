//
//  ViewController.swift
//  TabbarTop
//
//  Created by jayaraj on 11/04/17.
//  Copyright © 2017 sample. All rights reserved.
//

import UIKit
import Foundation
import CMTabbarView

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CMTabbarViewDelegate, CMTabbarViewDatasouce{

    @IBOutlet var collectionView1: UICollectionView?
    @IBOutlet var tabbarview : UIView?
    var tabbar : CMTabbarView?
    
    
    var dates = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabbar = CMTabbarView(frame: CGRect.init(x: 0, y: 20, width: Int(self.view.bounds.size.width), height: 41))
        tabbar?.backgroundColor = UIColor.white
        tabbar?.delegate = self
        tabbar?.dataSource = self
        tabbar?.defaultSelectedIndex = 2
        tabbar?.layer.shadowColor = UIColor.black.cgColor
        tabbar?.layer.shadowOpacity = 0.1
        tabbar?.layer.shadowOffset = CGSize.zero
        tabbar?.layer.shadowRadius = 5
        
        self.view.addSubview(tabbar!)
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.dates = ["Moyun","Penny","MoyunMoyun","M","Pe","Moy","Moyun","Penny","Swift","Objective-C","C++","JAVA","C"]
            self.collectionView1?.reloadData()
            self.tabbar?.reloadData()
            self.collectionView1?.contentOffset = CGPoint.init(x: self.view.bounds.width*2, y: 0)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        collectionView1?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dates.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
//        cell?.btnComment?.layer.cornerRadius = cell!.btnComment!.bounds.height/2
//        cell?.btnComment?.layer.borderWidth = 1
//        cell?.btnComment?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.subviews.forEach {
            $0.layer.masksToBounds = true
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowOffset = CGSize.zero
            $0.layer.shadowRadius = 5
        }
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView1!.bounds.width, height: collectionView1!.bounds.height)
    }

    func tabbarTitles(for tabbarView: CMTabbarView!) -> [String]! {
        return self.dates
    }
    func tabbarView(_ tabbarView: CMTabbarView!, didSelectedAt index: Int) {
        self.collectionView1?.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       tabbar?.tabbarOffsetX = scrollView.contentOffset.x / self.view.bounds.width
    }
    
}

