//
//  CountryDetailsVC.swift
//  CountrySelection
//
//  Created by user on 04/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import UIKit
class CountryDetailsViewController : UIViewController {
    @IBOutlet weak var labelCountryName: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var labelRegion: UILabel!
    @IBOutlet weak var labelTimeZone: UILabel!
    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    var selectedData: Country!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageFlag.image(from: selectedData.flag, size: CGSize(width: 400, height: 400))//imageFlag.frame.size)
        labelCountryName.text = selectedData.name + " - " + selectedData.capital + " (+" + selectedData.callingCodes.joined(separator: ", ") + ")"
        labelRegion.text = selectedData.region + ", " + selectedData.subregion
        labelTimeZone.text = "Time Zone : " + selectedData.timezones.joined(separator: ", ")
        let currency =  selectedData.currencies?.first
        labelCurrency.text = "Currency: \( currency?.name ?? "") (\(currency?.symbol ?? ""))  - \(currency?.code ?? "")"
        let language =  selectedData.languages?.first
        labelLanguage.text = "Language: \( language?.name ?? "") (\(language?.iso639_1 ?? ""))"
    }
}
