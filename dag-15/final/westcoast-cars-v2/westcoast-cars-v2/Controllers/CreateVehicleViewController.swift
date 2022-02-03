//
//  CreateVehicleViewController.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-02-01.
//

import UIKit

enum pickerViewEnum: Int {
    case gear
    case fuel
    case manufacturer
}

enum vehicleError: Error {
    case typeError
}

class CreateVehicleViewController: UIViewController {

    @IBOutlet weak var regNoInput: UITextField!
    @IBOutlet weak var manufacturorInput: UITextField!
    @IBOutlet weak var modelInput: UITextField!
    @IBOutlet weak var gearTypeInput: UITextField!
    @IBOutlet weak var fuelTypeInput: UITextField!
    @IBOutlet weak var modelYearInput: UITextField!
    @IBOutlet weak var colorInput: UITextField!
    @IBOutlet weak var mileageInput: UITextField!
    
    let fuelTypes = ["Bensin", "Diesel", "Hybrid", "El"]
    let gearTypes = ["Automat", "Manuell", "Steptronic"]
    
    var manufacturors : [Manufacturor] = []
    
    var fuelTypePickerView = UIPickerView()
    var gearTypePickerView = UIPickerView()
    var manufacturorPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadManufacturors()

        fuelTypePickerView.delegate = self
        fuelTypePickerView.dataSource = self
        fuelTypePickerView.tag = pickerViewEnum.fuel.rawValue
        
        gearTypePickerView.delegate = self
        gearTypePickerView.dataSource = self
        gearTypePickerView.tag = pickerViewEnum.gear.rawValue
        
        manufacturorPickerView.delegate = self
        manufacturorPickerView.dataSource = self
        manufacturorPickerView.tag = pickerViewEnum.manufacturer.rawValue
        
        fuelTypeInput.inputView = fuelTypePickerView
        gearTypeInput.inputView = gearTypePickerView
        manufacturorInput.inputView = manufacturorPickerView
    }
    
    
    @IBAction func saveVehicleButton(_ sender: UIButton) {
        SaveVehicle()
        self.performSegue(withIdentifier: "backToVehicleList", sender: self)
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

extension CreateVehicleViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == pickerViewEnum.fuel.rawValue {
            return fuelTypes.count
        } else if pickerView.tag == pickerViewEnum.gear.rawValue {
            return gearTypes.count
        } else {
            return manufacturors.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == pickerViewEnum.fuel.rawValue {
            fuelTypeInput.text = fuelTypes[row]
            fuelTypeInput.resignFirstResponder()
        } else if pickerView.tag == pickerViewEnum.gear.rawValue {
            gearTypeInput.text = gearTypes[row]
            gearTypeInput.resignFirstResponder()
        } else {
            manufacturorInput.text = manufacturors[row].name
            manufacturorInput.resignFirstResponder()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == pickerViewEnum.fuel.rawValue {
            return fuelTypes[row]
        } else if pickerView.tag == pickerViewEnum.gear.rawValue {
            return gearTypes[row]
        } else {
            return manufacturors[row].name
        }
    }
}

extension CreateVehicleViewController {
    func loadManufacturors() {
        if let url = URL(string: "https://westcoast-cars-api.herokuapp.com/api/v1/manufacturors/"){
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){(data, response, error) in
                if error != nil {
                    print("Något gick fel \(error!)")
                }
                
                guard let manufacturorListingData = data else {
                    return
                }
                
                print("Efter guard: \(manufacturorListingData)")
                
                let decoder = JSONDecoder()
                
                do {
                    let makeList = try decoder.decode(ManufacturorListingMapper.self, from: manufacturorListingData)
                    
                    print("MakeList: \(makeList)")
                    DispatchQueue.main.async {
                        self.manufacturors = makeList.data
                        print(self.manufacturors)
                    }
                } catch {
                    print(error)
                }
                
            }.resume()
        }
    }
    
    func SaveVehicle() {
        // Vi måste skapa ett Swift objekt som representerar de data som EndPoint i API'et förväntar sig...
        
        do {
            let vehicle = try createVehicleModel()
            
            let make = manufacturors.first(where: {$0.name == manufacturorInput.text})
            
            guard let makeId = make?._id else { return }
            
            if let url = URL(string: "https://westcoast-cars-api.herokuapp.com/api/v1/manufacturors/\(makeId)/vehicles"){
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                
                let vehicleJson = try JSONEncoder().encode(vehicle)
                
                // HTTP måste ha ett data innehåll. HTTP pakets body
                request.httpBody = vehicleJson
                
                URLSession.shared.dataTask(with: request){(data, response, error) in
                    if error != nil {
                        print("Något gick fel, \(error!)")
                    }
                    
                    print(response!)
                    
                    guard let responseData = data else {
                        print("Gick inte att få tag i datat")
                        return
                    }
                    
                    print("Här är datat som kom tillbaka: \(responseData)")
                    
                }.resume()
                
            }
        } catch {
            print(error)
        }
    }
    
    func createVehicleModel() throws -> CreateVehicleModel {
        guard let registrationNumber = regNoInput.text else { throw vehicleError.typeError }
        guard let model = modelInput.text else { throw vehicleError.typeError }
        guard let modelYear = Int(modelYearInput.text!) else { throw vehicleError.typeError }
        guard let mileage = Int(mileageInput.text!) else { throw  vehicleError.typeError}
        guard let gearType = gearTypeInput.text else { throw vehicleError.typeError }
        guard let fuelType = fuelTypeInput.text else { throw vehicleError.typeError }
        guard let color = colorInput.text else { throw vehicleError.typeError}
        
        let vehicle = CreateVehicleModel(regNo: registrationNumber, vehicleModel: model, modelYear: modelYear, color: color, mileage: mileage, gearType: gearType, fuelType: fuelType)
        
        return vehicle
    }
}
