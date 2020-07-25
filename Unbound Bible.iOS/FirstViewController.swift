//
//  FirstViewController.swift
//  Unbound Bible.iOS
//
//  Copyright © 2020 Vladimir Rybant. All rights reserved.
//

import UIKit

var firstView = UIViewController()

class FirstViewController: UIViewController {

    @IBAction func bookAction(_ sender: UIButton) {
        print("ok")
    }
    
    @IBOutlet weak var bibleText: BibleTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      view.backgroundColor = .systemRed
    }

    override func viewWillAppear(_ animated: Bool) {
        if shelf.isEmpty { return }
        let attrString = loadChapter_()
        bibleText.textStorage.setAttributedString(attrString)
    }
    
}

