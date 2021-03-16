//
//  NewsViewController.swift
//  blackcatwayband
//
//  Created by 張俊傑 on 2021/2/18.
//

import UIKit
import WebKit

class NewsViewController: UIViewController {

    @IBOutlet weak var new1: WKWebView!
    @IBOutlet weak var new2: WKWebView!
    @IBOutlet weak var new3: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

    loadMusic()
        
    }
    func loadMusic(){
        let url1 = URL(string: "https://www.youtube.com/embed/1-l4ElyIKwQ")!
                let request = URLRequest(url: url1)
                new1.load(request)
        let url2 = URL(string: "https://www.youtube.com/embed/-NFyL-hGyGg")!
                let request2 = URLRequest(url: url2)
                new2.load(request2)
        let url3 = URL(string: "https://www.youtube.com/embed/mYxEKmEXBNI")!
                let request3 = URLRequest(url: url3)
                new3.load(request3)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
