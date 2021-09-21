//
//  ViewController.swift
//  Programmtic_Autolayout
//
//  Created by Carlon Rosales on 08/12/21.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var searchBarText: String?
    var originalMovieData: [Results]?
    
    @IBOutlet weak var searchBar: UITextField!
    @IBAction func searchBarTyping(_ sender: Any) {
        
        searchBarText = searchBar.text
        searchData()
    }
    
    func searchData(){

        //Reset movie array before delegate
        objMovieModel?.results = originalMovieData

        var movieIndex = 0


        if searchBarText != "" {

            //Operation search and delete
            //Loops thru all movies of movie array
            for movie in objMovieModel?.results ?? [Results]() {

                //Reset values upon new movie index
                var letterIndex = 0
                var matching = false

                //Loops thru all letters of movie title
                for searchLetter in searchBarText! {

                    //Comparing letters
                    if Array(movie.title ?? "")[letterIndex] == searchLetter {

                        matching = true
                    }else{

                        matching = false
                        break

                    }

                    //Dont Increment if index is larger than count
                    if letterIndex < searchBarText?.count ?? 0 {

                        letterIndex += 1

                    }
                }

                //If search does not match movie title, remove that movie from array
                if matching == false {

                    objMovieModel?.results?.remove(at: movieIndex)
                    let indexPath = IndexPath(item: movieIndex, section: 0)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }else{

                    //Dont Increment if index is larger than count or not matching
                    if movieIndex < objMovieModel?.results?.count ?? 0 {

                        movieIndex += 1

                    }
                }
            }
        }
    }
  
    var objMovieModel : MovieModel?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        objMovieModel = MovieModel()

        let objNetworking = Networking()
        objNetworking.response(url: Constant.baseURL.rawValue + Constant.api_key.rawValue) { modelData in
            print(modelData)
            self.objMovieModel = modelData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         
        }
            
    }

//            for movie in objMovieModel?.results ?? [Results]() {
//                originalMovieData?.append(movie)
//            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objMovieModel?.results?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        let indexPathData = objMovieModel?.results?[indexPath.row]
        //Get the data from the movie list
        movieCell?.movName.text = objMovieModel?.results?[indexPath.row].title ?? ""
        movieCell?.movYear.text = objMovieModel?.results?[indexPath.row].release_date ?? ""
        movieCell?.movGenre.text = objMovieModel?.results?[indexPath.row].genre ?? ""

        print(indexPathData?.title! as Any)

        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: Constant.image_url_path.rawValue + (self.objMovieModel?.results?[indexPath.row].backdrop_path)!) {
              let data = try? Data(contentsOf: url)
              if let datac = data {
                  DispatchQueue.main.async {
                      // moviees depending on search
                   movieCell?.movImage.image = UIImage(data: datac)

                  }
              }
            }

        }
        
        
        return movieCell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
 
