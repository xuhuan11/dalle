//
//  OpenAIClient.swift
//  
//
//  Created by zhangpeibj01 on 2023/4/23.
//

import Foundation
import OpenAIKit
import Vapor

public class OpenAIClient {
    public static func requestForImage(prompt: String, count: Int, size: String) async throws -> AIImage {
        let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

        let httpClient = HTTPClient(eventLoopGroupProvider: .shared(eventLoopGroup))

        defer {
            try? httpClient.syncShutdown()
        }

        let configuration = Configuration(apiKey: "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")
        let openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
        let image = try await openAIClient.images.create(prompt: prompt, n: count, size: AIImageSize(rawValue: size)?.size ?? .tenTwentyFour)
        return .init(data: image.data.map { .init(url: $0.url) })
    }
}

enum AIImageSize: String {
    case small
    case medium
    case large

    var size: Image.Size {
        switch self {
        case .small:
            return .twoFiftySix
        case .medium:
            return .fiveTwelve
        case .large:
            return .tenTwentyFour
        }
    }
}

public struct AIImage: Codable, Content {
    public let data: [ImageData]

    public struct ImageData: Codable {
        public let url: String
    }
}

public struct ImagesData: Codable, Content {
    public let datas: [Data]
}
