import FeatherAPIKit
import FeatherOpenAPIKit

extension File.Chunk {

    public enum Operations {

        enum Upload: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Upload chunk"
            static let description = """
                Upload a chunk data
                """

            static let requestBody: RequestBody.Type? = RequestBodies.Upload
                .self
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

        enum Delete: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Deletes a chunk"
            static let description = """
                Deletes a chunk
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
            static let summary = "Gets the chunk list"
            static let description = """
                Gets the chunk list
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

        enum GetById: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Gets a chunk info by id"
            static let description = """
                Gets a chunk info by id
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

        enum DeleteById: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Deletes a chunk by id"
            static let description = """
                Deletes a chunk by id
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

        enum Get: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Gets a chunk info"
            static let description = """
                Gets a chunk info
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
