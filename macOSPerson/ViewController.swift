//
//  ViewController.swift
//  macOSPerson
//
//  Created by Ehsan Taghavi on 9/6/23.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var personName: NSTextField!
    @IBOutlet weak var personAge: NSTextField!
    
    @IBOutlet weak var tableView: NSTableView!
    
    var sample = Person.getSampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "Name"){
            let cellIndentifier = NSUserInterfaceItemIdentifier(rawValue: "nameCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIndentifier, owner: self) as? NSTableCellView else {return nil}
            cellView.textField?.stringValue = sample[row].name
            return cellView
        } else if   tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "Age"){
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ageCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {return nil}
            cellView.textField?.integerValue = sample[row].age
            return cellView
        }
        
        return nil
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let newName = personName.stringValue
        let newAge = personAge.integerValue
        sample.append(Person.init(name: newName, age: newAge))
        tableView.reloadData()
    }
    
}

