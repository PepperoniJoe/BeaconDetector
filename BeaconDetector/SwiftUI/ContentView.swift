//
//  ContentView.swift
//  BeaconDetector
//
//  Created by Marcy Vernon on 11/12/20.
//

import SwiftUI

struct Standard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 15))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .foregroundColor(Color.white)
    }
}


struct ContentView: View {
    @ObservedObject var detector = Detector()
    var voiceSynthesizer = VoiceSynthesizer()
    
    
    var body: some View {
        
        //MARK: - Art Details
        VStack {
            VStack(spacing: 0) {
                Text(detector.exhibitTitle)
                    .font(Font.system(size: 25))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                    .foregroundColor(Color("DefaultColor"))
                Text(detector.roomTitle)
                    .font(Font.system(size: 20))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                    .foregroundColor(Color("DefaultColor"))
                Text(detector.titleString)
                    .font(Font.system(size: 35))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color("DefaultColor"))
                Image(detector.imageString)
                    .resizable()
                    .aspectRatio(CGSize(width: 600, height: 750), contentMode: .fit)
                    .clipShape(Circle() )
                Text(detector.textDescription)
                    .font(Font.system(size: 20))
                    .foregroundColor(Color("DefaultColor"))
            }
            
            
            Spacer()
            
            //MARK: - Beacon Details
            VStack {
                Text("BEACON DETAILS")
                    .modifier(Standard())
                Text("UUID: \(K.uuid)")
                    .font(Font.system(size: 12, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                Text("Major: \(detector.major)")
                    .modifier(Standard())
                Text("Minor: \(detector.minor)")
                    .modifier(Standard())
                Text("Beacon Status:  \(detector.lastDistance)")
                    .font(Font.system(size: 15, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                    .background(detector.bgColor)
            }
            .frame(maxHeight: 120)
            .background(Color("DefaultColor"))
        }
        .alert(isPresented: $detector.showAlert) {
            Alert(title: Text(K.alert), message: Text(detector.alert), dismissButton: .default(Text(K.ok)))
        }
        
        Spacer()
            
            .onChange(of: detector.titleString) { [detector] newState in
                voiceSynthesizer.say(speaker: .gordon , phrase: detector.speach)
            }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
            ContentView()
        }
    }
}
#endif
