## Toggle


- [Toggle sample code](../code/Toggle/)

- SwiftUI’s toggle lets users move between true and false states.

```
struct ContentView: View {
  var isActivatedMessage: String {
    return "CatNip is " + (isActivated ? "Activated!" : "Deactivated")
  }
  @State private var isActivated = false
    var body: some View {
      Toggle("Activate Cat Nip!", isOn: $isActivated)
      Text(isActivatedMessage)
    }
}
```
<p>
<image src="images/toggle.png" width="300"></image>
</p>


