import FeatherOpenAPIKit

extension File.Storage {

  enum PathItems {

    enum Main: PathItem {
      static let path: Path = File.Storage.path
    }

    enum Download: PathItem {
      static let path: Path = Main.path / "download" / Parameters.Id.path
      static let parameters: [Parameter.Type] = [
        Parameters.Id.self
      ]
      static let get: Operation.Type? = Operations.Download.self
    }

    enum SimpleUpload: PathItem {
      static let path: Path = Main.path / "upload"
      static let post: Operation.Type? = Operations.SimpleUpload.self
    }

    enum ChunkedUpload: PathItem {
      static let path: Path = SimpleUpload.path / "chunk"
      static let post: Operation.Type? = Operations.ChunkedUpload.self
    }

    enum Chunked: PathItem {
      static let path: Path = ChunkedUpload.path / Parameters.Id.path
      static let parameters: [Parameter.Type] = [
        Parameters.Id.self
      ]
      static let post: Operation.Type? = Operations.ChunkedFinish.self
      static let delete: Operation.Type? = Operations.ChunkedAbort.self
    }

    enum ChunkedChunk: PathItem {
      static let path: Path =
        Chunked.path / "chunks"
        / Parameters.ChunkNumber.path
      static let parameters: [Parameter.Type] = [
        Parameters.Id.self,
        Parameters.ChunkNumber.self,
      ]
      static let post: Operation.Type? = Operations.ChunkedUploadChunk
        .self
      static let delete: Operation.Type? = Operations.ChunkedRemoveChunk
        .self
    }
  }
}
