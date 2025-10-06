{
  config,
  pkgs,
  inputs,
  ...
}:

{

  xdg = {

    enable = true;

    mimeApps = {

      enable = true;

      defaultApplications = {
        # Browser
        "text/html"                = "brave-browser.desktop";
        "application/xhtml+xml"    = "brave-browser.desktop";
        "x-scheme-handler/http"    = "brave-browser.desktop";
        "x-scheme-handler/https"   = "brave-browser.desktop";
        "x-scheme-handler/about"   = "brave-browser.desktop";
        "x-scheme-handler/unknown" = "brave-browser.desktop";

        # PDF
        "application/pdf"          = "firefox.desktop";

        # Telegram
        "x-scheme-handler/tg"      = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

        # Images
        "image/png"                = "firefox.desktop";
        "image/jpeg"               = "firefox.desktop";
        "image/jpg"                = "firefox.desktop";
        "image/gif"                = "firefox.desktop";
        "image/webp"               = "firefox.desktop";
        "image/svg+xml"            = "firefox.desktop";

        # Videos
        "video/mp4"              = "vlc.desktop";
        "video/x-matroska"       = "vlc.desktop";
        "video/webm"             = "vlc.desktop";
        "video/x-msvideo"        = "vlc.desktop";
        "video/quicktime"        = "vlc.desktop";
      };

    };
  };

}
