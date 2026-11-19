import SwiftUI
import UIKit

let MI_BUNDLE_ID = "com.apple.mobile.MobileHouseArrest"
let MI_TEAM_ID = "SIN-TEAM-TODAVIA"

struct ContentView: View {
    @State private var entro = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if entro {
                // SEGUNDA PANTALLA
                VStack(spacing: 12) {
                    Text("BIENVENIDO A")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .bold))
                    Text("TYRONE XIT")
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.white)
                    Text("Ya entraste, bro.")
                        .foregroundColor(.gray)
                    
                    Button(action: { entro = false }) {
                        Text("VOLVER")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                }
            } else {
                // PANTALLA DE INICIO
                VStack(spacing: 12) {
                    Text("TYRONE XIT")
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.white)
                    Text("Home - Desde Cero")
                        .foregroundColor(.gray)
                    
                    Button(action: { entro = true }) {
                        Text("ENTRAR")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
