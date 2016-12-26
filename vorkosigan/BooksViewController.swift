//
//  ViewController.swift
//  vorkosigan
//
//  Created by Grace O'Hair-Sherman on 12/11/15.
//  Copyright (c) 2015 Grace O'Hair-Sherman. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    let bookTitles: [String] = ["\"Dreamweaver\'s Dilemma\"","Falling Free","Shards of Honor","\"Aftermaths\"","Barrayar","The Warrior's Apprentice","\"The Mountains of Mourning\"", "The Vor Game","Cetaganda","Ethan of Athos","\"Labyrinth\"","\"The Borders of Infinity\"","Brothers in Arms","Borders of Infinity","Mirror Dance","Memory","Komarr","A Civil Campaign","\"Winterfair Gifts\"","Diplomatic Immunity","Captain Vorpatril's Alliance","Cryoburn","Gentleman Jole and the Red Queen"]
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<bookTitles.count{
            let tmpBook : Book = Book(title: bookTitles[i],num: i)
            books.append(tmpBook)
        }
        for i in 0..<books.count{
            println(books[i].title)
            println(books[i].imgName)
        }
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension BooksViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCell", forIndexPath: indexPath) as! BookTableViewCell //1
        
        let row = indexPath.row
        cell.nameLabel?.text = books[row].title
        cell.coverImg.image = UIImage(named:books[row].imgName)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(bookTitles.count)
        return Int(bookTitles.count)
        
    }
    
}