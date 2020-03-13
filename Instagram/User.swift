//
//  User.swift
//  Instagram
//
//  Created by Andres Made on 3/13/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import Foundation


struct User: Encodable, Decodable{
    var uid: String
    var email: String
    var profileImage: String
    var username: String
    var bio: String
    var keywords: [String]
    

}
