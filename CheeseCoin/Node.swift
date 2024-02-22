//
//  Node.swift
//  CheeseCoin
//
//  Created by Tamanna on 25/10/23.
//

import Foundation

class Node : NSObject {

    @objc dynamic let id: String
    @objc dynamic let value: String
    @objc dynamic var children: [Node]
    
    init(_ id: String,  _ value: String, _ children: [Node]) {
        self.id = id
        self.value = value
        self.children = children
    }
    
    //determine if the node is leaf node (has no children)
    @objc dynamic var isLeaf: Bool {
        return children.isEmpty
    }
    
    //returns the number of children
    @objc dynamic var childCount: Int {
        return children.count
    }
}
