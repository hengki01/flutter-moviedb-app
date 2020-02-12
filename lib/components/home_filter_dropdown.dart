import "package:flutter/material.dart";

class DropDownButton extends StatefulWidget {
  final Function setSortBy;
  DropDownButton({Key key, @required this.setSortBy}) : super(key: key);

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  
  DropdownButton _hintDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "popularity-asc",
        child: Text(
          "Populariy (Asc)",
        ),
      ),
      DropdownMenuItem<String>(
        value: "popularity-desc",
        child: Text(
          "Popularity (Desc)",
        ),
      ),
      DropdownMenuItem<String>(
        value: "votecount-asc",
        child: Text(
          "Vote Count (Asc)",
        ),
      ),
      DropdownMenuItem<String>(
        value: "votecount-desc",
        child: Text(
          "Vote Count (Desc)",
        ),
      ),
      DropdownMenuItem<String>(
        value: "releasedate-asc",
        child: Text(
          "Release Date (Asc)",
        ),
      ),
      DropdownMenuItem<String>(
        value: "releasedate-desc",
        child: Text(
          "Release Date (Desc)",
        ),
      ),
    ],
    onChanged: (value) {
      print("value: $value");
      widget.setSortBy(value);
    },
    hint: Text(
      "Sort Movies",
      style: TextStyle(
        color: Colors.black
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: _hintDown(),
    );  
  }
}