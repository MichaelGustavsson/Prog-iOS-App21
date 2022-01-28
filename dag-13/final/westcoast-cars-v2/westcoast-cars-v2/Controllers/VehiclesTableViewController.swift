//
//  VehiclesTableViewController.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import UIKit

class VehiclesTableViewController: UITableViewController {

    var vehicles: [Vehicle] = []
    var vehicleService = VehicleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listVehicles()
        vehicleService.ListAllVehicles()
    }
    
    func listVehicles(){
        if let url = URL(string: "https://westcoast-cars-api.herokuapp.com/api/v1/vehicles/"){
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){(data, response, error) in
                if(error != nil){
                    print("Något gick fel \(error!)")
                    return
                }
                
                guard let vehicleListingData = data else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do{
                    let vehicleList = try decoder.decode(VehicleListingMapper.self, from: vehicleListingData)
                    
                    DispatchQueue.main.async {
                        self.vehicles = vehicleList.data
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
        return vehicles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath)

        // Configure the cell...
        let vehicle = vehicles[indexPath.row]
        
        cell.textLabel?.text = "\(vehicle.manufacturor.name) \(vehicle.model)"
        cell.detailTextLabel?.text = "Årsmodell \(vehicle.modelYear) Antal km \(vehicle.mileage) \(vehicle.color)"

        return cell
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
