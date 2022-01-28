//
//  ManufacturorsTableViewController.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import UIKit

class ManufacturorsTableViewController: UITableViewController {
    
    var manufacturors: [Manufacturor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listManufacturors()
    }

    func listManufacturors(){
        if let url = URL(string: "https://westcoast-cars-api.herokuapp.com/api/v1/manufacturors/"){
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET" // Specificerar vilken metod som skall användas(HTTPVERB)
            
            URLSession.shared.dataTask(with: request){(data, response, error) in
                if error != nil {
                    print("Något gick fel \(error!)")
                    return
                }
                
                guard let manufacturorListingData = data else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do{
                    let manufacturorList = try decoder.decode(ManufacturorListingMapper.self, from: manufacturorListingData)
                    
                    DispatchQueue.main.async {
                        self.manufacturors = manufacturorList.data
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error)
                }
                
            }.resume()
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manufacturors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "makeCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = manufacturors[indexPath.row].name

        return cell
    }

    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showManufacturorVehiclesSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {

                let destinationController = segue.destination as! ManufacturorVehiclesTableViewController

                destinationController.manufacturor = manufacturors[indexPath.row]

            }
        }
    }
    
}
