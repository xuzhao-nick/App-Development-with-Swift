## Multiple Preview(Group)


```
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .environment(\.colorScheme, .dark)
      ContentView()
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
       
    }
  }
}
```