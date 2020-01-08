RoomWordsSampleWithBazel
========================

This repository contains a copy of Android's RoomWordsSample
code and resources adapted to use with bazel.

See [The original github
repo](https://github.com/googlecodelabs/android-room-with-a-view) and
the [Architecture Components
codelab](https://codelabs.developers.google.com/codelabs/android-room-with-a-view/index.html?index=..%2F..%2Findex#0).

Build
-----
```
$ bazel build //RoomWordsSampleWithBazel:all
```

Build succeeds, but gives the following warning:
```
$ bazel build //RoomWordsSampleWithBazel:all
WARNING: API level 29 specified by android_ndk_repository 'androidndk' is not available. Using latest known API level 28
INFO: Analyzed 6 targets (1 packages loaded, 75 targets configured).
INFO: Found 6 targets...
INFO: From Building RoomWordsSampleWithBazel/liblib.jar (8 source files) and running annotation processors (LifecycleProcessor, RoomProcessor):
warning: No processor claimed any of these annotations: androidx.room.Query,androidx.annotation.NonNull,androidx.room.Insert,androidx.room.ColumnInfo,androidx.room.PrimaryKey,androidx.room.Dao,androidx.room.Database,androidx.room.Entity
INFO: From Building RoomWordsSampleWithBazel/liblib.jar (8 source files) and running annotation processors (LifecycleProcessor, RoomProcessor):
warning: No processor claimed any of these annotations: androidx.room.Query,androidx.annotation.NonNull,androidx.room.Insert,androidx.room.ColumnInfo,androidx.room.PrimaryKey,androidx.room.Dao,androidx.room.Database,androidx.room.Entity
INFO: Elapsed time: 8.348s, Critical Path: 8.03s
INFO: 22 processes: 17 linux-sandbox, 5 worker.
INFO: Build completed successfully, 23 total actions
``` 

Installing and running the app results in `AndroidRuntime` exception:

```
12-30 18:32:53.390 13167 13167 E AndroidRuntime: Caused by: java.lang.ClassNotFoundException: Didn't find class "androidx.room.RoomDatabase" on path: DexPathList[[dex file "/data/local/tmp/incrementaldeployment/ca.maruko.android.roomwordssample/dex/incremental_classes3.dex", dex file "/data/local/tmp/incrementaldeployment/ca.maruko.android.roomwordssample/dex/incremental_classes8.dex", dex file 
...
"/data/local/tmp/incrementaldeployment/ca.maruko.android.roomwordssample/dex/incremental_classes7.dex"],nativeLibraryDirectories=[/data/user/0/ca.maruko.android.roomwordssample/lib, /system/lib64, /system/product/lib64]]
12-30 18:32:53.390 13167 13167 E AndroidRuntime:        at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:196)
12-30 18:32:53.390 13167 13167 E AndroidRuntime:        at com.google.devtools.build.android.incrementaldeployment.IncrementalClassLoader$DelegateClassLoader.findClass(IncrementalClassLoader.java:57)
12-30 18:32:53.390 13167 13167 E AndroidRuntime:        at java.lang.ClassLoader.loadClass(ClassLoader.java:379)
12-30 18:32:53.390 13167 13167 E AndroidRuntime:        at java.lang.ClassLoader.loadClass(ClassLoader.java:312)
12-30 18:32:53.390 13167 13167 E AndroidRuntime:        ... 35 more
```

Deploy
------
```
$ bazel mobile-install //RoomWordsSampleWithBazel

```

Or:

```
$ adb install -r bazel-bin/RoomWordsSampleWithBazel/RoomWordsSampleWithBazel.apk
```

License
-------

Copyright 2019 Marjan Parsa

All image and audio files (including *.png, *.jpg, *.svg, *.mp3, *.wav
and *.ogg) are licensed under the CC BY 4.0 license. All other files are
licensed under the Apache 2 license.

Licensed to the Apache Software Foundation (ASF) under one or more contributor
license agreements.  See the LICENSE file distributed with this work for
additional information regarding copyright ownership.  The ASF licenses this
file to you under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License.  You may obtain a copy of
the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
License for the specific language governing permissions and limitations under
the License.
