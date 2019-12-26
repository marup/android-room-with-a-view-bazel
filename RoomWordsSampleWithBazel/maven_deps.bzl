load("@rules_jvm_external//:specs.bzl", "maven")

ROOM_WORDS_SAMPLE_MAVEN_ARTIFACTS = [
    "androidx.annotation:annotation:1.1.0",
    "androidx.appcompat:appcompat:1.1.0",
    "androidx.fragment:fragment:1.2.0-rc04",
    "androidx.lifecycle:lifecycle-extensions:2.2.0-rc03",
    "androidx.lifecycle:lifecycle-common-java8:2.2.0-rc03",
    "androidx.lifecycle:lifecycle-livedata-core:2.2.0-rc03",
    "androidx.lifecycle:lifecycle-viewmodel:2.2.0-rc03",
    "androidx.preference:preference:1.1.0",
    "androidx.recyclerview:recyclerview:1.1.0",
    "androidx.room:room-runtime:2.2.3",
    "androidx.room:room-common:2.2.3",
    "androidx.room:room-compiler:2.2.3",
    maven.artifact("com.google.auto", "auto-common", "0.10", neverlink = True),
    "androidx.constraintlayout:constraintlayout:1.1.3",
    "com.google.android.material:material:1.0.0",
    "androidx.sqlite:sqlite:2.0.1",
]
