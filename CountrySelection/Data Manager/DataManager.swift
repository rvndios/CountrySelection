//
//  DataManager.swift
//  CountrySelection
//
//  Created by user on 04/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
// MARK:- Class for map dta from API
class DataManager {
    class func getCountryList(searchString: String, completed: @escaping (_ data: [Country]?) -> Void) {
        WebServices.shared.getData(type: .search, parameters: nil, completion: { (responce, code) in
            if code == 200 {
                do {
                    let country = try JSONDecoder().decode([Country].self, from: responce as! Data)
                    completed(country)
                } catch {
                    print(error)
                    completed([])
                }
            }
        }) { (error) in
            print(error.debugDescription)
            completed([])
        }
    }
    class func getAllCounties(completed: @escaping (_ data: [Country]?) -> Void) {
        WebServices.shared.getData(type: .all, parameters: nil, completion: { (responce, code) in
            if code == 200 {
                do {
                    let country = try JSONDecoder().decode([Country].self, from: responce as! Data)
                    completed(country)
                } catch {
                    print(error)
                    completed([])
                }
            }
        }) { (error) in
            print(error.debugDescription)
            completed([])
        }
    }
}
