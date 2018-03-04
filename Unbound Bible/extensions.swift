//
//  extensions.swift
//  Unbound Bible
//
//  Copyright © 2018 Vladimir Rybant. All rights reserved.
//

import Foundation
import Cocoa

extension String
{
    var length: Int {
        return self.count
    }
    
    var quoted: String {
        return "\"" + self + "\""
    }
    
    var toInt: Int {
        if let number = Int(self) { return number }
        else { return 0 }
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    var components: [String] {
        let separator = "\t"
        var list = self.components(separatedBy: separator)
        
        if list.count > 0 {
            for i in 0...list.count-1 {
                list[i] = list[i].trimmed
            }
        }
        return list
    }
    
    var componentsSeparatedByEol: [String] {
        let separator = CharacterSet.newlines
        return self.components(separatedBy: separator)
    }
    
    var removeTags: String {
        var s = ""
        var l = true
        
        for c in self {
            if c == "<" { l = false }
            if l { s.append(c) }
            if c == ">" { l = true  }
        }
        return s
    }
    
    var removeLeadingChar: String {
        var s = ""
        var l = false
        
        for c in self {
            if l { s.append(c) } else { l = true }
        }
        return s
    }
    
    var removeLeadingChars: String {
        let list = self.trimmed.components(separatedBy: " ")
        
        var result: [String] = []
        for line in list {
            let s = line.removeLeadingChar
            result.append(s)
        }
        return result.joined(separator: " ")
    }
    
//    var localized: String {
//        return NSLocalizedString(self, comment:"")
//    }
    
    func replace(_ string: String, _ with: String) -> String
    {
        return self.replacingOccurrences(of: string, with: with, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func mutable(attributes: [NSAttributedStringKey: Any]) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
    
    func contains(other: String, options: SearchOption) -> Bool {
        let otherString = options.contains(.caseSensitive) ? other : other.lowercased()
        let  selfString = options.contains(.caseSensitive) ?  self :  self.lowercased()
        
        if !options.contains(.wholeWords) { return selfString.contains(otherString) }
        
        let сharacterSet = NSCharacterSet.punctuationCharacters.union(NSCharacterSet.whitespaces)
        let words = selfString.components(separatedBy: сharacterSet)
        
        for word in words {
            if word == otherString { return true }
        }
        return false
    }
    
    func contains(list: [String], options: SearchOption) -> Bool {
        for word in list {
            if word.isEmpty { continue }
            if !self.contains(other: word, options: options) { return false }
        }
        return true
    }
    
    func highlight(with: String, target: String, options: SearchOption) -> String {
        var tag = with
        tag.insert("/", at: with.index(after: with.startIndex))
        let result = self.replace(target, "\(with)\(target)\(tag)")
        if searchOption.contains(.caseSensitive) { return result }
        return result.replace(target.capitalized, "\(with)\(target.capitalized)\(tag)")
    }
    
    func highlight(with: String, target: [String], options: SearchOption) -> String {
        var result = self
        for target in target {
            result = result.highlight(with: with, target: target, options: options)
        }
        return result
    }
    
}

extension Substring {

    func toInt() -> Int {
        if let number = Int(self) { return number }
        else { return 0 }
    }
    
    func trimmed() -> Substring {
        let result = self.trimmingCharacters(in: CharacterSet.whitespaces)
        return Substring(result)
    }

}

extension Collection where Iterator.Element == String {
    
    func lowercased() -> [String] {
        var result : [String] = []
        for string in self { result.append(string.lowercased()) }
        return result
    }
    
    func highlight(with: String, target: String, options: SearchOption) -> [String] {
        var result : [String] = []
        for string in self { result.append(string.highlight(with: with, target: target, options: options)) }
        return result
    }
    
}

extension NSAttributedString {
    func mutable () -> NSMutableAttributedString {
        return self.mutableCopy() as! NSMutableAttributedString
    }
}

extension NSMutableAttributedString {
    func copyToPasteboard() {
        let Pasteboard = NSPasteboard.general
        Pasteboard.clearContents()
        Pasteboard.writeObjects([self])
    }
}

extension NSTabView
{
    func selectedTab() -> Int? {
        if let tab = self.selectedTabViewItem {
            return self.indexOfTabViewItem(tab)
        }
        return nil
    }
}

let programmatically = 1

extension NSTableView {
    func selectRow(index: Int) {
        self.tag = programmatically
        let indexSet = NSIndexSet(index: index)
        self.selectRowIndexes(indexSet as IndexSet, byExtendingSelection: false)
        self.scrollRowToVisible(index)
        self.tag = 0
    }
}


