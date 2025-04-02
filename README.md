# iOS_lab5
## FiveImages

### Описание проекта
FiveImages — это простое iOS-приложение, которое загружает 5 случайных изображений с сервера и отображает их в сетке. Пользователь может нажать на любое изображение, чтобы открыть его в полноэкранном режиме.

 **Функции** 
Загрузка 5 случайных изображений с сервера https://picsum.photos/500.
Отображение изображений в виде сетки (LazyVGrid).
Открытие изображения в новом экране (FullScreenImageView) при нажатии.
Кнопка обновления списка изображений.

**Технологии** 
SwiftUI для создания пользовательского интерфейса.
UIKit (UIImage) для работы с изображениями.
URLSession для загрузки изображений из сети.
GCD (DispatchGroup) для асинхронной загрузки нескольких изображений.
MVVM (Model-View-ViewModel) для разделения логики.

**Загрузка изображений (ImagesViewModel.swift)**
```swift
final class ImagesViewModel: ObservableObject {
    @Published var images: [ImageModel] = []

    func getImages() {
        var tempImages: [ImageModel] = []
        let group = DispatchGroup()

        let urlStrings: [String] = (0...4).map { _ in "https://picsum.photos/500" }

        for url in urlStrings {
            group.enter()
            downloadImage(urlString: url) { model in
                if let model = model {
                    tempImages.append(model)
                }
                group.leave()
            }
        }

        group.notify(queue: .main) {
            self.images += tempImages
        }
    }
}
```
