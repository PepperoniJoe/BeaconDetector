//
//  Constants.swift
//  BeaconDetector
//
//  Created by Marcy Vernon on 11/20/20.
//

import Foundation
import CoreLocation

//MARK: Enums
//// Status of beacon's location relative to the beacon detector(this app)
enum BeaconStatus: String {
    case unknown   = "Unknown"
    case immediate = "Here"
    case near      = "Nearby"
    case far       = "Far Away"
}

////  List of english speakers. 
enum EnglishSpeakers : String {
    case catherine = "com.apple.ttsbundle.siri_female_en-AU_compact"
    case gordon    = "com.apple.ttsbundle.siri_male_en-AU_compact"
    case karen     = "com.apple.ttsbundle.Karen-compact"
    case arthur    = "com.apple.ttsbundle.siri_male_en-GB_compact"
    case daniel    = "com.apple.ttsbundle.Daniel-compact"
    case martha    = "com.apple.ttsbundle.siri_female_en-GB_compact"
    case moira     = "com.apple.ttsbundle.Moira-compact"
    case rishi     = "com.apple.ttsbundle.Rishi-compact"
    case aaron     = "com.apple.ttsbundle.siri_male_en-US_compact"
    case fred      = "com.apple.speech.synthesis.voice.Fred"
    case nicky     = "com.apple.ttsbundle.siri_female_en-US_compact"
    case samantha  = "com.apple.ttsbundle.Samantha-compact"
    case tessa     = "com.apple.ttsbundle.Tessa-compact"
    case alex      = "com.apple.speech.voice.Alex"
}

struct K {
    ///Beacon settings
    static var uuid                       = "AF80D50E-9905-4562-B154-AB5C82B635ED"
    static var beaconID                   = ""
    static var major : CLBeaconMajorValue = 0
    static var minor : CLBeaconMinorValue = 0
    
    ///Default settings
    static var defaultImage               = "Blank"
    static var emptyString                = ""
    
    /// Alerts
    static var ok                         = "OK"
    static var alert                      = "Alert"
    static var locationNeeded             = "Location Services is needed to operate beacon detector."

    ///Data for each Exhibit
    static let dictExhibit: [String : (exhibit: String, title: String, image: String, description: String, speach: String)] = [
        "1-1": ("William H. Johnson", "Farm Couple At Well", "Farm Couple At Well", "Artist: William H. Johnson, born Florence, South Carolina in 1901 - died Central Islip, New York in 1970\n\nType: Graphic Arts-Print\n\nDate: circa 1940-1941\n\nCredit: Smithsonian American Art Museum, Gift of the Harmon Foundation","Farm Couple At Well by artist William H. Johnson"),
        "1-2": ("William H. Johnson", "Jitterbug II", "Jitterbug II", "Artist: William H. Johnson\n\nType: Graphic Arts-Print\n\nDate: circa 1940-1941\n\nCredit: Smithsonian American Art Museum, Gift of the Harmon Foundation","Jitterbug 2 by artist William H. Johnson"),
        "1-3": ("William H. Johnson", "Street Musicians", "Street Musicians", "Artist: William H. Johnson\n\nType: Graphic Arts-Print\n\nDate: circa 1940-1941\n\nCredit: Smithsonian American Art Museum, Gift of the Harmon Foundation","Street Musicians by artist William H. Johnson"),
        "2-1": ("Edward S. Curtis", "Wedding Party", "Wedding Party", "Photographer: Edward S. Curtis (1868-1952)\n\nDate: circa 1907-1930\n\nDescription: Edward S. Curtis, a professional photographer in Seattle, devoted his life to documenting what was perceived to be a vanishing race. His monumental publication The North American Indian presented to the public an extensive ethnographical study of numerous tribes, and his photographs remain memorable icons of the American Indian.","Wedding Party by photographer  Edward S. Curtis"),
        "2-2": ("Edward S. Curtis", "Planning A Raid", "Planning A Raid", "Photographer: Edward S. Curtis (1868-1952)\n\nDate: circa 1907\n\nDescription: The Smithsonian Libraries holds a complete set of this work, which includes photogravures on tissue, donated by Mrs. Edward H. Harriman, whose husband had conducted an expedition to Alaska with Curtis in 1899.\n\nCredit: Edward S. Curtis Collection (Library of Congress)\n\nIndians of North America--1900-1910.","Planning A Raid  by photographer Edward S. Curtis"),
        "2-3": ("Edward S. Curtis", "Show As He Goes", "Show As He Goes", "Photographer: Edward S. Curtis (1868-1952)\n\nDate: circa 1905\n\nDescription: Shows As He Goes, half-length portrait\n\nCredit: Edward S. Curtis Collection (Library of Congress) Indians of North America--1900-1910.","Show As He Goes by photographer Edward S. Curtis"),
        "3-1": ("T. E. & E. Harrison Compton", "Mayence Cathedral", "Mayence Cathedral", "Artists: Compton, E. T. and E. Harrison\n\nDate: 1912\n\nDescription: Cathedral with Romanesque style in the town of Mainz(Mayence). The town known for properity in medieval times.\n\nCredit: University of California Libraries","Mayence Cathedral by Artists E. T Compton and E. Harrison Compton. "),
        "3-2": ("T. E. & E. Harrison Compton", "Eibsee", "Eibsee", "Artists: Compton, E. T. and E. Harrison\n\nDate: 1912\n\nDescription: Eibsee is a lake in Bavaria, Germany, 9 km southwest of Garmisch-Partenkirchen and roughly 100 km southwest of Munich\n\nCredit: University of California Libraries","Eibsee by Artists E. T Compton and E. Harrison Compton"),
        "3-3": ("T. E. & E. Harrison Compton", "Würzburg", "Würzburg", "Artists: Compton, E. T. and E. Harrison\n\nDate: 1912\n\nDescription: The old main bridge in Würzburg, Germany.\n\nCredit: University of California Libraries","Würzburg by Artists E. T Compton and E. Harrison Compton"),
        "4-1": ("Felice A. Beato", "Two Women With Parasol", "Two Women With Parasol", "Photographer: Felice A. Beato  (1825-1908)\n\nDescription: Two women with a parasol, in traditional costume and footwear, Japan, taken between 1867 and 1869. The original caption reads 'out for an airing'","Two Women With Parasol by photographer Felice A. Beato"),
        "4-2": ("Felice A. Beato", "The Late Tycoon", "The Late Tycoon", "Photographer: Felice A. Beato  (1825-1908)\n\nDescription: Prince Tokugawa Yoshinobu (1837 – 1913) was the 15th and last shōgun of the Tokugawa shogunate of Japan. He was part of a movement which aimed to reform the aging shogunate, but was ultimately unsuccessful. After resigning in late 1867, he went into retirement, and largely avoided the public eye for the rest of his life.","The Late Tycoon by photographer Felice A. Beato"),
        "4-3": ("Felice A. Beato", "Curio Shop", "Curio Shop", "Photographer: Felice A. Beato  (1825-1908)\n\nDescription: View of a curio shop, Japan, taken between 1867 and 1869. A man and woman in traditional costume are seated inside.\n\nNote: Felice A. Beato was a photographer who was born Venice and moved to England and became a naturalized citizen.He was one of the first photographers to devote himself to photographing in Asia and the Near east.","Curio Shop by photographer Felice A. Beato"),
    ]
}
