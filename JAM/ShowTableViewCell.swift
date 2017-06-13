//
//  ShowTableViewCell.swift
//  JAM
//
//  Created by Lucien on 5/18/17.
//  Copyright © 2017 Lucien. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ShowTableViewCell: UITableViewCell {
    
    @IBOutlet var profile: UIButton!
    @IBOutlet var showName: UILabel!
    @IBOutlet var showDis: UILabel!
    @IBOutlet var showTime: UILabel!
    @IBOutlet var showLocation: UILabel!
    @IBOutlet var showGenre: UILabel!
    
    var videoName: String?
    var playerController = AVPlayerViewController()
    var player: AVPlayer?
    
    var show: Show!{
        didSet{
            profile.setImage(imageCover(img: show.img!), for: .normal)
            showName.text = show.name
            showDis.text = show.distance
            showTime.text = show.time
            showLocation.text = show.location
            showGenre.text = show.genre
            videoName = show.vid
        }
    }
    
    func imageCover(img: String)->UIImage?{
        let imgName = "\(img)"
        print(imgName)
        return UIImage(named: imgName)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
