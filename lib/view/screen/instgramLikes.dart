import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:instaapp/view/widget/followWidget.dart';
import 'package:instaapp/view/widget/youWidget.dart';
class Instgramlikes extends StatefulWidget {
  const Instgramlikes({super.key});

  @override
  State<Instgramlikes> createState() => _InstgramlikesState();
}

class _InstgramlikesState extends State<Instgramlikes> {
  int _selectedSegment=2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                child: CustomSlidingSegmentedControl<int>(

                  dividerSettings: DividerSettings(thickness: 1.0),
                  isStretch: true,
                  initialValue: 1,
                  children: {
                    1:Text("Following"),
                    2:Text("You")
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _selectedSegment=value;
                    });
                  },
                ),
              ),
              Expanded(child: _buildSegmentContent())
            ],
          ),
        

      ),
    );
  }
  Widget _buildSegmentContent(){
    switch(_selectedSegment)
        {
          case 1:
            return Followwidget();
          case 2:
            return Youwidget();
            default:
              return Container();
        }
  }
}
