//
//  ContentView.swift
//  Moon Shot
//
//  Created by Soft Xpert on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionDetailsView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text(mission.missionName)
                            .font(.headline)
                        Text(mission.formattedDate)
                    }
                }
            }
            .navigationBarTitle("Moon Shot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
