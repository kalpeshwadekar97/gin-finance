import 'package:flutter/material.dart';

class StateProgressBar extends StatefulWidget {
  final int _count;
  final int _activeCount;

  StateProgressBar(this._count, this._activeCount);

  @override
  _StateProgressBarState createState() => _StateProgressBarState();
}

class _StateProgressBarState extends State<StateProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget._count,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Row(
                children: <Widget>[
                  _getState(++index),
                  index < widget._count ? _getLine() : Container()
                ],
              ),
            );
          }),
    );
  }

  _getState(int content) {
    return Center(
        child: Container(
      width: 50.0,
      height: 50.0,
      child: PhysicalModel(
        borderRadius: new BorderRadius.circular(25.0),
        color: content <= widget._activeCount ? Colors.green : Colors.white,
        child: Container(
          child: Center(
            child: Text(
              "$content",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.black),
            ),
          ),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(
              width: 2.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ));
  }

  _getLine() {
    return Container(
      width: 35.0,
      height: 5.0,
      color: Colors.black,
    );
  }
}
