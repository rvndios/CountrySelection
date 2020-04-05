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
        setUpTexts()
    }
    /// Method to set texts to lables
    func setUpTexts() {
        imageFlag.image(from: selectedData.flag, size: CGSize(width: 400, height: 400))//imageFlag.frame.size)
        labelCountryName.text = selectedData.name + " - " + selectedData.capital + " (+" + selectedData.callingCodes.joined(separator: ", ") + ")"
        labelRegion.text = selectedData.region + ", " + selectedData.subregion
        labelTimeZone.text = "Time Zone : " + selectedData.timezones.joined(separator: ", ")
        labelCurrency.text = "Currency : " + (selectedData.currencies?.reduce(into: [String]()) {
            return $0.append("\( $1.name ?? "") (\($1.symbol ?? ""))  - \($1.code ?? "")") }.joined(separator: ", ") ?? "")
        labelLanguage.text = "Language : " + (selectedData.languages?.reduce(into: [String]()) {
            return $0.append("\( $1.name ) (\($1.iso639_1 ?? "")) ") }.joined(separator: ", ") ?? "")
    }
}
