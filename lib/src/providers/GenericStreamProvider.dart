

import 'dart:async';

import 'package:probusaca/src/helpers/IStreamProvider.dart';
import 'package:probusaca/src/helpers/http_request.dart';
import 'package:probusaca/src/model/ResultObject.dart'; 

class GenericStreamProvider<T,J extends IResultObject> extends HttpRequest<J> implements IStreamProvider<T>{
    final streaming = StreamController<T>.broadcast(); 
    void dispose(){ 
        streaming?.close();
    }

    void requestData(){}

    @override
    void addSink(T event) {
       streaming.sink.add(event);
    }

    @override
    Stream<T> getStream()=>streaming.stream;
  
}
