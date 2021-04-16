//
//  ContentView.swift
//  iOSCarPlay
//
//  Created by Maddox on 4/14/2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation] ()
    
    var body: some View {
        GeometryReader { geometry in

            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()

            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: .infinity, alignment: .trailing)
                        .foregroundColor(Color.black.opacity(0.8))
                        .edgesIgnoringSafeArea(.bottom)
                        .blur(radius: 0)

                    VStack(spacing: 10) {
                        
                        // 1st App
                        Button {
                            let newLocation = MKPointAnnotation()
                            newLocation.coordinate = self.centerCoordinate
                            self.locations.append(newLocation)
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
                ZStack {
                    MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                        .cornerRadius(53.33)
                        .padding(15)
                        .ignoresSafeArea()
                    Circle()
                        .fill(Color.blue)
                        .opacity(0.3)
                        .frame(width: 32, height: 32)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                //
                            }) {
                                Image(systemName: "plus")
                            }
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(Color.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                        }
                    }
                }
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
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
            
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
        
        }
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
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
