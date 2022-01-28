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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
