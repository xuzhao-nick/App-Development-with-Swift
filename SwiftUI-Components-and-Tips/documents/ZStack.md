## ZStack


-  ZStack helps to make views on the top of each other. It is used where the overlapping content is required.

- Sample: [ZStack set background color](../code/ZStack/)

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
<image src="images/zstack.png" width="300"></image>
</p>

