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
