
library newplus_ffi;

import 'dart:ffi';
import 'dart:io' show Platform, Directory;

typedef PlusOneFunc = Int32 Function(Int32 x);
typedef PlusOne = int Function(int x);

typedef PlusOneScopedFunc = Int32 Function(Int32 x);
typedef PlusOneScoped = int Function(int x);

typedef CurrentTimestampFunc = Int32 Function();
typedef CurrentTimestamp = int Function();

class _PlusOneBindings {
  late DynamicLibrary libplusone;

  late PlusOne plusone;
  late PlusOneScoped plusone_scoped;
  late CurrentTimestamp current_timestamp;

  _PlusOneBindings() {
    libplusone = DynamicLibrary.open('libnewplus.so');

    plusone = libplusone.lookup<NativeFunction<PlusOneFunc>>("plusone").asFunction();
    plusone_scoped = libplusone.lookup<NativeFunction<PlusOneScopedFunc>>("plusone").asFunction();
    current_timestamp = libplusone.lookup<NativeFunction<CurrentTimestampFunc>>("current_timestamp").asFunction();
  }
}

_PlusOneBindings? _cachedBindings;
_PlusOneBindings get bindings => _cachedBindings ??= _PlusOneBindings();

// The simplest way to call native code: top-level functions.
int plusone(int x) native "PlusOne";
int plusone_scoped(int x) native "PlusOneScoped";

int current_timestamp() native "CurrentTimestamp";
