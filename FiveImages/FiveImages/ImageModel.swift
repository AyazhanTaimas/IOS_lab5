import SwiftUI

struct ImageModel: Identifiable {
    let id = UUID()
    let uiImage: UIImage  // Используем UIImage вместо Image
}
