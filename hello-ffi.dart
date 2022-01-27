import './dart/newplus_ffi.dart';

void run(int count) {
  // start
  var start = bindings.current_timestamp();
  
  int x = 0;
  while (x < count) {
    x = bindings.plusone(x);
  }
  
  print(bindings.current_timestamp() - start);
}

void run_scoped(int count) {
  // start
  var start = bindings.current_timestamp();
  
  int x = 0;
  while (x < count) {
    x = bindings.plusone_scoped(x);
  }
  
  print(bindings.current_timestamp() - start);
}

void main(List<String> args) {
  if (args.length == 0) {
      print("First arg (0 - 2000000000) is required.");
      return;
  }
  
  var count = int.parse(args[0]);
  if (count <= 0 || count > 2000000000) {
    print("Must be a positive number not exceeding 2 billion.");
    return;
  }
  
  if (args.length == 2 && args[1] == 'scoped') {
      bindings.plusone_scoped(bindings.current_timestamp() == 0 ? 1 : 2);
      run_scoped(count);
  } else {
      bindings.plusone(bindings.current_timestamp() == 0 ? 1 : 2);
      run(count);
  }
}
