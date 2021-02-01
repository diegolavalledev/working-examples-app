import SwiftUI
import WorkingExamples

struct ExampleList: View {

  let examples: [ExampleModel]
  @Binding var selectedExample: ExampleModel?

  var body: some View {
    List {
      ForEach(examples) { example in
        NavigationLink(
          destination: ExampleDetail(example: example),
          tag: example,
          selection: $selectedExample,
          label: {
            VStack(alignment: .leading) {
              Text("\(example.title)")
              Text("\(example.subtitle)").font(.caption)
            }
          }
        )
      }
    }
  }
}

struct ExampleList_Previews: PreviewProvider {
  static var previews: some View {
    ExampleList(examples: [ExampleModel.sample], selectedExample: .constant(nil))
  }
}
