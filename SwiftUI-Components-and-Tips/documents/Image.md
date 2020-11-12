## Image


- [Image](../code/Image/)

<image src="images/aspect.png" width="500"></image>

- .scaledToFill() is as same as .aspectRatio(contentMode: .fill)
- .scaledToFit() is as same as .aspectRatio(contentMode: .fit)

```
Image("Holmes")
          .resizable()
          //.resizable(capInsets: EdgeInsets(), resizingMode: .tile)
          .scaledToFill()
          .saturation(0.7)
          .contrast(100)
          .hueRotation(Angle(degrees: 300))
          .edgesIgnoringSafeArea([.top,.bottom])
          //.resizable()
          //.aspectRatio(contentMode: .fit)
          //.aspectRatio(contentMode: .fill)
          //aspectRatio(16/9, contentMode: .fit)
          //.scaledToFill()
          //.scaledToFit()
          //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          //.mask(Image("mascot").resizable())
          //.padding([.leading, .trailing])
```
