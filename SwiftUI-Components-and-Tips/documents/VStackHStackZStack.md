## VStack, HStack and ZStack


- Using stacks in SwiftUI allows you to arrange multiple views into a single coherent view with certain properties. 
- VStack allows to arrange its child views in a vertical line.
- HStack allows to arrange its child views in a horizontal line. 
- ZStack allows to overlap its child views on top of each other. 
- Stacks can further be customized with alignment and spacing in order to modify their appearance.

### VStack 

#### [VStack sample](../code/VStack/)

```
struct ContentView: View {
    var body: some View {
      VStack {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}
```

<p>
<image src="images/vstack.png" width="200"></image>
</p>

#### VStack leading alignment

```
struct ContentView: View {
    var body: some View {
      VStack(alignment: .leading) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}
```
<p>
<image src="images/vstack1.png" width="200"></image>
</p>


#### VStack center alignment
```
struct ContentView: View {
    var body: some View {
      VStack(alignment: .center) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}
```
<p>
<image src="images/vstack2.png" width="200"></image>
</p>


#### VStack trailing alignment
```
struct ContentView: View {
    var body: some View {
      VStack(alignment: .trailing) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}

```
<p>
<image src="images/vstack3.png" width="200"></image>
</p>


#### [VStack with background color sample](../code/VStackWithBackgroundColor/)

```

struct ContentView: View {
    var body: some View {
      VStack(alignment: .center, spacing: 20) {
        Text("RegEX for Cats")
          .font(Font.system(.largeTitle,design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .shadow(color:.gray, radius: 5, x: 5, y: 5)
          .padding([.leading, .trailing])
        Image("CatOnKeyboard")
          .resizable()
          .scaledToFit()
          .padding()
        
      }.background(Color.catPurple)
    }
}
```


<p>
<image src="images/vstack5.png" width="200"></image>
</p>

### HStack

#### [HStack sample](../code/HStack/)

```
struct ContentView: View {
    var body: some View {
      HStack {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}

```

<p>
<image src="images/hstack1.png" width="200"></image>
</p>


#### HStack top alignment

```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.top) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}

```

<p>
<image src="images/hstack2.png" width="200"></image>
</p>

#### HStack center alignment

```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.center) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}

```
<p>
<image src="images/hstack3.png" width="200"></image>
</p>



#### HStack bottom alignment
```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.bottom) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}

```

<p>
<image src="images/hstack4.png" width="200"></image>
</p>


#### HStack text center alignment
```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.center) {
        Text("My favourite Pet\n is a ").lineLimit(2)
        Text("Dog").font(Font.system(size: 50, weight: .heavy))
      }
    }
}
```
<p>
<image src="images/hstack5.png" width="200"></image>
</p>

#### HStack first text baseline alignment

```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.firstTextBaseline) {
        Text("My favourite Pet\n is a ").lineLimit(2)
        Text("Dog").font(Font.system(size: 50, weight: .heavy))
      }
    }
}

```
<p>
<image src="images/hstack6.png" width="200"></image>
</p>

<p>
<image src="images/hstack7.png" width="200"></image>
</p>

#### HStack last text baseline alignment

```
struct ContentView: View {
    var body: some View {
      HStack(alignment:.lastTextBaseline) {
        Text("My favourite Pet\n is a ").lineLimit(2)
        Text("Dog").font(Font.system(size: 50, weight: .heavy))
      }
    }
}

```
<p>
<image src="images/hstack8.png" width="200"></image>
</p>

<p>
<image src="images/hstack9.png" width="200"></image>
</p>

#### VStack and HStack with spacing
```
struct ContentView: View {
    var body: some View {
      VStack(spacing:30) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}
```
<p>
<image src="images/vstack4.png" width="200"></image>
</p>
<p>

```
struct ContentView: View {
    var body: some View {
      HStack(spacing:30) {
        Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
        Text("Hello, this is a sample")
      }
    }
}


```
<p>
<image src="images/hstack.png" width="200"></image>
</p>

### ZStack

#### [ZStack sample](../code/ZStackSample/)

```
struct ContentView: View {
  var body: some View {
    ZStack {
      Image("image1")
      Text("Hello, world").font(Font.system(size: 50, weight: .heavy))
    }
  }
}
```

<p>
<image src="images/zstack1.png" width="200"></image>
</p>

#### [ZStack set background color sample](../code/ZStack/)

```
      ZStack {
        //Following line also can help to set whole screen to green
        //Color.rayWenderlichGreen
        VStack {
          Image("Cat")
            .resizable()
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .blendMode(.hardLight)
          Text("😻 Meow! 😻")
            .font(Font.system(.largeTitle, design: .monospaced))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 10, x: 10, y: 10)
            .rotationEffect(.degrees(-10))
          
        }
        Spacer()
          .layoutPriority(1)
      }
      .background(Color.rayWenderlichGreen)
        .edgesIgnoringSafeArea(.all)

```
<p>
<image src="images/zstack.png" width="200"></image>
</p>

#### [Combined HStack and VStack sample](../code/CombineStacksSample/)
```
      VStack(alignment: .leading) {
        Text("Sign Up your Cat for Regex for Cats!")
          .font(Font.system(.headline, design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .shadow(color: .gray, radius: 5, x: 5, y: 0.05)
          .padding([.top, .bottom])
        HStack {
          Image("CatOnKeyboard")
            .resizable()
            .frame(width: 50, height: 50)
          Button(action: {
            print("Signed up")
          }) {
            HStack {
              Text("Sign Up Today!")
              Image(systemName: "checkmark.circle")
            }
          }
          .padding()
          .background(Color.catPurple)
          .foregroundColor(.white)
          .shadow(radius: 5)
        }
      }
```
<p>
<image src="images/combinedstack.png" width="200"></image>
</p>

#### [Combined ZStack and VStack sample](../code/CombinedStacksSample1/)
```
      ZStack {
        
        Circle()
          .fill(Color.catPurple)
          .frame(width: 170, height: 170)
          .padding()
          .shadow(radius:10)
        
        VStack {
          Image("CatOnKeyboard")
            .resizable()
            .frame(width: 150, height: 150)
          Text("RegEx for Cats")
            .font(Font.system(.largeTitle, design: .rounded))
            .padding()
            .background(Color.red)
            .cornerRadius(15)
        }
        Spacer()
          .layoutPriority(1)
      }
      .background(Color.rayWenderlichGreen)
      .edgesIgnoringSafeArea(.all)
```
<p>
<image src="images/combinedstack1.png" width="200"></image>
</p>

