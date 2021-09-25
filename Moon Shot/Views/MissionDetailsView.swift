//
//  MissionDetailsView.swift
//  Moon Shot
//
//  Created by Soft Xpert on 9/11/21.
//

import SwiftUI

struct MissionDetailsView: View {
    let mission: Mission
    let astronaurs: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    var crews: [MissionCrews] {
        var crew: [MissionCrews] = []
        crew = mission.crew.map({
            let memberName = $0.name
            return MissionCrews(role: $0.role, crew: astronaurs.first(where: { $0.id == memberName }))
        })
        return crew
    }
    
    var body: some View {
        GeometryReader() { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding()


                    Text(mission.description)
                        .padding()

                    ForEach(crews, id: \.role) { crew in
                        NavigationLink(destination: AstronautDetailsView(astronaut: crew.crew)) {
                            HStack {
                                Image(crew.crew?.id ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 22))
                                    .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.black))
                                    .padding()
                                
                                VStack(alignment: .leading) {
                                    Text(crew.crew?.name ?? "")
                                        .font(.headline)
                                    Text(crew.role)
                                }
                                
                                Spacer()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.missionName))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MissionDetailsView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionDetailsView(mission: missions[0])
    }
}
