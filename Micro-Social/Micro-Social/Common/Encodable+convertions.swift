
import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var jsonString: String? {
        if let json = try? JSONEncoder().encode(self) {
            if let jsonString = String(data: json, encoding: .utf8) {
                return jsonString
            }
        }
        return nil
    }
}
