 #fastcgi_cache start
        set $no_cache 0;

        # POST requests and urls with a query string should always go to PHP
        if ($request_method = POST) {
                set $no_cache 1;
        }
        if ($query_string != "") {
                set $no_cache 1;
        }

        # Don't cache uris containing the following segments
        if ($request_uri ~* "(/wp-admin/|/xmlrpc.php|/wp-(app|cron|login|register|mail).php|wp-.*.php|/feed/|index.php|wp-comments-popup.php|wp-links-opml.php|wp-locations.php|sitemap(_index)?.xml|[a-z0-9_-]+-sitemap([0-9]+)?.xml)") {
                set $no_cache 1;
        }

        # Don't use the cache for logged in users or recent commenters
        if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+|wp-postpass|wordpress_no_cache|wordpress_logged_in") {
                set $no_cache 1;
        }

          location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf|woff|woff2)$ {
               access_log off; log_not_found off; expires max;
        }