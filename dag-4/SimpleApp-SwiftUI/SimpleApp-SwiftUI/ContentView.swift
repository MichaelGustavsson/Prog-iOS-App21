//
//  ContentView.swift
//  SimpleApp-SwiftUI
//
//  Created by Michael Gustavsson on 2021-12-17.
//

import SwiftUI
/*
    SwiftUI arbetar enligt design layout
    VHZ
    V = Vertikal layout
    H = Horisonell layout
    Z = Nivå layout
*/
struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.33, green: 0.52, blue: 0.67)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("mandel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle()
                                .stroke(Color.white, lineWidth: 3))
                
                Text("Skaftö Skorpan")
                    .font(Font.custom("MontserratAlternates-Regular", size: 30))
                .foregroundColor(.white)
                
                Text("Ett familje bageri")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                ContactInfo(imageName: "phone.fill", text: "+46-303-4123458")
                ContactInfo(imageName: "envelope.fill", text: "info@gmail.com")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

//struct ContactInfo: View {
//    var imageName: String
//    var text: String
//    
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.white)
//            .frame(height: 40)
//            .overlay(
//                HStack {
//                    Image(systemName: imageName).foregroundColor(.black)
//                    Text(text)
//                        .foregroundColor(.black)
//                    
//                }
//            ).padding()
//    }
//}
