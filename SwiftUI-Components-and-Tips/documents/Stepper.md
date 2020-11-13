## Stepper


- [Stepper sample code](../code/SliderAndStepper/)

-  SwiftUI’s Stepper control lets users select values from a range we specify, providing the same functionality as UIStepper from UIKit.

```
struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
        }
    }
}
```
Other sample:
```
      Stepper(
        onIncrement: {
          self.orderCount += 1
        },
        onDecrement: {
          self.orderCount -= 1
        }){
        Text("Set order amount")
      }
```

```
      Stepper("Set order amount", value: $orderCount)
```




<p>
<image src="images/stepper.png" width="500"></image>
</p>
