 /* MODELO EL CUAL MUESTRA EL ESTATUS DE LA TRANSACCION DE UN STREAM*/
enum Status { LOADING, SUCCESS, ERROR, IDLE }
  
class StreamResultObject<T> {
    Status valid=Status.IDLE;
    T data;
}