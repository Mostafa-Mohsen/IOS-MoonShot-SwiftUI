//
//  AstronautDetailsView.swift
//  Moon Shot
//
//  Created by Soft Xpert on 9/11/21.
//

import SwiftUI

struct AstronautDetailsView: View {
    var astronaut: Astronaut?
    
    var body: some View {
        GeometryReader() { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut?.id ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding()


                    Text(astronaut?.description ?? "")
                        .padding()
                }
            }
        }
        .navigationBarTitle(astronaut?.id ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautDetailsView_Previews: PreviewProvider {
    static let astronaurs: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautDetailsView(astronaut: astronaurs[0])
    }
}
