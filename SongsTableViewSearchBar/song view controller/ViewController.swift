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
    @IBOutlet var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTableView.delegate = self
        songTableView.dataSource = self
        songSearchBar.delegate = self
    }
    
    var songSeachResults:[Song] {
        get{
            guard let searchSongString = searchSongString else {
                return song
            }
            guard searchSongString != "" else {
                return song
            }
            
            if let scoptTitles = songSearchBar.scopeButtonTitles {
                let currentScopeIndex = songSearchBar.selectedScopeButtonIndex
                
                switch scoptTitles[currentScopeIndex]{
                case "Songs":
                    return song.filter({$0.name.contains(searchSongString)})
                case "Artist":
                    return
                        song.filter({$0.artist.contains(searchSongString)})
                default:
                    return song
                }
            }
            return song
        }
    }
    //used to store values of persons and reload the tableView each time
    
    var searchSongString:String? = nil {
        didSet {
            self.songTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSeachResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell"){
       let info = songSeachResults[indexPath.row]
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = info.artist
        
        return cell
    }
       return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let songDetailView = storyBoard.instantiateViewController(withIdentifier: "songStoryBoard-ID") as? songDetailViewController{
            
            songDetailView.detailSongs = songSeachResults[indexPath.row]
          
            self.navigationController?.pushViewController(songDetailView, animated: true)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchSongString = searchBar.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

