//
//  ContactInfo.swift
//  SimpleApp-SwiftUI
//
//  Created by Michael Gustavsson on 2021-12-17.
//

import SwiftUI

// Visuell komponent!!!
struct ContactInfo: View {
    var imageName: String
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(
                HStack {
                    Image(systemName: imageName).foregroundColor(.blue)
                    Text(text)
                        .foregroundColor(.black)
                    
                }
            ).padding()
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo(imageName: "phone.fill", text: "Demo text")
            .previewLayout(.sizeThatFits)
    }
}
