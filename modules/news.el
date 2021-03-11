(use-package elfeed
  :ensure t
  :bind ("C-x w" . elfeed)
  :config
  (setq elfeed-feeds
        '("https://planet.emacslife.com/atom.xml"
          "https://wilhelmbot.com/feed.xml"
          "https://emacsair.me/feed.xml"
          "https://mikrotik.com/download.rss"
          "https://www.archlinux.org/feeds/news"
          "https://dashbit.co/feed"
          "https://feeds.fireside.fm/beamradio/rss"
          "https://thinkingelixir.com/feed/podcast/"
          "https://www.atomicaccess.co.za/feed")))
