## DatePicker


- [DatePicker sample code](../code/DatePicker/)

- DatePicker enables you to input (by selection) date and time values.
- You can select different display style and different format

```
struct ContentView: View {
  @State private var pickedDate = Date()
  var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
  }
    var body: some View {
      VStack {
        Spacer().padding(50)
        Text("Date pickers")
        DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
          Text("Select Date")
        }
        DatePicker("", selection: $pickedDate, displayedComponents: [.date])
            .datePickerStyle(WheelDatePickerStyle())
        DatePicker("Enter your birthday", selection: $pickedDate)
            .datePickerStyle(GraphicalDatePickerStyle())
            .frame(maxHeight: 400)
        DatePicker
        Text("\(dateFormatter.string(from: pickedDate))")
      }
    }
}      
```
<p>
<image src="images/datepicker.png" width="300"></image>
</p>

- Date picker with closed range

```
DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 900000))), displayedComponents:.date) {
  Text("Select date")
}.datePickerStyle(GraphicalDatePickerStyle())
```

<p>
<image src="images/datepicker1.png" width="300"></image>
</p>


