//
//  UserDTO+Mapping.swift
//  Micro-Social
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

struct UserDTO: Decodable{
    let id: String
    let name: String
    let imageUrl: String
}
