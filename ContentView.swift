import SwiftUI
import UniformTypeIdentifiers

struct Patch: Identifiable {
    let id = UUID(com.apple.mobile.MobileHouseArrest)
    var nombre: String
    var reglas: String
}

struct ContentView: View {
    @State private var tab = 0
    @State private var patches: [Patch] = [Patch(nombre: "Pecho+antena+holo", reglas: "2 replacement rules")]
    @State private var showImporter = false
    @State private var showNewPatch = false
    @State private var mensaje = ""
    @State private var search = ""
    
    var body: some View {
        TabView(selection: $tab) {
            // ===== HOME - IGUAL QUE 3105 =====
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Device").font(.title2).bold()
                    VStack(alignment: .leading, spacing: 8) {
                        fila("Hardware model", "iPhone13,2")
                        fila("iOS Version", "26.6.0 (23G71)")
                        HStack {
                            Text("Compatibility")
                            Spacer()
                            Label("Supported", systemImage: "checkmark.circle.fill").foregroundColor(.green)
                        }
                        Text("Verified: iOS 26.0-26.6.1 and the four listed iOS 27.0 beta builds.").font(.caption).foregroundColor(.gray)
                    }
                    Text("Installation").font(.title3).bold()
                    HStack(alignment: .top) {
                        Image(systemName: "exclamationmark.triangle").foregroundColor(.orange)
                        Text("3105 only works when signed with an enterprise certificate. SideStore, AltStore, 3uTools and LiveContainer are not supported.").font(.caption)
                    }
                    .padding().background(Color.orange.opacity(0.1)).cornerRadius(12)
                    
                    Text("TYRONE XIT - Home - Desde Cero").font(.caption).foregroundColor(.purple)
                }.padding()
            }
            .tabItem { Label("Home", systemImage: "house.fill") }.tag(0)
            
            // ===== FILES =====
            VStack {
                Text("App Data Browser").font(.title3).bold().padding(.top)
                TextField("Search apps", text: $search).padding(10).background(Color.gray.opacity(0.15)).cornerRadius(10).padding(.horizontal)
                List {
                    Text("TYRONE XIT").bold()
                    Text("com.apple.mobile.MobileHouseArrest").font(.caption).foregroundColor(.gray)
                    Text("1 app data").font(.caption).foregroundColor(.gray)
                }
            }
            .tabItem { Label("Files", systemImage: "folder.fill") }.tag(1)
            
            // ===== PATCHES - LA IMPORTANTE =====
            VStack {
                HStack {
                    Text("Patches").font(.title2).bold()
                    Spacer()
                    Button(action: { showNewPatch = true }) { Image(systemName: "plus") }
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
                Spacer()
                Text("Dale al + arriba para importar tu .3105").font(.caption).foregroundColor(.gray)
            }
            .tabItem { Label("Patches", systemImage: "shippingbox.fill") }.tag(2)
            .sheet(isPresented: $showNewPatch) {
                VStack(spacing: 20) {
                    Text("Importar Patch").font(.title2).bold()
                    Button("📄 New Patch") { patches.append(Patch(nombre: "Nuevo Patch", reglas: "0 replacement rules")); showNewPatch = false }
                        .padding().background(Color.gray.opacity(0.2)).cornerRadius(12)
                    Button("📦 Import .3105") { showNewPatch = false; showImporter = true }
                        .padding().background(Color.purple).foregroundColor(.white).cornerRadius(12)
                    Button("Cancelar") { showNewPatch = false }.foregroundColor(.red)
                    Spacer()
                }.padding().presentationDetents([.medium])
            }
            .fileImporter(isPresented: $showImporter, allowedContentTypes: [UTType(filenameExtension: "3105") ?? .data, .data]) { result in
                switch result {
                case .success(let url):
                    let nombre = url.lastPathComponent
                    patches.append(Patch(nombre: nombre, reglas: "Importado desde Archivos"))
                    mensaje = "✅ Importado: \(nombre)"
                case .failure:
                    mensaje = "No se pudo importar"
                }
            }
            
            // ===== CLEANER =====
            VStack(spacing: 12) {
                Text("Cleaner").font(.title2).bold().padding(.top)
                Text("Scanning app caches...\n0 scanned").multilineTextAlignment(.center).padding().background(Color.orange.opacity(0.1)).cornerRadius(12)
                Spacer()
            }.tabItem { Label("Cleaner", systemImage: "sparkles") }.tag(3)
            
            // ===== WALLPAPERS =====
            VStack(spacing: 12) {
                Text("Wallpaper Lab").font(.title2).bold().padding(.top)
                HStack { Image(systemName: "checkmark.shield.fill").foregroundColor(.green); Text("PosterBoard Access\nReady to install").font(.caption) }
                Text("No wallpaper packages\nImport .tendies packages to begin.").multilineTextAlignment(.center).foregroundColor(.gray)
                Text("Import .tendies").padding(8).background(Color.orange.opacity(0.2)).cornerRadius(10)
                Spacer()
            }.tabItem { Label("Wallpapers", systemImage: "photo") }.tag(4)
        }
    }
    
    func fila(_ a: String, _ b: String) -> some View {
        HStack { Text(a); Spacer(); Text(b).foregroundColor(.gray) }
    }
}
