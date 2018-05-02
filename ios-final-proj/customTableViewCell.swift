//
//  customTableViewCell.swift
//  PokedexLab
//
//  Created by Garrett Yamane on 3/14/18.
//  Copyright © 2018 iOS Decal. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonStats: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
