import Foundation
import ArgumentParser

struct OCRFileParser: ParsableCommand {
    
    static let configuration = CommandConfiguration(
            abstract: "A Swift command-line tool to read ocr file",
            subcommands: [])
  
  @Argument(help: "ocr file to parse")
  var file: String
  
  func run() throws {
    let contents = try String(contentsOfFile: file)
    let numbers = MultiLineSevenSegmentParser().numbers(from: contents)
    numbers.forEach { print($0.description) }
  }
}

OCRFileParser.main()
