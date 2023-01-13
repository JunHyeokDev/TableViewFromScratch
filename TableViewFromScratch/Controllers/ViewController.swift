//
//  ViewController.swift
//  TableViewFromScratch
//
//  Created by 김준혁 on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {

    var moviesArray: [Movie] = []
    var dataManager = DataManager()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.makeMovieData() // 일반적으로는 서버에 요청
        moviesArray = dataManager.getMovieData()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        struct Movie {
//            var movieImage: UIImage?
//            let movieName: String
//            let movieDescription: String
//        }
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
    
        return cell
        
    }
    
    
}

