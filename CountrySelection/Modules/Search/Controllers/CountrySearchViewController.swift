//
//  ViewController.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import UIKit

class CountrySearchViewController: UIViewController {
    @IBOutlet weak var tableSearchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: CountrySearchViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = CountrySearchViewModel(viewController: self)
        viewModel.setDelegates()
    }
    @IBAction func showAllCountrys(_ sender: Any) {
        self.viewModel.getAllCountryList()
    }
}
// MARK: - Navigation
extension CountrySearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            let vc = segue.destination as? CountryDetailsViewController
            vc?.selectedData = viewModel.selectedData
        }
    }
}
