import SwiftUI
import UIKit

let MI_BUNDLE_ID = "com.apple.mobile.MobileHouseArrest"
let MI_TEAM_ID = "SIN-TEAM-TODAVIA"
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 12) {
                Text("TYRONE XIT")
                    .font(.system(size: 32, weight: .black))
                    .foregroundColor(.white)
                Text("Home - Desde Cero")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
