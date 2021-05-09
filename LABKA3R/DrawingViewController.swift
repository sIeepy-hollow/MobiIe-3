//
//  DrawingViewController.swift
//  LABKA3
//
//  Created by Aplyn on 25.04.2021.
//

import Foundation
import UIKit

class DrawingViewContoller: UIViewController {
    
    
    @IBOutlet weak var underclassMyUIView: UnderclassMyUIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    
    @IBAction func drawGraphic(_ sender: Any) {
        underclassMyUIView.drawArt(art: .graphic)
    }
    @IBAction func drawDiagram(_ sender: Any) {
        underclassMyUIView.drawArt(art: .diagram)
    }
}
