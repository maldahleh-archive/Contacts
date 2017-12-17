//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Mohammed Al-Dahleh on 2017-12-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {
    var contact: Contact?
    
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        guard let contact = contact else { return }
        
        profilePictureView.image = contact.image
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        
        phoneNumberLabel.text = contact.phone
        emailLabel.text = contact.email
        
        streetAddressLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipCodeLabel.text = contact.zip
    }
}
