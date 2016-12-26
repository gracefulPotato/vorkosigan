//
//  OmnibusViewController.swift
//  vorkosigan
//
//  Created by Grace O'Hair-Sherman on 12/20/15.
//  Copyright (c) 2015 Grace O'Hair-Sherman. All rights reserved.
//

import UIKit

class OmnibusViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var omnibusTableView: UITableView!
    let omnibusTitles: [String] = ["Cordelia's Honor","Test of Honor","Young Miles","Miles, Mystery and Mayhem","Miles, Mutants, and Microbes","Miles Errant","Miles in Love"]
    let omnibusWorks: [[String]] = [["Shards of Honor","Barrayar"],[],["The Warrior's Apprentice","\"The Mountains of Mourning\"", "The Vor Game"],["Cetaganda","Ethan of Athos","\"Labyrinth\""],[],[],[]]
    var omnibuses: [Omnibus] = []
    var selectedVolume: Omnibus!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<omnibusTitles.count{
            let tmpOmnibus : Omnibus = Omnibus(title: omnibusTitles[i],num: i)
            var tmpWorks = [String]()
            for j in 0..<omnibusWorks[i].count{
                tmpWorks.append(omnibusWorks[i][j])
            }
            tmpOmnibus.works = tmpWorks
            omnibuses.append(tmpOmnibus)
        }
        for i in 0..<omnibuses.count{
            println(omnibuses[i].title)
        }
        omnibusTableView.dataSource = self
        omnibusTableView.delegate = self
        omnibusTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("SelectedVolume2: ")
        println(selectedVolume)
        if (segue.identifier == "showOmnibusContents") {
            let myViewController = segue.destinationViewController as! DisplayViewController
            myViewController.note = selectedVolume
            println("SelectedVolume3: ")
            println(selectedVolume)
        }
    }
    func tableView(omnibusTableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectRowAtIndexPath");
        selectedVolume = omnibuses[indexPath.row]
        println("SelectedVolume1: ")
        println(selectedVolume)
        self.performSegueWithIdentifier("showOmnibusContents", sender: self)
    }
}
//extension OmnibusViewController: UITableViewDelegate{
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        selectedVolume = omnibuses[indexPath.row]
//        println("SelectedVolume1: ")
//        println(selectedVolume)
//        self.performSegueWithIdentifier("showOmnibusContents", sender: self)
//    }
//}
extension OmnibusViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OmnibusCell", forIndexPath: indexPath) as! OmnibusTableViewCell //1
        
        let row = indexPath.row
        cell.nameLabel?.text = omnibuses[row].title
        cell.coverImg.image = UIImage(named:omnibuses[row].imgName)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(omnibusTitles.count)
        return Int(omnibuses.count)
        
    }
    
}
