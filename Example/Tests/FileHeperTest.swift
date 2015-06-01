import Quick
import Nimble
import Sweet


private let fileName = "test.txt"

class FileHeperTest: QuickSpec {

  override func spec() {
    describe("File Helper") {

      it("documentDirectory should return path to Documents folder") {
        let documentDir = FileHelper.documentDirectory
        expect(documentDir.hasSuffix("Documents")).to(beTrue())
      }

      it("should return correct file paht") {
        let path = FileHelper.filePath(fileName)
        expect(path.hasSuffix(fileName)).to(beTrue())
        expect(path.hasSuffix("Documents/\(fileName)")).to(beTrue())
      }

      it("CachesDirectory should be in Library/Caches folder") {
        let path = FileHelper.filePath(fileName, directory: .CachesDirectory)
        expect(path.hasSuffix(fileName)).to(beTrue())
        expect(path.hasSuffix("Library/Caches/\(fileName)")).to(beTrue())
      }
    }
  }

  //  MARK: - Private
  private static func checkPathForFileName(path: String, fileName: String) {
  }
}



