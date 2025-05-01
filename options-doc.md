## _module\.args

Additional arguments passed to each module in addition to ones
like ` lib `, ` config `,
and ` pkgs `, ` modulesPath `\.

This option is also available to all submodules\. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules\. The sole exception to
this is the argument ` name ` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute\.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

 - ` lib `: The nixpkgs library\.

 - ` config `: The results of all options after merging the values from all modules together\.

 - ` options `: The options declared in all modules\.

 - ` specialArgs `: The ` specialArgs ` argument passed to ` evalModules `\.

 - All attributes of ` specialArgs `
   
   Whereas option values can generally depend on other option values
   thanks to laziness, this does not apply to ` imports `, which
   must be computed statically before anything else\.
   
   For this reason, callers of the module system can provide ` specialArgs `
   which are available during import resolution\.
   
   For NixOS, ` specialArgs ` includes
   ` modulesPath `, which allows you to import
   extra modules from the nixpkgs package tree without having to
   somehow make the module aware of the location of the
   ` nixpkgs ` or NixOS directories\.
   
   ```
   { modulesPath, ... }: {
     imports = [
       (modulesPath + "/profiles/minimal.nix")
     ];
   }
   ```

For NixOS, the default value for this option includes at least this argument:

 - ` pkgs `: The nixpkgs package set according to
   the ` nixpkgs.pkgs ` option\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [\<nixpkgs/lib/modules\.nix>](https://github.com/NixOS/nixpkgs/blob//lib/modules.nix)



## home\.vimiumOptions\.enable



Whether to enable Generate a ` vimium-options.json `…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.exclusionRules



Disable Vimium on URLs\.
“Patterns” are URL regular expressions\. \* will match zero or more characters\.
“Keys”: Vimium will exclude these keys and pass them through to the page\.



*Type:*
list of (attribute set)



*Default:*

```
[
  {
    passKeys = "";
    pattern = "https?://mail.google.com/*";
  }
]
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.filterLinkHints



Use the link’s name and characters for link-hint filtering\.

In link-hint mode, this option lets you select a link by typing its text\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.grabBackFocus



Don’t let pages steal the focus on load\.

Prevent pages from focusing an input on load (e\.g\. Google, Bing, etc\.)\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.hideHud



Hide the Heads Up Display (HUD) in insert mode\.

When enabled, the HUD will not be displayed in insert mode\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.ignoreKeyboardLayout



Ignore keyboard layout\.

This forces the use of en-US QWERTY layout and can be helpful for non-Latin keyboards\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.keyMappings



Enter commands to remap your keys\.

See [Custom Key Mappings](https://github\.com/philc/vimium\#custom-key-mappings) or [Wiki](https://github\.com/philc/vimium/wiki/Key-Mappings)\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.keyMappings\.map



Maps a key to a Vimium command\. Overrides Chrome’s default behavior (if any)\.

See [Custom Key Mappings](https://github\.com/philc/vimium\#custom-key-mappings)



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  j = "scrollDown";
  k = "scrollUp";
}
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.keyMappings\.mapKey



Maps a key as another key\.

See [Wiki](https://github\.com/philc/vimium/wiki/Key-Mappings)\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  "ص" = "w";
  "ض" = "q";
}
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.keyMappings\.unmap



Unmaps a key and restores Chrome’s default behavior (if any)\.

See [Custom Key Mappings](https://github\.com/philc/vimium\#custom-key-mappings)



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "j"
  "k"
]
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.keyMappings\.unmapAll



Unmaps all bindings\. This is useful if you want to completely wipe Vimium’s defaults and start from scratch with your own setup\.

See [Custom Key Mappings](https://github\.com/philc/vimium\#custom-key-mappings)



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.linkHintCharacters



Characters used for link hints\.

The characters placed next to each link after typing “f” to enter link-hint mode\.
Only used when ` filterLinkHints ` set to ` false ` (default)\.



*Type:*
string



*Default:*
` "sadfjklewcmpgh" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.linkHintNumbers



Numbers used for link hints\.

The characters placed next to each link after typing “f” to enter link-hint mode\.
Only used when ` filterLinkHints ` set to ` true `\.



*Type:*
string



*Default:*
` "0123456789" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.newTabUrl



New tab URL\.

The page to open with the “create new tab” command\. Set this to “pages/blank\.html” for a blank page (except incognito mode)\.



*Type:*
string



*Default:*
` "about:newtab" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.nextPatterns



Next patterns\.

The “navigate to next page” command uses these patterns to find the link to follow\.



*Type:*
string



*Default:*
` "next,more,>,›,→,»,≫,>>" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.outputFilePath



The file path of the output json file\.



*Type:*
string



*Default:*
` ".cache/vimium-options.json" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.previousPatterns



Previous patterns\.

The “navigate to previous page” command uses these patterns to find the link to follow\.



*Type:*
string



*Default:*
` "prev,previous,back,<,‹,←,«,≪,<<" `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.regexFindMode



Treat find queries as JavaScript regular expressions\.

Switch back to plain find mode by using the \\R escape sequence\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.scrollStepSize



Scroll step size (in px)\.

The size for basic movements (usually j/k/h/l)\.



*Type:*
signed integer



*Default:*
` 60 `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.searchEngines



Add search-engine shortcuts to the Vomnibar\.
%s is replaced with the search terms\.

See [Wiki](https://github\.com/philc/vimium/wiki/Search-Completion)\.



*Type:*
attribute set of string



*Default:*

```
{
  w = "https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia";
}
```



*Example:*

```
{
  az = "https://www.amazon.com/s/?field-keywords=%s";
  b = "https://www.bing.com/search?q=%s Bing";
  d = "https://duckduckgo.com/?q=%s DuckDuckGo";
  g = "https://www.google.com/search?q=%s Google";
  gm = "https://www.google.com/maps?q=%s Google maps";
  l = "https://www.google.com/search?q=%s&btnI I'm feeling lucky...";
  nm = "https://mynixos.com/search?q=%s MyNixOS";
  np = "https://search.nixos.org/packages?type=packages&query=%s NixOS Search - Packages";
  qw = "https://www.qwant.com/?q=%s Qwant";
  y = "https://www.youtube.com/results?search_query=%s Youtube";
}
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.smoothScroll



Use smooth scrolling\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.userDefinedLinkHintCss



CSS for Vimium UI\.

These styles are applied to link hints, the Vomnibar, the help dialog, the exclusions pop-up and the HUD\.
By default, this CSS is used to style the characters next to each link hint\.

These styles are used in addition to and take precedence over Vimium’s default styles\.



*Type:*
strings concatenated with “\\n”



*Default:*

```
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
''
```

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)



## home\.vimiumOptions\.waitForEnterForFilteredHints



Require Enter when filtering hints\.

You activate the link with Enter, always; so you never accidentally type Vimium commands\. Only when ` filterLinkHints ` set to ` true `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options\.nix](file:///nix/store/m5r7ikcmwivnjd2kxk7gvm2zja5pzpk0-source/options.nix)


