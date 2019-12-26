RoomWordsSampleWithBazel
========================

This repository contains a copy of Android's RoomWordsSample
code and resources adapted to use with bazel.

See [The original github
repo](https://github.com/googlecodelabs/android-room-with-a-view) and
the [Architecture Components
codelab](https://codelabs.developers.google.com/codelabs/android-room-with-a-view/index.html?index=..%2F..%2Findex#0).

TL;DR
=====
Compiles successfully with a small change to dependencies, but dies with a `RuntimeException`. Adding the dependency to address the
`RuntimeException` fails on `desugaring`.


Building the code
=================
To build the code, run bazel from the main directory:

`bazel build :all`

The code currently compiles using bazel version 2.0.0, but running the app results in a `RuntimeException`.
Current recommendations on Room libraries to include are:

```
 implementation "androidx.room:room-runtime:$rootProject.roomVersion"
 annotationProcessor "androidx.room:room-compiler:$rootProject.roomVersion"
```

Bazel requires `androidx.room:room-common be added, as per:

```
$ bazel build :all
WARNING: API level 29 specified by android_ndk_repository 'androidndk' is not available. Using latest known API level 28
INFO: Analyzed 2 targets (36 packages loaded, 6995 targets configured).
INFO: Found 2 targets...
ERROR: /home/marup/android/android-room-with-a-view-bazel/RoomWordsSampleWithBazel/BUILD:4:1: Building RoomWordsSampleWithBazel/liblib.jar (8 source files) failed (Exit 1)
RoomWordsSampleWithBazel/Word.java:35: error: [strict] Using type androidx.room.Entity from an indirect dependency (TOOL_INFO: "@maven//:androidx_room_room_common"). See command below **
@Entity(tableName = "word_table")
 ^
 ** Please add the following dependencies: 
  @maven//:androidx_room_room_common to //RoomWordsSampleWithBazel:lib 
 ** You can use the following buildozer command: 
buildozer 'add deps @maven//:androidx_room_room_common' //RoomWordsSampleWithBazel:lib 

INFO: Elapsed time: 26.570s, Critical Path: 0.84s
INFO: 2 processes: 2 worker.
FAILED: Build did NOT complete successfully
```
 
Adding the room-compiler annotation processor isn't necessary for a successful compilation and results in:

```
INFO: Analyzed 2 targets (4 packages loaded, 355 targets configured).
INFO: Found 2 targets...
ERROR: /home/marup/.cache/bazel/_bazel_marup/2924f60b8f176635fcc6993a19d2fd08/external/maven/BUILD:980:1: Desugaring external/maven/v1/https/jcenter.bintray.com/com/google/aut\
o/auto-common/0.10/stamped_auto-common-0.10.jar for Android failed (Exit 1)
Couldn't desugar invokedynamic for com/google/auto/common/GeneratedAnnotationSpecs.apply using java/lang/invoke/LambdaMetafactory.metafactory(Ljava/lang/invoke/MethodHandles\
$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; \
(6) with arguments [(Ljava/lang/Object;)Ljava/lang/Object;, com/squareup/javapoet/AnnotationSpec$Builder.build()Lcom/squareup/javapoet/AnnotationSpec; (5), (Lcom/squareup/ja\
vapoet/AnnotationSpec$Builder;)Lcom/squareup/javapoet/AnnotationSpec;]
INFO: Elapsed time: 62.845s, Critical Path: 11.44s
INFO: 189 processes: 134 linux-sandbox, 55 worker.
FAILED: Build did NOT complete successfully
```

Tried using `neverlink = True` to specify that the `javapoet` library should only be available at compile-time, to see if the de-sugaring
errors would resolve, but it didn't help:

```
maven.artifact(group = "com.squareup", artifact = "javapoet", version = "1.11.0", neverlink = True)
```

The error doesn't show a version on the `javapoet` library, so tried using the possible `1.11.1` with no difference.

Here's the output from `logcat` with the `RuntimeException`:

```
12-25 14:14:37.090 24030 24030 D AndroidRuntime: Shutting down VM
12-25 14:14:37.092 24030 24030 E AndroidRuntime: FATAL EXCEPTION: main
12-25 14:14:37.092 24030 24030 E AndroidRuntime: Process: ca.maruko.android.roomwordssample, PID: 24030
12-25 14:14:37.092 24030 24030 E AndroidRuntime: java.lang.RuntimeException: Unable to start activity ComponentInfo{ca.maruko.android.roomwordssample/ca.maruko.android.roomwordssample.MainActivity}: java.lang.RuntimeException: Cannot create an instance of class ca.maruko.android.roomwordssample.WordViewModel
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3270)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:3409)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.servertransaction.LaunchActivityItem.execute(LaunchActivityItem.java:83)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2016)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.os.Handler.dispatchMessage(Handler.java:107)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.os.Looper.loop(Looper.java:214)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.ActivityThread.main(ActivityThread.java:7356)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at java.lang.reflect.Method.invoke(Native Method)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:930)
12-25 14:14:37.092 24030 24030 E AndroidRuntime: Caused by: java.lang.RuntimeException: Cannot create an instance of class ca.maruko.android.roomwordssample.WordViewModel
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.lifecycle.ViewModelProvider$AndroidViewModelFactory.create(ViewModelProvider.java:275)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.lifecycle.SavedStateViewModelFactory.create(SavedStateViewModelFactory.java:106)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.lifecycle.ViewModelProvider.get(ViewModelProvider.java:185)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.lifecycle.ViewModelProvider.get(ViewModelProvider.java:150)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at ca.maruko.android.roomwordssample.MainActivity.onCreate(MainActivity.java:54)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.Activity.performCreate(Activity.java:7825)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.Activity.performCreate(Activity.java:7814)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.Instrumentation.callActivityOnCreate(Instrumentation.java:1306)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3245)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        ... 11 more
12-25 14:14:37.092 24030 24030 E AndroidRuntime: Caused by: java.lang.reflect.InvocationTargetException
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at java.lang.reflect.Constructor.newInstance0(Native Method)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at java.lang.reflect.Constructor.newInstance(Constructor.java:343)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.lifecycle.ViewModelProvider$AndroidViewModelFactory.create(ViewModelProvider.java:267)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        ... 19 more
12-25 14:14:37.092 24030 24030 E AndroidRuntime: Caused by: java.lang.RuntimeException: cannot find implementation for ca.maruko.android.roomwordssample.WordRoomDatabase. WordRoomDatabase_Impl does not exist
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.room.Room.getGeneratedImplementation(Room.java:94)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at androidx.room.RoomDatabase$Builder.build(RoomDatabase.java:952)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at ca.maruko.android.roomwordssample.WordRoomDatabase.getDatabase(WordRoomDatabase.java:53)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at ca.maruko.android.roomwordssample.WordRepository.<init>(WordRepository.java:39)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        at ca.maruko.android.roomwordssample.WordViewModel.<init>(WordViewModel.java:41)
12-25 14:14:37.092 24030 24030 E AndroidRuntime:        ... 22 more
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
