load("@rules_android//android:rules.bzl", "android_binary", "android_library")

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
        ":androidx_lifecycle_lifecycle_compiler_library",
        ":androidx_room_room_compiler_library",
        "@maven//:androidx_annotation_annotation",
        "@maven//:androidx_appcompat_appcompat",
        "@maven//:androidx_constraintlayout_constraintlayout",
        "@maven//:androidx_fragment_fragment",
        "@maven//:androidx_preference_preference",
        "@maven//:androidx_recyclerview_recyclerview",
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

java_plugin(
    name = "androidx_lifecycle_lifecycle_compiler_plugin",
    processor_class = "androidx.lifecycle.LifecycleProcessor",
    deps = [
        "@maven//:androidx_lifecycle_lifecycle_compiler",
    ],
)

java_library(
    name = "androidx_lifecycle_lifecycle_compiler_library",
    exported_plugins = [
        ":androidx_lifecycle_lifecycle_compiler_plugin",
    ],
    neverlink = True,
    exports = [
        "@maven//:androidx_lifecycle_lifecycle_extensions",
        "@maven//:androidx_lifecycle_lifecycle_compiler",
        "@maven//:androidx_lifecycle_lifecycle_viewmodel",
        "@maven//:androidx_lifecycle_lifecycle_livedata_core",
    ],
)

java_plugin(
    name = "androidx_room_room_compiler_plugin",
    processor_class = "androidx.room.RoomProcessor",
    deps = [
        "@maven//:androidx_room_room_compiler",
    ],
)

java_library(
    name = "androidx_room_room_compiler_library",
    exported_plugins = [
        ":androidx_room_room_compiler_plugin",
    ],
    neverlink = True,
    exports = [
        "@maven//:androidx_room_room_common",
        "@maven//:androidx_room_room_compiler",
        "@maven//:androidx_room_room_runtime",
    ],
)
