//
//  UnderclassUITableViewCell.swift
//  LABKA3
//
//  Created by Aplyn on 04.05.2021.
//

import Foundation
import UIKit

class UnderclassUITableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var myStackView: UIStackView!
    func setImageAndLabel(book: Books.Book) {
        if (book.image != "") {
            let name = String(book.image.prefix(book.image.count - 4))
            if let path = Bundle.main.path(forResource: name, ofType: "png") {
                myImageView.image = UIImage(contentsOfFile: path)
            }
        } else {
            myImageView.image = nil
        }
        myContentView.bottomAnchor.constraint(greaterThanOrEqualTo: myImageView.bottomAnchor, constant: 10).isActive = true
        myContentView.bottomAnchor.constraint(greaterThanOrEqualTo: myStackView.bottomAnchor, constant: 10).isActive = true
        title.text = book.title
        if (book.subtitle == "") {
            subtitle.text = nil
            subtitle.isHidden = true
        } else {
            subtitle.isHidden = false
            subtitle.text = book.subtitle
        }
        if (book.price == "") {
            price.text = nil
            price.isHidden = true
        } else {
            price.isHidden = false
            price.text = book.price
        }
    }
}
