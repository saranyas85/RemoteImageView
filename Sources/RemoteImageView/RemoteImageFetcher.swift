//
//  RemoteImageFetcher.swift
//  RemoteImageView
//
//  Created by Saranya Selvaraj on 05/05/26.
//

import SwiftUI

public class RemoteImageFetcher: ObservableObject {
    @Published var imageData = Data()
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func fetch() {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
    // 2
    public func getImageData() -> Data {
        return imageData
    }

    // 3
    public func getUrl() -> URL {
        return url
    }

    public func purge() {
      imageData = Data()
    }

    public func desc() -> String {
        return "hello"
    }

}
