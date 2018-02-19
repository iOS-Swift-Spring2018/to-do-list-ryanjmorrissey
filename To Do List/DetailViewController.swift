//
//  DetailViewController.swift
//  To Do List
//
//  Created by Ryan Morrissey on 2/17/18.
//  Copyright © 2018 Morrissey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var toDoNoteView: UITextView!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String?
    var toDoNoteItem: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindfromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text 
        }
        
    }
    
    func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
