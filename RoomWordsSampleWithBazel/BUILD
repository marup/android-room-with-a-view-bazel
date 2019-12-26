load("@rules_android//android:rules.bzl", "android_binary", "android_library")

# https://stackoverflow.com/questions/56218583/how-to-use-room-database-in-android-with-bazel

java_plugin(
    name = "androidx_room_room_compiler_plugin",
    neverlink = True,
    #    processor_class = "androidx.room.RoomProcessor",
    deps = ["@maven//:androidx_room_room_compiler"],
)

java_library(
    name = "androidx_room_room_compiler_library",
    exported_plugins = [
        ":androidx_room_room_compiler_plugin",
    ],
    exports = [
        "@maven//:androidx_room_room_compiler",
    ],
)

android_library(
    name = "lib",
    srcs = glob(["*.java"]),
    custom_package = "ca.maruko.android.roomwordssample",
    javacopts = ["-Xlint"],
    manifest = "AndroidManifest.xml",
    resource_files = glob(
        ["res/**"],
        exclude = ["res/**/*~"],
    ),
    deps = [
        ":androidx_room_room_compiler_library",
        "@maven//:androidx_annotation_annotation",
        "@maven//:androidx_appcompat_appcompat",
        "@maven//:androidx_constraintlayout_constraintlayout",
        "@maven//:androidx_fragment_fragment",
        "@maven//:androidx_lifecycle_lifecycle_common_java8",
        "@maven//:androidx_lifecycle_lifecycle_extensions",
        "@maven//:androidx_lifecycle_lifecycle_livedata_core",
        "@maven//:androidx_lifecycle_lifecycle_viewmodel",
        "@maven//:androidx_preference_preference",
        "@maven//:androidx_recyclerview_recyclerview",
        "@maven//:androidx_room_room_common",
        "@maven//:androidx_room_room_runtime",
        "@maven//:androidx_sqlite_sqlite",
        "@maven//:com_google_android_material_material",
    ],
)

android_binary(
    name = "RoomWordsSampleWithBazel",
    custom_package = "ca.maruko.android.roomwordssample",
    dex_shards = 10,
    manifest = "AndroidManifest.xml",
    manifest_values = {"applicationId": "ca.maruko.android.roomwordssample"},
    multidex = "native",
    deps = [":lib"],
)
