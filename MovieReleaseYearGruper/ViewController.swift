//
//  ViewController.swift
//  MovieReleaseYearGruper
//
//  Created by MICHAEL GRUPER on 1/14/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ghostLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMovie()
    }
    func getMovie(){
        let session = URLSession.shared
        let movieURL = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=62536319")!
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            if let e = error{
                print("Error! \(e)")
            }
            else{
                if let d = data{
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary {
                        print(jsonObj)
                        DispatchQueue.main.async{
                            self.ghostLabelOutlet.text = "\(jsonObj.value(forKey: "Title")!)"
                        }
                    }
                }
            }
            
        }
        dataTask.resume()
    }
}

