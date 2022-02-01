//
//  ManufacturVehiclesTableViewController.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import UIKit
import Kingfisher

class ManufacturorVehiclesTableViewController: UITableViewController {

    var vehicles: [Vehicle] = []
    var manufacturor: Manufacturor?
    
    var cornerRadius: CGFloat = 25.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let manufacturor = self.manufacturor {
            // Anropa en funktion
            listManufacturorVehicles(manufacturor._id)
        }
    
    }
    
    func listManufacturorVehicles(_ makeId: String){
        if let url = URL(string: "https://westcoast-cars-api.herokuapp.com/api/v1/manufacturors/\(makeId)/vehicles"){
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){(data, response, error) in
                
                if error != nil {
                    print("Något gick fel")
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
                    
                }catch {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "makeVehicleFancyCell", for: indexPath) as! VehicleMakeTableViewCell

        // Configure the cell...
        let vehicle = vehicles[indexPath.row]
        
        cell.imageViewContainer.layer.cornerRadius = cornerRadius
        cell.imageViewContainer.layer.shadowColor = UIColor.black.cgColor
        cell.imageViewContainer.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        cell.imageViewContainer.layer.shadowRadius = 10.0
        cell.imageViewContainer.layer.shadowOpacity = 0.9
        cell.imageViewContainer.layer.borderColor = UIColor.systemGray.cgColor
        cell.imageViewContainer.layer.borderWidth = 1.0
        
        cell.vehicleImage.layer.cornerRadius = cornerRadius
        cell.vehicleImage.clipsToBounds = true
        
        if let url = URL(string: vehicle.imageUrl!){
            cell.vehicleImage.kf.setImage(with: url)
        }
        cell.vehicleInfoLabel.text = "\(vehicle.manufacturor.name) \(vehicle.model)"
        cell.detailInfoLabel.text = "Årsmodell \(vehicle.modelYear)"
        
        
        return cell
    }
    
}
