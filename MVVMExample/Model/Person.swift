//
//  Person.swift
//  MVVMExample
//
//  Created by Arleson Silva on 07/01/22.
//

import Foundation

enum Gender {
    case male, female, unspecified
}

struct Person {
    let name: String
    let birthdate: Date?
    let middleName: String?
    let address: String?
    let gender: Gender

    var username = "KaybeWest"

    init(name: String,
         birthdate: Date? = nil,
         middleName: String? = nil,
         address: String? = nil,
         gender: Gender = .unspecified
    ) {
        self.name = name
        self.birthdate = birthdate
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}
