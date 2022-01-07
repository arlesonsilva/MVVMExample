//
//  PersonFollowTableViewCellViewModel.swift
//  MVVMExample
//
//  Created by Arleson Silva on 07/01/22.
//

import UIKit

struct PersonFollowTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollow: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentlyFollow = false
        image = UIImage(systemName: "person")
    }
}
