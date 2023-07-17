import Foundation

struct Product : Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var price: Int
}

var productList = [
    Product(name: "Airy Lotion", image: "airylotion", description: "DIVE IN AND DRINK UP with Nutritious Airy Lotion. Boosts moisture and reduce oiliness by 33%.", price: 65),
    Product(name: "Essence Lotion", image: "essencelotion", description: "GOODBYE, SHINE with Nutritious Radiant Essence Lotion. Reduce oiliness by 40% and pores appear minized by 31%.", price: 78),
    Product(name: "Foam Cleanser", image: "foamcleanser", description: "LESS IS PORE with Nutritious 2-in-1 Foam Cleanser. Pores appear minized by 17%.", price: 50),
    Product(name: "Soft Creme/Mask", image: "crememask", description: "ALL GLOW NO GRUMP with Nutritious Melting Soft Creme/Mask. Strengthen skin barrier after 1 use.", price: 90),
]
