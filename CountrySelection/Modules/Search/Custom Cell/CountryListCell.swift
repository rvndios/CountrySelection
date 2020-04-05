//
//  CountryListCell.swift
//  CountrySelection
//
//  Created by user on 04/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
class CountryListCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewCountry: UIImageView!
    var data: Country! {
        didSet { loadData() }
    }
    /// Function to set data to table view cell
    func loadData() {
        labelName.text = data.name
        imageViewCountry.image(from: data.flag)
        self.selectionStyle = .none
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
