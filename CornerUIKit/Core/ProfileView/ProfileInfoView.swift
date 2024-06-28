//
//  ProfileInfoView.swift
//  CornerUIKit
//
//  Created by Adnan Joraid on 2024-06-27.
//

import SwiftUI

struct Detail {
    let label: String
    let info: Int
    let details: [String]?
}
struct ContainerView: View {
    let detail: Detail
    var body: some View {
        HStack {
            VStack {
                Text("\(detail.info)")
                    .bold()
                    .font(.title2)
                    .fontDesign(.serif)
                    .fontWidth(.expanded)
                    
                Text(detail.label)
                    .foregroundStyle(detail.details == nil ? .gray : .black)
            }
            .padding([.top, .bottom])
            
            if let details = detail.details {
                VStack(alignment: .leading) {
                    ForEach(details, id: \.self) { d in
                        Text(d)
                            .font(.system(size: 15))
                    }
                }
                .padding(.leading)
            }
        }
        .frame(height: 40)
        .padding()
        .background(Color(cgColor:CGColor(red: 240 / 255,
                            green: 240 / 255,
                            blue: 240 / 255,
                            alpha: 1.0)))
        .cornerRadius(18)

    }
}


struct ProfileInfoView: View {
    let mockData = [
        Detail(label: "cities",
               info: 45,
               details: ["New York",
                         "Tokyo",
                         "Paris"]),
        Detail(label: "places",
               info: 820,
               details: nil),
        
        Detail(label: "views",
               info: 180,
               details: nil)
    ]
    var body: some View {
        HStack {
            ForEach(mockData, id: \.info) { datum in
                ContainerView(detail: datum)
                    .padding(4)
            }
        }
    }
}

#Preview {
    ProfileInfoView()
}
