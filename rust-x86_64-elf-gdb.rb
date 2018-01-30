# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
 class RustX8664ElfGdb < Formula
  desc "A Rust-enabled GDB targeting x86_64 ELF binaries"
  homepage "https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git"
  url "https://github.com/hausdorff/binutils-gdb/archive/rust-x86_64-elf-gdb.tar.gz"
  sha256 "f5ab223e5d9b8d703dfccf3a1b038222a2a346e83f47a866526a25a7b64dee64"

   # depends_on "cmake" => :build
   def install
    # ENV.deparallelize  # if your formula fails when building in parallel
     # Remove unrecognized options if warned by configure
    system "./configure", "--target=x86_64-pc-linux-gnu",
                          "--prefix=#{prefix}",
                          "--with-python=yes",
                          "--enable-tui",
                          "--with-curses",
                          "--disable-nls",
                          "--disable-werror",
                          "--disable-gas",
                          "--disable-binutils",
                          "--disable-ld",
                          "--disable-gprof"
    system "make"
    system "make", "install"
    system "cp", "rust-x86_64-elf-gdb", "#{prefix}/bin/rust-x86_64-elf-gdb"
    system "chmod", "+x", "#{prefix}/bin/rust-x86_64-elf-gdb"
  end
   test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test binutils-gdb`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
