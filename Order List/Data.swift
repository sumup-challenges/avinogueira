import Foundation

struct Item: Hashable, Codable {

    var name = "Default name"
}

struct Order: Identifiable, Hashable, Codable {

    enum DeliveryType: String, Codable {
        case pickup
        case delivery
    }

    var id = UUID()

    let storeID: Int

    var date = Date()

    let deliveryType: DeliveryType

    var items: [Item]
}

let sampleOrders = [Order(storeID: 1004, deliveryType: .delivery, items: [Item(), Item()]),
                    Order(storeID: 1005, deliveryType: .delivery, items: [Item()]),
                    Order(storeID: 1006, deliveryType: .delivery, items: [Item(), Item(), Item()]),
                    Order(storeID: 1007, deliveryType: .pickup, items: [Item(), Item(), Item(), Item()]),
                    Order(storeID: 1008, deliveryType: .delivery, items: [Item(), Item(), Item(), Item()]),
                    Order(storeID: 1009, deliveryType: .pickup, items: [Item()])]
