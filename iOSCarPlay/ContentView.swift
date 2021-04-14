//
//  ContentView.swift
//  iOSCarPlay
//
//  Created by Maddox on 4/14/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                Button {
                    
                } label: {
                    IconView()
                        .padding(.leading, 4)
                }
                
                Button {
                    
                } label: {
                    IconView()
                        .padding(.trailing, 4)
                }
            }
        }
    }
}

struct IconView: View {
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: geometry.size.width, height: geometry.size.width, alignment: .top)
                .clipped(antialiased: true)
        }
    }
}

struct IconShade: View {
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: geometry.size.width, height: geometry.size.width, alignment: .top)
                .clipped(antialiased: true)
                .foregroundColor(Color.gray)
                .opacity(0.5)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
