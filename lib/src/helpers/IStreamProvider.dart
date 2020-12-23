


abstract class IStreamProvider<T>{ 

   // Function(T) get servicesSink;

   // Stream<T> get servicesStream;

    Stream<T> getStream();
    void addSink(T data);
 
    void dispose();
}