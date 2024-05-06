import FeatherOpenAPIKit

extension File.Storage {

    enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Storage.path
        }

        enum Download: PathItem {
            static let path: Path =
                Main.path / "download" / Parameters.FileId.path
            static let parameters: [Parameter.Type] = [
                Parameters.FileId.self
            ]
            static let get: Operation.Type? = Operations.Download.self
        }

        enum SimpleUpload: PathItem {
            static let path: Path = Main.path / "upload" / "simple"
            static let post: Operation.Type? = Operations.SimpleUpload.self
        }

        enum ChunkedUpload: PathItem {
            static let path: Path = Main.path / "upload" / "chunked"
            static let post: Operation.Type? = Operations.ChunkedUpload.self
            static let get: Operation.Type? = Operations.UploadList.self
        }

        enum Chunked: PathItem {
            static let path: Path =
                ChunkedUpload.path / Parameters.UploadId.path
            static let parameters: [Parameter.Type] = [
                Parameters.UploadId.self
            ]
            static let post: Operation.Type? = Operations.ChunkedFinish.self
            static let delete: Operation.Type? = Operations.ChunkedAbort.self
            static let get: Operation.Type? = Operations.ChunkList.self
        }

        enum ChunkedChunk: PathItem {
            static let path: Path =
                Chunked.path / "chunks"
                / Parameters.ChunkNumber.path
            static let parameters: [Parameter.Type] = [
                Parameters.UploadId.self,
                Parameters.ChunkNumber.self,
            ]
            static let post: Operation.Type? = Operations.ChunkedUploadChunk
                .self
            static let delete: Operation.Type? = Operations.ChunkedRemoveChunk
                .self
        }
    }
}
