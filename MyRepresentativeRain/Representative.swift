//
//  Representative.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class Representative {
    
    private let kNameKey = "name"
    private let kPartyKey = "party"
    private let kStateKey = "state"
    private let kDistrictKey = "district"
    private let kPhoneKey = "phone"
    private let kOfficeKey = "office"
    private let kLinkKey = "link"

    var name: String = ""
    var party: String = ""
    var state: String = ""
    var district: String = ""
    var phone: String = ""
    var office: String = ""
    var link: String = ""
    
    init?(jsonDictionary:[String:AnyObject]) {
        guard let name = jsonDictionary[kNameKey] as? String,
        let state = jsonDictionary[kStateKey] as? String,
        let party = jsonDictionary[kPartyKey] as? String,
        let district = jsonDictionary[kDistrictKey] as? String,
        let phone = jsonDictionary[kPhoneKey] as? String,
        let office = jsonDictionary[kOfficeKey] as? String,
            let link = jsonDictionary[kLinkKey] as? String else { return nil }
        self.name = name
        self.state = state
        self.party = party
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}
