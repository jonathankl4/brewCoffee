import SwiftUI
import UIKit
import ImageIO

extension UIImage {
    // Extension untuk memuat GIF dari data
    static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        let frameCount = CGImageSourceGetCount(source)
        var frames: [UIImage] = []
        var gifDuration = 0.0

        for i in 0..<frameCount {
            guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else { continue }

            if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil),
               let gifInfo = (properties as NSDictionary)[kCGImagePropertyGIFDictionary as String] as? NSDictionary,
               let frameDuration = (gifInfo[kCGImagePropertyGIFDelayTime as String] as? NSNumber) {
                gifDuration += frameDuration.doubleValue
            }

            let frameImage = UIImage(cgImage: cgImage)
            frames.append(frameImage)
        }

        let animatedImage = UIImage.animatedImage(with: frames, duration: gifDuration)
        return animatedImage
    }
}

struct GifImage: UIViewRepresentable {
    enum URLType {
        case local(String) // Untuk GIF dari Assets
        case remote(URL?)  // Untuk GIF dari URL

        var url: URL? {
            switch self {
                case .local(let name):
                    return Bundle.main.url(forResource: name, withExtension: "gif") // Ambil dari Assets
                case .remote(let url):
                    return url
            }
        }
    }

    let type: URLType
    var loaded: ((UIImageView, UIImage?) -> Void)?

    func makeUIView(context: Context) -> UIView {
        let view = UIImageView()
        DispatchQueue.global(qos: .background).async {
            if let url = type.url, let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if let image = UIImage.gif(data: data) {
                        view.image = image
                        view.contentMode = .scaleAspectFit
                        self.loaded?(view, image)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.loaded?(view, nil)
                }
            }
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct SplashScreen: View {
    @State private var showSplash = true
    @State private var opacity = 1.0 // Untuk animasi fade out

    var body: some View {
        ZStack {
            if showSplash {
                splashscreen()
                    .transition(.opacity)
                    .opacity(opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(.easeOut(duration: 0.5)) {
                                opacity = 0.0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showSplash)
    }
}

struct splashscreen: View {
    
    @State private var size: CGSize?

    var body: some View {
        let gifName = "kucing"

                if let path = Bundle.main.path(forResource: gifName, ofType: "gif"),
                   let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                    GifImage(type: .local(gifName)) { _, image in
                        size = image?.size
                    }
                    .frame(width: size?.width ?? 200, height: size?.height ?? 200)
                } else {
                    Text("GIF tidak ditemukan")
                }

    }
}

#Preview {
    splashscreen()
}
