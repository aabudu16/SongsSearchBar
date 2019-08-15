//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var song = Song.loveSongs
    
    @IBOutlet var songSearchBar: UISearchBar!
    @IBOutlet var songTextView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell"){
       let info = song[indexPath.row]
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = info.artist
        
        return cell
    }
       return UITableViewCell()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTextView.delegate = self
        songTextView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

