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
        "text/html"                = "mullvad-browser.desktop";
        "application/xhtml+xml"    = "mullvad-browser.desktop";
        "x-scheme-handler/http"    = "mullvad-browser.desktop";
        "x-scheme-handler/https"   = "mullvad-browser.desktop";
        "x-scheme-handler/about"   = "mullvad-browser.desktop";
        "x-scheme-handler/unknown" = "mullvad-browser.desktop";

        # PDF
        "application/pdf"          = "org.gnome.Evince.desktop";

        # Telegram
        "x-scheme-handler/tg"      = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

        # Images
        "image/png"                = "org.gnome.Loupe.desktop";
        "image/jpeg"               = "org.gnome.Loupe.desktop";
        "image/jpg"                = "org.gnome.Loupe.desktop";
        "image/gif"                = "org.gnome.Loupe.desktop";
        "image/webp"               = "org.gnome.Loupe.desktop";
        "image/svg+xml"            = "org.gnome.Loupe.desktop";

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
