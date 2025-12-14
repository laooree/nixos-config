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

        # Audio
        "audio/mp3"          = "deadbeef.desktop";
        "audio/prs.sid"      = "deadbeef.desktop";
        "audio/x-flac"       = "deadbeef.desktop";
        "audio/mpeg"         = "deadbeef.desktop";
        "audio/x-mpeg"       = "deadbeef.desktop";
        "audio/x-mod"        = "deadbeef.desktop";
        "audio/x-it"         = "deadbeef.desktop";
        "audio/x-s3m"        = "deadbeef.desktop";
        "audio/x-xm"         = "deadbeef.desktop";
        "audio/x-mpegurl"    = "deadbeef.desktop";
        "audio/x-scpls"      = "deadbeef.desktop";
        "audio/x-vorbis+ogg" = "deadbeef.desktop";

        # Browser
        "text/html"                = "vivaldi-stable.desktop";
        "application/xhtml+xml"    = "vivaldi-stable.desktop";
        "x-scheme-handler/http"    = "vivaldi-stable.desktop";
        "x-scheme-handler/https"   = "vivaldi-stable.desktop";
        "x-scheme-handler/about"   = "vivaldi-stable.desktop";
        "x-scheme-handler/unknown" = "vivaldi-stable.desktop";

        # PDF
        "application/pdf"          = "firefox.desktop";

        # Telegram
        "x-scheme-handler/tg"      = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

        # Images
        "image/png"                = "org.gnome.Loupe.desktop";
        "image/gif"                = "org.gnome.Loupe.desktop";
        "image/webp"               = "org.gnome.Loupe.desktop";
        "image/tiff"               = "org.gnome.Loupe.desktop";
        "image/x-tga"              = "org.gnome.Loupe.desktop";
        "image/vnd-ms.dds"         = "org.gnome.Loupe.desktop";
        "image/x-dds"              = "org.gnome.Loupe.desktop";
        "image/bmp"                = "org.gnome.Loupe.desktop";
        "image/vnd.microsoft.icon" = "org.gnome.Loupe.desktop";
        "image/vnd.radiance"       = "org.gnome.Loupe.desktop";
        "image/x-exr"              = "org.gnome.Loupe.desktop";
        "image/x-portable-bitmap"  = "org.gnome.Loupe.desktop";
        "image/x-portable-graymap" = "org.gnome.Loupe.desktop";
        "image/x-portable-pixmap"  = "org.gnome.Loupe.desktop";
        "image/x-portable-anymap"  = "org.gnome.Loupe.desktop";
        "image/x-qoi"              = "org.gnome.Loupe.desktop";
        "image/qoi"                = "org.gnome.Loupe.desktop";
        "image/svg+xml"            = "org.gnome.Loupe.desktop";
        "image/svg+xml-compressed" = "org.gnome.Loupe.desktop";
        "image/avif"               = "org.gnome.Loupe.desktop";
        "image/heic"               = "org.gnome.Loupe.desktop";
        "image/jxl"                = "org.gnome.Loupe.desktop";
        "image/jpeg"               = "org.gnome.Loupe.desktop";
        "image/jpg"                = "org.gnome.Loupe.desktop";

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
