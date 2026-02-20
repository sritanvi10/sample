import 'package:flutter/material.dart';

class ControlWidget extends StatefulWidget {
  const ControlWidget({super.key});

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
  List<bool> isPressed = List.generate(50, (index) => false);
  List<bool> isAnswered = List.generate(50, (index) => false);
  int total=49, answered=0, review=0, temp=0, saveReview=0;
  @override
  void initState() {
    super.initState();
    isPressed[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle stylee = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      decoration: TextDecoration.none,
    );

    final elevatedstyle = ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(201, 201, 201, 1),
      foregroundColor: Colors.black,
      padding: EdgeInsets.all(12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(2),
      ),
      elevation: 3,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //not visited button
            ElevatedButton(
              style: elevatedstyle,
              onPressed: () {},
              child: Text('$total'),
            ),
            SizedBox(width: 5),
            Text('Not Visited', style: stylee),
            SizedBox(width: 10),

            //not answered button
            ElevatedButton(
              style: elevatedstyle,
              onPressed: () {},
              child: Text('${50 - total-answered-saveReview}'),
            ),
            SizedBox(width: 5),
            Text('Not Answered', style: stylee),
          ],
        ),

        SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //answered button
            ElevatedButton(
              style: elevatedstyle,
              onPressed: () {},
              child: Text('$answered'),
            ),
            SizedBox(width: 5),
            Text('Answered', style: stylee),
            SizedBox(width: 10),

            //mark for review
            ElevatedButton(
              style: elevatedstyle,
              onPressed: () {},
              child: Text('$review'),
            ),
            SizedBox(width: 5),
            Text('Mark for Review', style: stylee),
          ],
        ),

        SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: elevatedstyle,
              onPressed: () {},
              child: Text('$saveReview'),
            ),
            SizedBox(width: 10),
            Text(
              'Answered & Marked for Review\n(will be considered for evaluation)',
              style: stylee,
            ),
          ],
        ),
        SizedBox(height: 40),

        SizedBox(
          height: 300,
          width: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
            ),
            itemCount: 50,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(4),
              child: FloatingActionButton(
                onPressed: () {
                  temp=index;
                  if (isPressed[index] == false) {
                    isPressed[index] = true;
                    total--;
                  }
                  setState(() {});
                },
                foregroundColor: Colors.black,
                backgroundColor: isPressed[index] ? Colors.red : Colors.white,
                child: Text('${index + 1}', style: TextStyle()),
              ),
            ),
          ),
        ),
        

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  if(isAnswered[temp]==false){
                    isAnswered[temp]=true;
                    answered++;
                  }
                  setState(() {
                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 75, 209, 71),
                  foregroundColor: Colors.black,
                  shape: BeveledRectangleBorder(),
                ),
                child: Text('Save'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  review++;
                  temp++;
                  setState(() {
                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(201, 201, 201, 1),
                  foregroundColor: Colors.black,
                  shape: BeveledRectangleBorder(),
                ),
                child: Text('Mark for review'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  saveReview++;
                  temp++;
                  setState(() {
                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(201, 201, 201, 1),
                  foregroundColor: Colors.black,
                  shape: BeveledRectangleBorder(),
                ),
                child: Text('Save & mark for review'),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if(temp>0) temp--;
                  if(isPressed[temp]==false) total--;
                  isPressed[temp]=true;
                  setState(() {
                    
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
                iconAlignment: IconAlignment.start,
                style: elevatedstyle,
                label: Text('back'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if(isPressed[temp+1]==false) total--;
                  isPressed[temp + 1] = true;
                  temp++;
                  setState(() {});
                },
                icon: Icon(Icons.arrow_forward_ios),
                iconAlignment: IconAlignment.end,
                style: elevatedstyle,
                label: Text('next'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromRGBO(65, 201, 35, 1),
                ),
                child: Text('SUBMIT', textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
