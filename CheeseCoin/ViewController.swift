//
//  ViewController.swift
//  CheeseCoin
//
//  Created by Tamanna on 25/10/23.
//

import Cocoa
class ViewController: NSViewController {
    
    let dateFormatter = DateFormatter()  // Initialize a DateFormatter for date and time formatting
    
    @objc dynamic var nodes = [Node]()  // An array to hold the nodes in your tree
    
    @IBOutlet var treeController: NSTreeController!  // Interface Builder outlet to the NSTreeController
    
    @IBOutlet weak var amountField: NSTextField!  // Interface Builder outlet to the NSTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium  // Set the date style to medium
        dateFormatter.timeStyle = .medium  // Set the time style to medium
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func buyCheesecoin(_ sender: Any) {
        // Function called when the "Buy" button is clicked
        
        if amountField.stringValue.isEmpty {
            return
        }
        
        // Generate date, UUID, and price
        let date = dateFormatter.string(from: Date())  // Format the current date and time
        let uuid = UUID().uuidString  // Generate a UUID string
        let price = String(format: "%.2f", Double.random(in: 0.1...0.5))  // Generate a random price in a specific format
        let amount = amountField.stringValue  // Get the amount from the text field
        
        // Create a new Node for the transaction and its details
        let node = Node(date, "Buy", [
            Node("Amount Purchased", amount, nodes),
            Node("Current Price", "$\(price)", nodes),
            Node("Transaction ID", uuid, nodes)
        ])
        
        // Add the newly created node to the treeController
        treeController.addObject(node)
        amountField.stringValue = ""  // Clear the amount text field
        
    }
    
    @IBAction func removeTransaction(_ sender: Any) {
        // Function called when the "Remove" button is clicked
        
        if let selection = treeController.selectionIndexPath {
            // If an item is selected in the tree
            treeController.removeObjects(atArrangedObjectIndexPaths: [selection])  // Remove the selected item
        }
    }
}
