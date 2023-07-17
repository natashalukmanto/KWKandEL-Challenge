import SwiftUI

extension Color {
    static let brightPink = Color(red: 246/255, green: 73/255, blue: 111/255)
    static let oldRose = Color(red: 189/255, green: 114/255, blue: 128/255)
    static let amaranthPink = Color(red: 225/255, green: 160/255, blue: 178/255)
    static let mimiPink = Color(red: 249/255, green: 218/255, blue: 228/255)
    static let paleDogwood = Color(red: 222/255, green: 197/255, blue: 200/255)
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Cart = "cart"
    case Profile = "person"
    
    var Tabname: String{
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notification:
            return "Notification"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}


struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Home
    init() {
        UITabBar.appearance().isHidden = true
    }
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomePageView()
            
            VStack {
                SearchView()
                ProductsView()
            }
            .tag(Tab.Search)
            
            VStack {
                Text("You have no new notifications.")
                    .font(.custom(
                        "Optima",
                        size: 20) .bold())
                    .padding(.vertical, 1)
                    .foregroundColor(.brightPink)
            }
            .tag(Tab.Notification)
            
            VStack {
                Text("Your Cart")
                    .font(.custom(
                        "Optima",
                        size: 30) .bold())
                    .padding(.vertical, 1)
                    .foregroundColor(.brightPink)
                CartView()
            }
            .tag(Tab.Cart)
            
            VStack {
                Text("Your Profile")
                    .font(.custom(
                        "Optima",
                        size: 30) .bold())
                    .padding(.vertical, 1)
                    .foregroundColor(.brightPink)
                Spacer()
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.brightPink)
                    Text("Jane Doe")
                        .font(.custom(
                            "Optima",
                            size: 25) .bold())
                        .foregroundColor(.brightPink)
                }
                .offset(x: -120, y: -600)
                Text("Member since 2018")
                    .font(.custom(
                        "Optima",
                        size: 20) .bold())
                    .padding(.vertical, 1)
                    .foregroundColor(.brightPink)
                    .offset(x: -100, y: -600)
            }
            .tag(Tab.Profile)
                
        }
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in TabButton(tab: tab)}
                    .padding(.vertical)
                    .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                    .background(Color.amaranthPink)
            }
            ,
            alignment: .bottom
        ).ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: Tab) -> some View {
        GeometryReader{proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            },label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    Text(tab.Tabname)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        ).contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -10 : 0)
                }
            })
        }
        .frame(height: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

