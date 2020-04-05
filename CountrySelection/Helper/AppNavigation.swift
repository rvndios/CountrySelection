//
//  AppNavigation.swift
//  CountrySelection
//
//  Created by user on 04/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
class AppNavigation {
    class func moveToCountryDetailPage(_ viewCont: UIViewController) {
        viewCont.performSegue(withIdentifier: "DetailView", sender: nil)
    }
}
