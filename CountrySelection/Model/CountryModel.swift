//
//  CountryModel.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
// MARK:- Model for Country
struct Country: Codable {
    var name: String
    var flag: String
    var capital: String
    var callingCodes: [String]
    var region: String
    var subregion: String
    var timezones: [String]
    var currencies: [Currencies]?
    var languages: [languages]?
}
struct Currencies: Codable {
    var code: String?
    var name: String?
    var symbol: String?
}
struct languages: Codable {
    var iso639_1: String?
    var iso639_2: String?
    var name: String
    var nativeName: String
}

/**

 {
     "name": "Argentina",
     "topLevelDomain": [
         ".ar"
     ],
     "alpha2Code": "AR",
     "alpha3Code": "ARG",
     "callingCodes": [
         "54"
     ],
     "capital": "Buenos Aires",
     "altSpellings": [
         "AR",
         "Argentine Republic",
         "República Argentina"
     ],
     "region": "Americas",
     "subregion": "South America",
     "population": 43590400,
     "latlng": [
         -34,
         -64
     ],
     "demonym": "Argentinean",
     "area": 2780400,
     "gini": 44.5,
     "timezones": [
         "UTC-03:00"
     ],
     "borders": [
         "BOL",
         "BRA",
         "CHL",
         "PRY",
         "URY"
     ],
     "nativeName": "Argentina",
     "numericCode": "032",
     "currencies": [
         {
             "code": "ARS",
             "name": "Argentine peso",
             "symbol": "$"
         }
     ],
     "languages": [
         {
             "iso639_1": "es",
             "iso639_2": "spa",
             "name": "Spanish",
             "nativeName": "Español"
         },
         {
             "iso639_1": "gn",
             "iso639_2": "grn",
             "name": "Guaraní",
             "nativeName": "Avañe'ẽ"
         }
     ],
     "translations": {
         "de": "Argentinien",
         "es": "Argentina",
         "fr": "Argentine",
         "ja": "アルゼンチン",
         "it": "Argentina",
         "br": "Argentina",
         "pt": "Argentina",
         "nl": "Argentinië",
         "hr": "Argentina",
         "fa": "آرژانتین"
     },
     "flag": "https://restcountries.eu/data/arg.svg",
     "regionalBlocs": [
         {
             "acronym": "USAN",
             "name": "Union of South American Nations",
             "otherAcronyms": [
                 "UNASUR",
                 "UNASUL",
                 "UZAN"
             ],
             "otherNames": [
                 "Unión de Naciones Suramericanas",
                 "União de Nações Sul-Americanas",
                 "Unie van Zuid-Amerikaanse Naties",
                 "South American Union"
             ]
         }
     ],
     "cioc": "ARG"
 }
 
 */
