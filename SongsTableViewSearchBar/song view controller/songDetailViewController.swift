//
//  songDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Mr Wonderful on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class songDetailViewController: UIViewController {

    var detailSongs:Song!
    @IBOutlet var detailSongName: UILabel!
    @IBOutlet var detailSongImage: UIImageView!
    @IBOutlet var detailSongArtist: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
detailSongName.text = detailSongs.name
        detailSongArtist.text = detailSongs.artist
        detailSongImage.image = UIImage(named: "loveSongs")
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
