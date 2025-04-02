import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ImagesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                        ForEach(viewModel.images) { model in
                            NavigationLink(destination: FullScreenImageView(image: model.uiImage)) {
                                Image(uiImage: model.uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }

                Button("Get 5 Images") {
                    viewModel.getImages()
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            .navigationTitle("Pinterest Gallery")
        }
    }
}
