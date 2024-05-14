import FeatherAPIKit
import FeatherOpenAPIKit

extension File.Resource {

    public enum Operations {

        enum Download: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Download a file resource"
            static let description = """
                Download a file resource
                """
            static var parameters: [Parameter.Type] = [
                Parameters.DownloadRequestHeader.self
            ]
            static let responses: [OperationResponse] = [
                .ok(Responses.Download.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum Delete: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Deletes a file resource"
            static let description = """
                Deletes a file resource
                """

            static let responses: [OperationResponse] = [
                .noContent,
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum List: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Lists the file resources"
            static let description = """
                Lists the file resources
                """
            static let parameters: [Parameter.Type] =
                [
                    Parameters.List.Sort.self
                ] + Feather.Core.Parameters.List.parameters

            static let responses: [OperationResponse] = [
                .ok(Responses.List.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum Get: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Gets a file resource detail"
            static let description = """
                Gets a file resource detail
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.Detail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

    }
}
