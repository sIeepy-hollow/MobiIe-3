//
//  ListViewController.swift
//  MD Lab 3
//
//  Created by Павел on 07.05.2021.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var jsonBooks = get_books()
    lazy var booksArr:[Books.Book] = jsonBooks!.books
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    func get_books() -> Books? {
        if let fileLocation = Bundle.main.url(forResource: "BooksList", withExtension: "txt") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(Books.self, from: data)
                return dataFromJson
            } catch {
                print(error)
            }
        }
        return nil
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return booksArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = booksArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! UnderclassUITableViewCell
        cell.setImageAndLabel(book: book)
        
        return cell
    }
}
