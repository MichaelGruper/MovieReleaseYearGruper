//
//  ViewController.swift
//  MovieReleaseYearGruper
//
//  Created by MICHAEL GRUPER on 1/14/25.
//

import UIKit

class ViewController: UIViewController {
    let movieName = ""
    @IBOutlet weak var ghostLabelOutlet: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func getMovie(){
        let session = URLSession.shared
        let movieName = textFieldOutlet.text!
        if movieName != ""{
            let movieURL = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=62536319&t=\(movieName)")!
            let dataTask = session.dataTask(with: movieURL) { data, response, error in
                if let e = error{
                    print("Error! \(e)")
                }
                else{
                    if let d = data{
                        if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary {
                            print(jsonObj)
                            let j = jsonObj.value(forKey: "Title")!
                            DispatchQueue.main.async{
                                self.ghostLabelOutlet.text = "\(j)"
                            }
                        }
                    }
                }
                
            }
            dataTask.resume()
        }
    }
    @IBAction func searchButtonAction(_ sender: UIButton) {
        getMovie()
    }
}

