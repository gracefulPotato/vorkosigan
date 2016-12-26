//
//  DisplayViewController.swift
//  vorkosigan
//
//  Created by Grace O'Hair-Sherman on 12/18/16.
//  Copyright (c) 2016 Grace O'Hair-Sherman. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var omnibusTitle: UILabel!
    @IBOutlet weak var worksCollection: UICollectionView!
    let reuseIdentifier = "CategoryCell"
    var note: Omnibus! {
        didSet {
            displayOmnibus(self.note)
            println(self.note!.title)
        }
    }
    func displayOmnibus(note: Omnibus?) {
        println("in displayFood, title: "+self.note!.title)
        println("works: ")
        for i in 0..<self.note!.works.count{
            println(self.note!.works[i])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        println("in viewDidLoad")
        omnibusTitle!.text = self.note!.title
        displayOmnibus(self.note)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.note!.works.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier( reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        println("collectionView method")
        cell.backgroundColor = UIColor.whiteColor()
        var title = UILabel(frame: CGRectMake(cellWidth()/20, 0, cell.bounds.size.width, 40))
        title.text = self.note!.works[indexPath.row] //LOGIC ERROR
        cell.contentView.addSubview(title)
        return cell
    }
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        //var screenWidth = UIScreen.mainScreen().applicationFrame.size.width
        //layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        //layout.minimumInteritemSpacing = 0
        //layout.minimumLineSpacing = 0
        //collectionView.collectionViewLayout = layout
        var size = CGSize(width: cellWidth(), height: 40)
        return size
    }
    func cellWidth() -> CGFloat{
        var sizeRect = UIScreen.mainScreen().applicationFrame
        var width    = sizeRect.size.width
        var height   = sizeRect.size.height
        let cellWidth = (width/2 - 30)
        return cellWidth
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
