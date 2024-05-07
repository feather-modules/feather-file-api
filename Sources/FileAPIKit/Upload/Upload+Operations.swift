import FeatherAPIKit
import FeatherOpenAPIKit

extension File.Upload {

    enum Operations {

        enum Simple: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Upload a file"
            static let description = """
                Upload a file
                """

            static let requestBody: RequestBody.Type? = RequestBodies.Upload
                .self
            static let responses: [OperationResponse] = [
                .ok(Responses.SimpleDetail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum Chunked: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Creates a chunked upload"
            static let description = """
                Create a document using a chunked upload
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.ChunkedDetail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum ChunkedFinish: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Finish chunked"
            static let description = """
                Finishes a chunked upload
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.FinishChunkedDetail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum ChunkedAbort: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Abort chunked"
            static let description = """
                Abort a chunked upload
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
            static let summary = "Gets the upload list"
            static let description = """
                Gets the upload list
                """

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
    }
}
