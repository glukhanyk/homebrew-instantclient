# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn/mac/instantclient/10204/instantclient-basic-10.2.0.4.0-macosx-x64.zip"
  sha256 "ae0fc5b2148f58d4f3ed0f3d10fc2add50be33d1ac2f360fadb5be8eca28a4a7"

  conflicts_with "instantclient-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
