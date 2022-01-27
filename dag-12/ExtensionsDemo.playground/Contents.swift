import UIKit

extension Double {    
    func round(to decimals: Int) -> Double{
        let precision = pow(10, Double(decimals))
        var number = self
        number = number * precision
        number.round()
        number = number / precision
        
        return number
    }
    
    func michael(weight: Int){
        
    }
}

var weight: Double = 4.983727

let value = weight.round(to: 4)

let height: Double

