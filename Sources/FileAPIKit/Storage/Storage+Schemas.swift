import FeatherOpenAPIKit
import OpenAPIKit

extension File.Storage {

    enum Schemas {

        enum Id: IDSchema {
            static let description = "File identifier"
        }

        enum UploadId: IDSchema {
            static let description = "Upload identifier"
        }

        enum DownloadRequestHeader: TextSchema {
            static let description = "Download request header"
            static let examples = [
                "bytes=0-1023"
            ]
        }

        enum SimpleDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("fileId", Id.self)
            ]
            static let description = "Simple detail"
        }

        enum FinishChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("fileId", Id.self)
            ]
            static let description = "Chunked detail"
        }

        enum UploadChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", UploadId.self)
            ]
            static let description = "Chunked detail"
        }

        enum ChunkDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", UploadId.self),
                .init("chunkNumber", ChunkNumber.self),
            ]
            static let description = "Chunk detail"
        }

        enum UploadListItem: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", UploadId.self)
            ]
            static let description = "Upload list item"
        }

        enum UploadList: ArraySchema {
            static let items: Schema.Type = UploadListItem.self
            static let description = "Upload list"
        }

        enum ChunkList: ArraySchema {
            static let items: Schema.Type = ChunkDetail.self
            static let description = "Chunk list"
        }

        enum ChunkNumber: IntSchema {
            static let minimum = 0
            static let maximum = 1000
            static let description = "The number of the chunk"
        }
    }
}
