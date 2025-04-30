{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    mkOption
    types
    ;

  cfg = config.home.vimiumOptions;
in
{
  options.home.vimiumOptions = {
    enable = mkEnableOption "Generate a `vimium-options.json`.";

    outputFilePath = mkOption {
      type = types.str;
      default = ".cache/vimium-options.json";
      description = "The file path of the output json file.";
    };

    exclusionRules = mkOption {
      type = types.listOf types.attrs;
      default = [
        {
          passKeys = "";
          pattern = "https?://mail.google.com/*";
        }
      ];
      description = ''
        Disable Vimium on URLs.
        "Patterns" are URL regular expressions. * will match zero or more characters.
        "Keys": Vimium will exclude these keys and pass them through to the page.
      '';
    };

    keyMappings = mkOption {
      type = types.submodule {
        options = {
          map = mkOption {
            type = types.attrsOf types.str;
            default = { };
            example = {
              j = "scrollDown";
              k = "scrollUp";
            };
            description = ''
              Maps a key to a Vimium command. Overrides Chrome's default behavior (if any).

              See [Custom Key Mappings](https://github.com/philc/vimium#custom-key-mappings)
            '';
          };

          unmap = mkOption {
            type = types.listOf types.str;
            default = [ ];
            example = [
              "j"
              "k"
            ];
            description = ''
              Unmaps a key and restores Chrome's default behavior (if any).

              See [Custom Key Mappings](https://github.com/philc/vimium#custom-key-mappings)
            '';
          };

          mapKey = mkOption {
            type = types.attrsOf types.str;
            default = { };
            example = {
              "ض" = "q";
              "ص" = "w";
            };
            description = ''
              Maps a key as another key.

              See [Wiki](https://github.com/philc/vimium/wiki/Key-Mappings).
            '';
          };

          unmapAll = mkOption {
            type = types.bool;
            default = false;
            example = true;
            description = ''
              Unmaps all bindings. This is useful if you want to completely wipe Vimium's defaults and start from scratch with your own setup.

              See [Custom Key Mappings](https://github.com/philc/vimium#custom-key-mappings)
            '';
          };
        };
      };
      default = { };
      description = ''
        Enter commands to remap your keys.

        See [Custom Key Mappings](https://github.com/philc/vimium#custom-key-mappings) or [Wiki](https://github.com/philc/vimium/wiki/Key-Mappings).
      '';
    };

    searchEngines = mkOption {
      type = types.attrsOf types.str;
      default = {
        w = "https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia";
      };
      example = {
        np = "https://search.nixos.org/packages?type=packages&query=%s NixOS Search - Packages";
        nm = "https://mynixos.com/search?q=%s MyNixOS";
        g = "https://www.google.com/search?q=%s Google";
        l = "https://www.google.com/search?q=%s&btnI I'm feeling lucky...";
        y = "https://www.youtube.com/results?search_query=%s Youtube";
        gm = "https://www.google.com/maps?q=%s Google maps";
        b = "https://www.bing.com/search?q=%s Bing";
        d = "https://duckduckgo.com/?q=%s DuckDuckGo";
        az = "https://www.amazon.com/s/?field-keywords=%s";
        qw = "https://www.qwant.com/?q=%s Qwant";
      };
      description = ''
        Add search-engine shortcuts to the Vomnibar.
        %s is replaced with the search terms.

        See [Wiki](https://github.com/philc/vimium/wiki/Search-Completion).
      '';
    };

    scrollStepSize = mkOption {
      type = types.int;
      default = 60;
      description = ''
        Scroll step size (in px).

        The size for basic movements (usually j/k/h/l).
      '';
    };

    linkHintCharacters = mkOption {
      type = types.str;
      default = "sadfjklewcmpgh";
      description = ''
        Characters used for link hints.

        The characters placed next to each link after typing "f" to enter link-hint mode.
        Only used when `filterLinkHints` set to `false` (default).
      '';
    };

    linkHintNumbers = mkOption {
      type = types.str;
      default = "0123456789";
      description = ''
        Numbers used for link hints.

        The characters placed next to each link after typing "f" to enter link-hint mode.
        Only used when `filterLinkHints` set to `true`.
      '';
    };

    smoothScroll = mkOption {
      type = types.bool;
      default = true;
      description = "Use smooth scrolling.";
    };

    filterLinkHints = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Use the link's name and characters for link-hint filtering.

        In link-hint mode, this option lets you select a link by typing its text.
      '';
    };

    waitForEnterForFilteredHints = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Require Enter when filtering hints.

        You activate the link with Enter, always; so you never accidentally type Vimium commands. Only when `filterLinkHints` set to `true`.
      '';
    };

    grabBackFocus = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Don't let pages steal the focus on load.

        Prevent pages from focusing an input on load (e.g. Google, Bing, etc.).
      '';
    };

    hideHud = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Hide the Heads Up Display (HUD) in insert mode.

        When enabled, the HUD will not be displayed in insert mode.
      '';
    };

    regexFindMode = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Treat find queries as JavaScript regular expressions.

        Switch back to plain find mode by using the \R escape sequence.
      '';
    };

    ignoreKeyboardLayout = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Ignore keyboard layout.

        This forces the use of en-US QWERTY layout and can be helpful for non-Latin keyboards.
      '';
    };

    previousPatterns = mkOption {
      type = types.str;
      default = "prev,previous,back,<,‹,←,«,≪,<<";
      description = ''
        Previous patterns.

        The "navigate to previous page" command uses these patterns to find the link to follow.
      '';
    };

    nextPatterns = mkOption {
      type = types.str;
      default = "next,more,>,›,→,»,≫,>>";
      description = ''
        Next patterns.

        The "navigate to next page" command uses these patterns to find the link to follow.
      '';
    };

    newTabUrl = mkOption {
      type = types.str;
      default = "about:newtab";
      description = ''
        New tab URL.

        The page to open with the "create new tab" command. Set this to "pages/blank.html" for a blank page (except incognito mode).
      '';
    };

    userDefinedLinkHintCss = mkOption {
      type = types.lines;
      default = # css
        ''
          div > .vimiumHintMarker {
          /* linkhint boxes */
          background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FFF785),
            color-stop(100%,#FFC542));
          border: 1px solid #E3BE23;
          }

          div > .vimiumHintMarker span {
          /* linkhint text */
          color: black;
          font-weight: bold;
          font-size: 12px;
          }

          div > .vimiumHintMarker > .matchingCharacter {
          }
        '';
      description = ''
        CSS for Vimium UI.

        These styles are applied to link hints, the Vomnibar, the help dialog, the exclusions pop-up and the HUD.
        By default, this CSS is used to style the characters next to each link hint.

        These styles are used in addition to and take precedence over Vimium's default styles.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.file.${cfg.outputFilePath}.text = builtins.toJSON {
      settingsVersion = "2.2.1";

      inherit (cfg)
        exclusionRules
        scrollStepSize
        linkHintCharacters
        linkHintNumbers
        smoothScroll
        filterLinkHints
        waitForEnterForFilteredHints
        grabBackFocus
        hideHud
        regexFindMode
        ignoreKeyboardLayout
        previousPatterns
        nextPatterns
        newTabUrl
        userDefinedLinkHintCss
        ;

      keyMappings = builtins.concatStringsSep "\n" (
        (if cfg.keyMappings.unmapAll then [ "unmapAll" ] else [ ])
        ++ (lib.attrsets.mapAttrsToList (key: val: "mapKey ${key} ${val}") cfg.keyMappings.mapKey)
        ++ (builtins.map (val: "unmap ${val}") cfg.keyMappings.unmap)
        ++ (lib.attrsets.mapAttrsToList (key: val: "map ${key} ${val}") cfg.keyMappings.map)
      );

      searchEngines = lib.concatMapAttrsStringSep "\n" (key: val: "${key}: ${val}") cfg.searchEngines;

    };
  };
}
