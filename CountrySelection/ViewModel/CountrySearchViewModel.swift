//
//  CountrySearchViewModel.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
class CountrySearchViewModel: NSObject {
    var viewController: CountrySearchViewController!
    var selectedData: Country!
    var allCountriesLoaded = false
    var cellIdentifier = "countryList"
    var tableFilteredData = [Country]() { didSet { loadTableView() } }
    var tableData = [Country]() { didSet { loadTableView() } }
    init(viewController: CountrySearchViewController) {
        self.viewController = viewController
    }
    /// Method to set delegates
    func setDelegates() {
        viewController.searchBar.delegate = self
        viewController.tableSearchTableView.delegate = self
        viewController.tableSearchTableView.dataSource = self
    }
    /// Method to load tableview based on data
    func loadTableView() {
        viewController.tableSearchTableView.isHidden = tableData.count == 0
        viewController.tableSearchTableView.reloadData()
    }
}
// MARK: Search bar delegates
extension CountrySearchViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if allCountriesLoaded {
            tableFilteredData = tableData.filter({ $0.name.contains(searchText) })
        } else {
            if searchText == "" { tableData.removeAll(); return }
            self.getCountryList(searchText)
        }
    }
}
// MARK: TableView DataSource & delegates
extension CountrySearchViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCountriesLoaded ? tableFilteredData.count : tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CountryListCell
        cell?.data = allCountriesLoaded ? tableFilteredData[indexPath.row] : tableData[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = allCountriesLoaded ? tableFilteredData[indexPath.row] : tableData[indexPath.row]
        AppNavigation.moveToCountryDetailPage(viewController)
    }
}
extension CountrySearchViewModel {
    func getCountryList(_ searchString: String) {
        serchText = searchString
        DataManager.getCountryList(searchString: searchString) { (countryList) in
            self.tableData = countryList ?? []
        }
    }
    func getAllCountryList() {
        DataManager.getAllCounties { (countryList) in
            self.allCountriesLoaded = true
            self.tableData = countryList ?? []
            self.tableFilteredData = self.tableData
        }
    }
}
