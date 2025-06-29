class SpotifyAdSilencer < Formula
  desc "Cross-platform Spotify ad silencer - completely FREE!"
  homepage "https://github.com/JacobOmateq/spotify-ad-silencer"
  url "https://github.com/JacobOmateq/spotify-ad-silencer/releases/download/v1.0.6/SpotifyAdSilencer-darwin-portable.zip"
  sha256 "6543069a7186e2b8a113bd773d2c23a6dc43f7881b7b5a14f824487946a09a54"
  version "1.0.6"
  license "MIT"

  def install
    # Extract the portable app contents
    prefix.install Dir["*"]
    
    # Create a wrapper script for the executable
    (bin/"spotify-ad-silencer").write <<~EOS
      #!/bin/bash
      cd "#{prefix}" && exec "./SpotifyAdSilencer" "$@"
    EOS
    
    # Make the wrapper executable
    chmod 0755, bin/"spotify-ad-silencer"
  end

  def caveats
    <<~EOS
      🎵 Spotify Ad Silencer has been installed!
      
      To start the application:
        spotify-ad-silencer
        
      Important notes:
      • This tool requires the Spotify desktop application (not web player)
      • You may need to grant accessibility permissions on macOS
      • The app will run in the background and automatically detect ads
      
      For support and updates, visit:
      https://github.com/JacobOmateq/spotify-ad-silencer
      
      If this saves you from annoying ads, consider:
      • Starring the GitHub repository ⭐
      • Supporting the developer (see DONATIONS.txt in #{prefix})
    EOS
  end

  test do
    # Basic test to ensure the executable exists and runs
    assert_predicate bin/"spotify-ad-silencer", :exist?
    assert_predicate bin/"spotify-ad-silencer", :executable?
  end
end
