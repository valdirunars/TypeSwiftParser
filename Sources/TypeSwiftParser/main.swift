import Foundation
import TypeSwift

let args = [String](CommandLine.arguments[1..<CommandLine.arguments.count])
if args.count >= 2 {
    let inputPath = args[0]
    let outputPath = args[1]

    if let url = URL(string: inputPath) {

        if let outputURL = URL(string: outputPath) {
            print("attempting to write to outputURL")
            do {

                try TypeSwift.shared.convert(file: url, to: .swift, output: outputURL)
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
            }
        } else {
            print("Failed to init outputURL")
        }
    } else {
        print("Failed to init inputURL")
    }
} else {
    print("too few arguments: must be:\n\ntypeswiftparser \"inputPath\" \"outputPath\"\n")
}


