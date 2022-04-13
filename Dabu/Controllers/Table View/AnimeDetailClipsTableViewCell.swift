//
//  AnimeDetailClipsTableViewCell.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 11/04/22.
//

import UIKit

class AnimeDetailClipsTableViewCell: UITableViewCell {

    @IBOutlet weak var myAnimeDetailClipThumbnail: UIImageView!
    @IBOutlet weak var myAnimeDetailClipTitle: UILabel!
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        let bgColorView = UIView()
        bgColorView.backgroundColor =  hexStringToUIColor(hex: "#454258")
        self.selectedBackgroundView = bgColorView
    }

}
