//
//  ViewController.swift
//  DicodingApps
//
//  Created by Muhammad Vikri on 29/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Isi dengan nama file XIB
        academyTableView.register(UINib(nibName: "AcademyTableViewCell", bundle: nil),  forCellReuseIdentifier: "AcademyCell")
        // Isi dengan Identifier Cell yang telah ditentukan
        
        academyTableView.dataSource = self
        academyTableView.delegate = self
    }


    @IBAction func goToWebsite(_ sender: Any) {
        let urlMhmmdvg = "https://mhmmdvg.vercel.app/"
        if let url = URL(string: urlMhmmdvg), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAcademyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AcademyCell", for: indexPath)as? AcademyTableViewCell {
            
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyDesc.text = academy.description
            cell.academyImage.image = academy.image
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.academy = sender as? AcademyModel
            }
        }
    }
}
