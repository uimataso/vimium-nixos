{
  config,
  lib,
  ...
}:
let
  cfg = config.home.vimiumOptions;
  options = import ./options.nix { inherit lib; };
in
{
  inherit options;

  config = lib.mkIf cfg.enable {
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
