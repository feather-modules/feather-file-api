import FeatherOpenAPIKit
import OpenAPIKit

extension File.Chunk {

    enum RequestBodies {

        enum Upload: BinaryBody {
            static let contentType: OpenAPI.ContentType = .any
            static let description = "Upload request body"
        }
    }
}
