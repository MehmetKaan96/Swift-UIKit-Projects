//
//  ViewController.swift
//  Project1
//
//  Created by Mehmet on 10.08.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
                pictures.sort()
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            storyboard.selectedImage = pictures[indexPath.row]
            storyboard.numberOfImages = pictures.count
            storyboard.positionOfImage = (indexPath.item + 1)
            navigationController?.pushViewController(storyboard, animated: true)
        }
    }
}

