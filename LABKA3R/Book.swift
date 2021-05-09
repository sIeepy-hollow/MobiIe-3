//
//  UnderclassMyUIView.swift
//  LABKA3
//
//  Created by Aplyn on 04.05.2021.
//



struct Books: Codable {
    struct Book: Codable {
        var title: String
        var subtitle: String
        var isbn13: String
        var price: String
        var image: String
    }
    var books: [Book]
}
