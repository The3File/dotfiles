#          _   _
#         | | | |
#     __ _| |_| |__  _ ____      _____ _ __
#    / _` | __| '_ \| '__\ \ /\ / / __| '__|
#   | (_| | |_| |_) | |   \ V  V /\__ \ |
#    \__, |\__|_.__/|_|    \_/\_/ |___/_|
#       | |
#       |_|
#
# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}

# Backend to use to display websites. qutebrowser supports two different
# web rendering engines / backends, QtWebKit and QtWebEngine. QtWebKit
# was discontinued by the Qt project with Qt 5.6, but picked up as a
# well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry than
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium).
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari).
c.backend = 'webengine'

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'qute://*/*')

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = []

# Hide the statusbar unless a message is shown.
c.statusbar.hide = False

# Padding (in pixels) for the statusbar.
c.statusbar.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}

# Position of the status bar.
c.statusbar.position = 'bottom'

# List of widgets displayed in the statusbar.
# Type: List of String
# Valid values:
#   - url: Current page URL.
#   - scroll: Percentage of the current page position like `10%`.
#   - scroll_raw: Raw percentage of the current page position like `10`.
#   - history: Display an arrow when possible to go back/forward in history.
#   - tabs: Current active tab, e.g. `2`.
#   - keypress: Display pressed keys when composing a vi command.
#   - progress: Progress bar for the current page loading.
c.statusbar.widgets = ['keypress', 'progress', 'url']

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'bottom'

# When to show the tab bar.
c.tabs.show = 'multiple'

# Duration (in milliseconds) to show the tab bar before hiding it when
# tabs.show is set to 'switching'.
c.tabs.show_switching_delay = 2000

# COLORS

c.colors.completion.odd.bg = 'black'
c.colors.completion.even.bg = 'black'

c.colors.completion.category.bg = 'black'
c.colors.completion.category.border.top = 'white'
c.colors.completion.category.border.bottom = 'white'

c.colors.tabs.odd.bg = 'black'
c.colors.tabs.even.bg = 'black'

c.colors.tabs.selected.odd.fg = '#000000'
c.colors.tabs.selected.odd.bg = '#aba800'

c.colors.tabs.selected.even.fg = '#000000'
c.colors.tabs.selected.even.bg = '#aba800'

# Background color for webpages if unset (or empty to use the theme's color).
c.colors.webpage.bg = 'white'

# Whenever "monospace" is used in a font,
# it's replaced with the fonts listed here.
c.fonts.monospace = 'inconsolata'

# Bindings for normal mode
config.bind('tg', 'tab-give')
