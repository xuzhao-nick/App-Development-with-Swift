## Button


- [Button sample code](../code/Button/)

- Button with SF Symboles

```
Button(action: {
        
      }){
        VStack {
          Text("Give gift")
          //SFSymbole library
          Image(systemName: "gift")
            .font(Font.system(.largeTitle))
        }
```
<p>
<image src="images/button1.png" width="300"></image>
</p>
<p>
<image src="images/sfsymbols.png" width="300"></image>
</p>

- Other button sample

```
     let foodPrinter: () -> () = {
          print("The food was so good!")
     }
      Button(action: foodPrinter, label: {
        VStack {
          Image("Cat")
            .renderingMode(.original)
            //.renderingMode(.template)
            .resizable()
            .scaledToFit()
            .shadow(radius: 10)
            .padding()
          Text("Feed Cat!")
            .font(Font.system(.headline, design: .rounded))
            .foregroundColor(.primary)
            .padding([.leading,.trailing], 10)
            .padding([.top, .bottom], 5)
            .background(Color.purple)
            .cornerRadius(5)
            .shadow(color: Color.black, radius: 5)

        }

      })
```

<p>
<image src="images/button2.png" width="500"></image>
</p>
