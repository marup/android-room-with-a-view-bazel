load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

########################################################################
# BEGIN ANDROD SETUP
RULES_ANDROID_VERSION = "0.1.1"

http_archive(
    name = "rules_android",
    sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
    strip_prefix = "rules_android-%s" % RULES_ANDROID_VERSION,
    urls = ["https://github.com/bazelbuild/rules_android/archive/v%s.zip" % RULES_ANDROID_VERSION],
)

load("@rules_android//android:rules.bzl", "android_ndk_repository", "android_sdk_repository")

# Configure Android SDK Path
android_sdk_repository(
    name = "androidsdk",
    # Path to Android SDK, optional if $ANDROID_HOME is set.
    # path = "/Users/codelab/Library/Android/sdk",
)

android_ndk_repository(
    name = "androidndk",
)

# See https://github.com/bazelbuild/rules_jvm_external/tree/master/examples
# for more info. Using this for maven_install.
RULES_JVM_EXTERNAL_TAG = "3.0"

RULES_JVM_EXTERNAL_SHA = "62133c125bf4109dfd9d2af64830208356ce4ef8b165a6ef15bbff7460b35c3a"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("//RoomWordsSampleWithBazel:maven_deps.bzl", "ROOM_WORDS_SAMPLE_MAVEN_ARTIFACTS")

maven_install(
    artifacts = ROOM_WORDS_SAMPLE_MAVEN_ARTIFACTS,
    generate_compat_repositories = True,
    repositories = [
        "https://jcenter.bintray.com",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    strict_visibility = True,
)

load("@maven//:compat.bzl", "compat_repositories")

compat_repositories()
