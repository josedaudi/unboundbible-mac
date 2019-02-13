//
//  View.swift
//  Unbound Bible
//
//  Copyright © 2018 Vladimir Rybant. All rights reserved.
//

import Cocoa

var darkAppearance: Bool = false

class View: NSView {
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        darkAppearance = effectiveAppearance.isDark
    }
    
    @available(macOS 10.14, *)
    override func viewDidChangeEffectiveAppearance() {
        super.viewDidChangeEffectiveAppearance()
        darkAppearance = effectiveAppearance.isDark
    }
    
}
