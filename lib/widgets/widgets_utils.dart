import 'package:flutter/cupertino.dart';

void addIfNonNull(Widget child, List children){
  if(child != null){
    children.add(child);
  }
}