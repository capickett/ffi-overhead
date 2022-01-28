import newplus.*

fun run(count: Int) {
  var start = current_timestamp()
  var x = 0
  while (x < count) {
    x = plusone(x)
  }
  print("${current_timestamp() - start}\n")
}

fun main(args: Array<String>) {
  if (args.size == 0) {
    print("First arg (0 - 2000000000) is required.\n")
    return
  }

  var countOrNull = args[0].toIntOrNull()
  if (countOrNull == null) {
    print("Must be a positive number not exceeding 2 billion.\n")
  }
  var count = countOrNull!!
  if (count <= 0 || count > 2000000000) {
    print("Must be a positive number not exceeding 2 billion.\n")
  }

  plusone(if (current_timestamp() == 0L) 1 else 2)
  run(count)
}
