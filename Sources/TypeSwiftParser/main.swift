import Foundation
import TypeSwift

let fileManager = FileManager.`default`
let path = fileManager.currentDirectoryPath
let url = URL(fileURLWithPath: path)

let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: url.path)!

while let element = enumerator.nextObject() as? String {
    guard element.hasSuffix(".ts") else { continue }
    do {
        let fileURL = url.appendingPathComponent(element)

        let outputURL = url.appendingPathComponent(element.replacingOccurrences(of: ".ts",
                                                                                with: ".swift"))

        try TypeSwift.shared.convert(file: fileURL, to: .swift, output: outputURL)

    } catch {
        if let err = error as? TypeScriptError {
            print("PARSING ERROR: \(err.localizedDescription)")
        } else {
            print("UNKNOWN ERROR: \n\(error.localizedDescription)")
        }
    }
}


