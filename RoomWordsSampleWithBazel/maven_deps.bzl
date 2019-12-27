load("@rules_jvm_external//:specs.bzl", "maven")

LIFECYCLE_VERSION = "2.2.0-rc03"
ROOM_VERSION = "2.2.3"

ROOM_WORDS_SAMPLE_MAVEN_ARTIFACTS = [
    "androidx.annotation:annotation:1.1.0",
    "androidx.appcompat:appcompat:1.1.0",
    "androidx.constraintlayout:constraintlayout:1.1.3",
    "androidx.fragment:fragment:1.2.0-rc04",
    "androidx.preference:preference:1.1.0",
    "androidx.recyclerview:recyclerview:1.1.0",
    "androidx.sqlite:sqlite:2.0.1",
    "com.google.android.material:material:1.0.0",

    "androidx.lifecycle:lifecycle-extensions:" + LIFECYCLE_VERSION,
    "androidx.lifecycle:lifecycle-livedata-core:" + LIFECYCLE_VERSION,
    "androidx.lifecycle:lifecycle-viewmodel:" + LIFECYCLE_VERSION,

    "androidx.room:room-runtime:" + ROOM_VERSION,
    "androidx.room:room-common:" + ROOM_VERSION,

    # Annotation processors.
		"androidx.lifecycle:lifecycle-compiler:" + LIFECYCLE_VERSION,
    "androidx.room:room-compiler:" + ROOM_VERSION,
		"com.google.guava:guava:28.1-android",
]
