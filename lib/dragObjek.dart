import 'package:flutter/material.dart';

class DragObjek extends StatefulWidget {

  final Color warna;
  final Offset position;
  final String dataNama;

  DragObjek({this.warna,this.position,this.dataNama});

  @override
  _DragObjekState createState() => _DragObjekState();
}

class _DragObjekState extends State<DragObjek> {

  Offset pos;
  @override
  void initState() {
    // TODO: implement initState
    pos=widget.position;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: pos.dy,
      left: pos.dx,
      child: Draggable(
        child: Container(
          color: widget.warna,
          width: 120,
          height: 120,
        ),
        data: widget.dataNama,
        feedback: Opacity(opacity: 0.8, child: Container(color: widget.warna, width: 120,height: 120,),),
        onDraggableCanceled: (view,offset){
          setState(() {
           pos=offset; 
          });
        },
      ),

    );
  }
}