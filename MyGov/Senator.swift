//
//  Senator.swift
//  MyGov
//
//  Created by David Brown on 7/12/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import Foundation
import Gloss

class Senator: Glossy, Decodable {
    
    var key: String?
    var stateName: String?
    var stateCode: String?
    
    init?() {
        self.key = ""
        self.stateName = ""
        self.stateCode = ""
    }
    
    required init?(json: JSON) {
        self.stateName = "state_name" <~~ json
        self.stateCode = "state_code" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "state_name" ~~> self.stateName,
            "state_code" ~~> self.stateCode
        ])
    }

}
