//
//  ContentView.swift
//  iOSCarPlay
//
//  Created by Maddox on 4/14/2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in

            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()

            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: .infinity, alignment: .trailing)
                        .foregroundColor(Color.black)
                        .edgesIgnoringSafeArea(.bottom)
                        .opacity(0.8)
                        .blur(radius: 0)

                    VStack(spacing: 10) {
                        
                        // 1st App
                        Button {
                            
                        } label: {
                            Image("MapsIcon")
                                .resizable()
                                .frame(width: 57, height: 57, alignment: .top)
                                .cornerRadius(10)
                                .padding(.top,10)
                                .padding(.leading,4)
                            
                        }
                        
                        // 2nd App
                        Button {
                            
                        } label: {
                            IconView()
                                .padding(.leading,4)
                                
                        }
                        
                        // 3rd App
                        Button {
                            
                        } label: {
                            IconView()
                                .padding(.leading,4)
                        }
                        
                        // 4th App
                        Button {
                            
                        } label: {
                            IconView()
                                .padding(.leading,4)
                        }
                        
                        // 5th App
                        Button {
                            
                        } label: {
                            IconView()
                                .padding(.leading,4)
                        }
                    }
                }
                MapView()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct IconView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 57, height: 57, alignment: .top)
            .ignoresSafeArea()
    }
}

// Maps
struct MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
#endif
