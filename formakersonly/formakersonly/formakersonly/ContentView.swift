//
//  ContentView.swift
//  formakersonly
//
//  Created by xcodeday on 12/8/23.
//

import SwiftUI

struct FontNameManager {
    struct Montserrat {
        static let light = "Montserrat-Light"
        static let regular = "Montserrat-Regular"
        static let bold =  "Montserrat-ExtraBold"

    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center ) {
            Text("TAYLOR CANDLE & CO").padding()
            Text(" FOR\n MAKERS\n ONLY")
            .multilineTextAlignment(.center)

            Text("WHEN LIFE GIVES YOU\n WAX, WICK IT")
                    .multilineTextAlignment(.center)
                    .padding(12)
                
                StateView()

            }
            
            .padding()
        }
    }
}

        
struct AZProductView: View {
    @State private var searchText = ""
     @State private var isSearching = false

    var body: some View {
        
        
        
            VStack(alignment: .center) {
                
                SearchBar(searchText: $searchText)
                let GridItems = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(),
                                                                              spacing: 10)]
                
                let images = ["coolcup","cottonwicks"]
                
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                        ForEach(images, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding(30)
                }
                let images1 = ["soybag", "clearcup"]
                
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                        ForEach(images1, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding(30)
                }
                
            }
        }
          }

        

struct StateView: View {
    let stateOptions = ["Select State", "AZ", "CA", "NV"]
    
    @State private var selectedStateIndex = 0
    
    var body: some View {
        VStack {
           
            Picker("Select a state", selection: $selectedStateIndex) {
                ForEach(0..<stateOptions.count, id: \.self) { index in
                    Text(self.stateOptions[index])
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            if selectedStateIndex != 0 {
                NavigationLink(destination: destinationViewForSelectedState()) {
                    Text("Go To Product Page")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func destinationViewForSelectedState() -> some View {
        switch selectedStateIndex {
        case 1:
            return AnyView(AZProductView())
//        case 2:
//            return AnyView(CAproductsView())
//        case 3:
//            return AnyView(NVProductsView())
        default:
            return AnyView(EmptyView())
        }
    }
}




struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding([.leading], 5)
                .padding([.trailing], 5)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(4)
        }
        .padding(.top,10)
        .padding(.bottom,520)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




#Preview {
    ContentView()
}
