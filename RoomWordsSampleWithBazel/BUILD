load("@rules_android//android:rules.bzl", "android_binary", "android_library")
load("@rules_jvm_external//:defs.bzl", "artifact")

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
        artifact("androidx_appcompat:appcompat"),
        artifact("androidx_fragment:fragment"),
        artifact("androidx_lifecycle:lifecycle-extensions"),
        artifact("androidx_lifecycle:lifecycle-common-java8"),
        artifact("androidx_lifecycle:lifecycle-livedata-core"),
        artifact("androidx_lifecycle:lifecycle-viewmodel"),
        artifact("androidx_annotation:annotation"),
        artifact("androidx_preference:preference"),
        artifact("androidx_recyclerview:recyclerview"),
        artifact("androidx_room:room-runtime"),
        artifact("androidx_room:room-common"),
        #        artifact("androidx_room:room-compiler"),
        artifact("androidx_constraintlayout:constraintlayout"),
        artifact("com_google_android:material-material"),
        artifact("androidx_sqlite:sqlite"),
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
