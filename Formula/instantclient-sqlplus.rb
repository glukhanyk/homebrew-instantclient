# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQLPlus x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/10204/instantclient-sqlplus-10.2.0.4.0-macosx-x64.zip"
  sha256 "80eeaef1527de120ba7a06fb03aa25b8f993c6e71109a250eee6d21ce00296a0"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "sqlplus"
    end
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
    if MacOS.version == :catalina
      bin.env_script_all_files(libexec, "DYLD_LIBRARY_PATH" => HOMEBREW_PREFIX/"lib")
    end
  end
end
