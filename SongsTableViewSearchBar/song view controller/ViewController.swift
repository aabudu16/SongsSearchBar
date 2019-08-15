//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var song = Song.loveSongs
    @IBOutlet var songSearchBar: UISearchBar!
    @IBOutlet var songTextView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTextView.delegate = self
        songTextView.dataSource = self
        songSearchBar.delegate = self
    }
    
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

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let songDetailView = storyBoard.instantiateViewController(withIdentifier: "songStoryBoard-ID") as? songDetailViewController{
            
            songDetailView.detailSongs = song[indexPath.row]
          
            self.navigationController?.pushViewController(songDetailView, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

