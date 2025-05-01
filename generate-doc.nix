{
  lib,
  runCommand,
  nixosOptionsDoc,
  ...
}:
let
  options = lib.evalModules {
    modules = [
      ./options.nix
    ];
  };
  optionsDoc = nixosOptionsDoc {
    inherit options;
  };
in
runCommand "options-doc.md" { } ''
  cat ${optionsDoc.optionsCommonMark} >> $out
''
