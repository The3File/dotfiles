# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()
#
c.colors.statusbar.url.fg = '#181715'
c.colors.statusbar.url.error.fg = '#181715'
c.colors.statusbar.url.hover.fg = '#181715'
c.colors.statusbar.url.warn.fg = '#181715'
c.colors.statusbar.url.success.http.fg = '#181715'
c.colors.statusbar.url.success.https.fg = '#181715'

c.colors.statusbar.normal.bg = '#c2811b'
c.colors.statusbar.normal.bg = '#c2811b'
c.colors.statusbar.normal.fg = '#181715'
c.colors.tabs.bar.bg = 'black'
c.colors.tabs.odd.bg = 'black'
c.colors.tabs.even.bg = 'black'
c.colors.tabs.selected.odd.bg = '#c2811b'
c.colors.tabs.selected.odd.bg = '#c2811b'
c.colors.tabs.selected.even.bg = '#c2811b'
c.colors.tabs.selected.even.bg = '#c2811b'
c.colors.tabs.selected.odd.fg = '#181715'
c.colors.tabs.selected.even.fg = '#181715'

c.colors.tabs.indicator.start = '#c2811b'
c.colors.tabs.indicator.start = '#c2811b'
c.colors.tabs.indicator.stop = '#c2811b'
c.colors.tabs.indicator.stop = '#c2811b'
#c.colors.tabs.indicator.error = '#c2811b'
#c.colors.tabs.indicator.error = '#c2811b'
#c.colors.tabs.indicator.system = '#c2811b'
#c.colors.tabs.indicator.system = '#c2811b'

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
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = ['style.css']

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 2000

# Hide the statusbar unless a message is shown.
# Type: Bool
c.statusbar.hide = True

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
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

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 0}

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'bottom'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Duration (in milliseconds) to show the tab bar before hiding it when
# tabs.show is set to 'switching'.
# Type: Int
c.tabs.show_switching_delay = 2000


# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = 'SF Mono'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '9pt monospace'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '9pt monospace'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '9pt monospace'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '9pt monospace'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '9pt monospace'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '9pt monospace'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '9pt monospace'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '9pt monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '9pt monospace'

# Default font size (in pixels) for regular text.
# Type: Int
c.fonts.web.size.default = 15

# Default font size (in pixels) for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 12

# Bindings for normal mode
config.bind(',n', 'config-cycle content.user_stylesheets style.css "" ')
config.bind('tg', 'tab-give')
