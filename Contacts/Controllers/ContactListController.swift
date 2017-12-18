//
//  ContactListController.swift
//  Contacts
//
//  Created by Mohammed Al-Dahleh on 2017-12-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

extension Contact {
    var firstLetterForSort: String {
        return String(firstName.first!).uppercased()
    }
}

extension ContactsSource {
    static var uniqueFirstLetters: [String] {
        let firstLetters = contacts.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        
        return Array(uniqueFirstLetters).sorted()
    }
}

class ContactListController: UITableViewController {
    
    var contacts = ContactsSource.contacts
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.firstName
        cell.detailTextLabel?.text = contact.lastName
        cell.imageView?.image = contact.image
        
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "showDetail" { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        guard let destination = segue.destination as? UINavigationController, let destinationVC = destination.topViewController as? ContactDetailController else {
            return
        }
        
        destinationVC.contact = contacts[indexPath.row]
    }
}
