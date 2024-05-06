import FeatherAPIKit
import FeatherOpenAPIKit

extension File.Storage {

    enum Operations {

        enum Download: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Download a file"
            static let description = """
                Download a file
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

        enum SimpleUpload: Operation {
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

        enum ChunkedUpload: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Creates a chunked upload"
            static let description = """
                Create a document using a chunked upload
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.UploadChunkedDetail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum ChunkedUploadChunk: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Upload chunk"
            static let description = """
                Upload a chunk data
                """

            static let requestBody: RequestBody.Type? = RequestBodies.Upload
                .self
            static let responses: [OperationResponse] = [
                .ok(Responses.ChunkDetail.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum ChunkedRemoveChunk: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Remove chunk"
            static let description = """
                Removes a chunk
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

        enum UploadList: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Gets the upload list"
            static let description = """
                Gets the upload list
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.UploadList.self),
                .badRequest,
                .unauthorized,
                .forbidden,
                .notFound,
                .unsupportedMediaType,
                .unprocessableContent,
            ]
        }

        enum ChunkList: Operation {
            static let security: [SecurityScheme.Type] = .shared
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Gets the chunk list"
            static let description = """
                Gets the chunk list
                """

            static let responses: [OperationResponse] = [
                .ok(Responses.ChunkList.self),
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
