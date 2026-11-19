import SwiftUI

struct PatchItem: Identifiable {
    let id = UUID(com.apple.mobile.MobileHouseArrest)
    var nombre: String
    var reglas: String
}

struct ContentView: View {
    @State private var tab = 0
    @State private var patches: [PatchItem] = [PatchItem(nombre: "Pecho+antena+holo", reglas: "2 replacement rules")]
    @State private var showSheet = false
    @State private var mensaje = ""
    @State private var search = ""

    var body: some View {
        TabView(selection: $tab) {
            // HOME
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Device").font(.title2).bold()
                    VStack(alignment: .leading, spacing: 10) {
                        HStack { Text("Hardware model"); Spacer(); Text("iPhone13,2").foregroundColor(.gray) }
                        HStack { Text("iOS Version"); Spacer(); Text("26.6.0 (23G71)").foregroundColor(.gray) }
                        HStack { Text("Compatibility"); Spacer(); Text("✅ Supported").foregroundColor(.green) }
                        Text("Verified: iOS 26.0-26.6.1 and the four listed iOS 27.0 beta builds.").font(.caption).foregroundColor(.gray)
                    }
                    Text("Installation").font(.title3).bold()
                    Text("3105 only works when signed with an enterprise certificate. SideStore, AltStore, 3uTools and LiveContainer are not supported.")
                        .font(.caption)
                        .padding()
                        .background(Color.orange.opacity(0.12))
                        .cornerRadius(12)
                    Text("TYRONE XIT - Home - Desde Cero").font(.caption).foregroundColor(.purple)
                }.padding()
            }
            .tabItem { Label("Home", systemImage: "house.fill") }.tag(0)

            // FILES
            VStack {
                Text("App Data Browser").font(.title3).bold().padding(.top)
                TextField("Search apps", text: $search)
                    .padding(10).background(Color.gray.opacity(0.15)).cornerRadius(10).padding(.horizontal)
                List {
                    VStack(alignment: .leading) {
                        Text("TYRONE XIT").bold()
                        Text("com.apple.mobile.MobileHouseArrest").font(.caption).foregroundColor(.gray)
                        Text("1 app data").font(.caption).foregroundColor(.gray)
                    }
                }
            }
            .tabItem { Label("Files", systemImage: "folder.fill") }.tag(1)

            // PATCHES
            VStack {
                HStack {
                    Text("Patches").font(.title2).bold()
                    Spacer()
                    Button(action: { showSheet = true }) {
                        Image(systemName: "plus").font(.title3).bold()
                    }
                }.padding()
                List(patches) { p in
                    VStack(alignment: .leading) {
                        Text(p.nombre).bold()
                        Text(p.reglas).font(.caption).foregroundColor(.gray)
                    }
                }
                if !mensaje.isEmpty {
                    Text(mensaje).foregroundColor(.green).font(.caption).padding()
                }
                Text("Dale al + arriba para importar tu .3105").font(.caption).foregroundColor(.gray)
                Spacer()
            }
            .tabItem { Label("Patches", systemImage: "shippingbox.fill") }.tag(2)
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 20) {
                    Text("Importar Patch").font(.title2).bold().padding(.top)
                    Button("New Patch") {
                        patches.append(PatchItem(nombre: "Nuevo Patch", reglas: "0 replacement rules"))
                        showSheet = false
                    }
                    .padding().background(Color.gray.opacity(0.2)).cornerRadius(12)
                    Button("Import .3105") {
                        patches.append(PatchItem(nombre: "AIM Pecho - Antena.3105", reglas: "2 replacement rules"))
                        mensaje = "✅ Importado: AIM Pecho - Antena.3105"
                        showSheet = false
                    }
                    .padding().background(Color.purple).foregroundColor(.white).cornerRadius(12)
                    Button("Cancelar") { showSheet = false }.foregroundColor(.red)
                    Spacer()
                    Text("En la versión final, aquí se abre En mi iPhone para buscar el archivo .3105")
                        .font(.caption).foregroundColor(.gray).multilineTextAlignment(.center).padding()
                }.padding()
            }

            // CLEANER
            VStack(spacing: 12) {
                Text("Cleaner").font(.title2).bold().padding(.top)
                Text("Scanning app caches...\n0 scanned").multilineTextAlignment(.center).padding().background(Color.orange.opacity(0.1)).cornerRadius(12)
                Spacer()
            }
            .tabItem { Label("Cleaner", systemImage: "sparkles") }.tag(3)

            // WALLPAPERS
            VStack(spacing: 12) {
                Text("Wallpaper Lab").font(.title2).bold().padding(.top)
                Text("✅ PosterBoard Access - Ready to install").font(.caption)
                Text("No wallpaper packages\nImport .tendies packages to begin.").multilineTextAlignment(.center).foregroundColor(.gray)
                Text("Import .tendies").padding(8).background(Color.orange.opacity(0.2)).cornerRadius(10)
                Spacer()
            }
            .tabItem { Label("Wallpapers", systemImage: "photo") }.tag(4)
        }
    }
}
