import 'package:flutter/material.dart';

class Gridviewextentscreen extends StatefulWidget {
  const Gridviewextentscreen({super.key});

  _GridviewextentscreenState createState() => _GridviewextentscreenState();
}

class _GridviewextentscreenState extends State<Gridviewextentscreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Extent'),
      ),
      body: Column(
        children: [
          // Slider
          /// A slider widget that allows the user to select a value between 1 and 10.
          ///
          /// The slider's value is determined by the `counter` variable, which is
          /// converted to a double for the slider. The slider has 8 divisions and
          /// displays the current value as a label. When the slider's value changes,
          /// the `counter` variable is updated and the state is refreshed.
          ///
          /// Properties:
          /// - `value`: The current value of the slider, derived from `counter`.
          /// - `min`: The minimum value of the slider, set to 1.
          /// - `max`: The maximum value of the slider, set to 10.
          /// - `divisions`: The number of discrete divisions, set to 8.
          /// - `label`: A string representation of the current value of `counter`.
          /// - `onChanged`: A callback function that updates the `counter` variable
          ///   and calls `setState` to refresh the widget.
          Slider(
            value: counter.toDouble(),
            min: 1,
            max: 10,
            divisions: 8,
            label: '$counter',
            onChanged: (double value) {
              setState(() {
                counter = value.toInt();
              });
            },
          ),

          /// A widget that expands to fill available space and displays a grid of items.
          ///
          /// The grid is created using `GridView.extent` with a maximum cross-axis extent
          /// of 200 pixels. The number of items in the grid is determined by the `counter`
          /// variable. Each item is represented by a centered `Card` widget with a blue
          /// background, containing a centered `Text` widget displaying the item's index.
          ///
          /// The `Card` widget has a fixed size of 100x100 pixels, and the text inside
          /// the card is styled with white color and a font size of 20.
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 200,
              children: List.generate(counter, (index) {
                return Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
