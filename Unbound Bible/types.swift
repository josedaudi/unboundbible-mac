//
//  types.swift
//  Unbound Bible
//
//  Copyright © 2018 Vladimir Rybant. All rights reserved.
//

import Foundation

var recentList : [String] = []

enum FileFormat {
    case unbound, mybible
}

struct StringAlias {
    var bible = "Bible"
    var book = "Book"
    var chapter = "Chapter"
    var verse = "Verse"
    var text = "Scripture"
    var details = "Details"
}

var mybibleStringAlias = StringAlias(
    bible : "verses",
    book : "book_number",
    chapter : "chapter",
    verse : "verse",
    text : "text",
    details : "info"
)

struct Verse {
    var book    = 0
    var chapter = 0
    var number  = 0
    var count   = 0
}

struct Book {
    var title  = ""
    var abbr   = ""
    var number = 0
    var id     = 0
}

struct Content {
    var verse = Verse()
    var text: String = ""
}

let myBibleArray : [Int] = [0,
        010,020,030,040,050,060,070,080,090,100,110,120,130,140,150,160,190,220,230,240,
        250,260,290,300,310,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,
        480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,
        680,690,700,710,720,730,170,180,270,280,320,462,464,000,165,466,000,790,468,315]

// 305    Молитва Азарии
// 325    Сюзанна
// 345    Бел и дракон

let bibleHubArray : [String] = ["",
        "genesis","exodus","leviticus","numbers","deuteronomy","joshua","judges","ruth","1_samuel","2_samuel",
        "1_kings","2_kings","1_chronicles","2_chronicles","ezra","nehemiah","esther","job","psalms","proverbs",
        "ecclesiastes","songs","isaiah","jeremiah","lamentations","ezekiel","daniel","hosea","joel","amos",
        "obadiah","jonah","micah","nahum","habakkuk","zephaniah","haggai","zechariah","malachi","matthew",
        "mark","luke","john","acts","romans","1_corinthians","2_corinthians","galatians","ephesians","philippians",
        "colossians","1_thessalonians","2_thessalonians","1_timothy","2_timothy","titus","philemon","hebrews",
        "james","1_peter","2_peter","1_john","2_john","3_john","jude","revelation"]

func isNewTestament(_ n: Int) -> Bool {
    return (n >= 40) && (n <= 66)
}

func isOldTestament(_ n: Int) -> Bool {
    return n < 40
}

func isApocrypha(_ n: Int) -> Bool {
    return n > 66
}

