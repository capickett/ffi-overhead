const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("zig_hello", "hello.zig");
    exe.setBuildMode(mode);
    exe.setTarget(target);
    exe.addIncludeDir(".");
    exe.addLibPath("newplus");
    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("newplus");
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
