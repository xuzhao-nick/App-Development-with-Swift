## Text


- [Text.playground](../code/Text.playground)

```
struct ContentView: View {
  var body: some View {
    Text("I’ve spent years collecting the good sentences here in a file that I reserve for only my best sentences. I give them to you hoping that they will inspire to write more beautiful sentences, inspire you to read more looking for these type of gems, and that they will make your life just a little bit more gorgeous.")
      .fontWeight(.bold)
      .font(.custom("Menlo Regular", size: 16))
      .foregroundColor(.primary)
      .minimumScaleFactor(0.5)
      .multilineTextAlignment(.center)
      .truncationMode(.middle)
      .padding()
      .background(Color.gray)
      .border(Color.black, width: 3)
  }
}
```