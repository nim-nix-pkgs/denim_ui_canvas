{
  description = ''HTML Canvas backend for the denim ui engine'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."denim_ui_canvas-master".dir   = "master";
  inputs."denim_ui_canvas-master".owner = "nim-nix-pkgs";
  inputs."denim_ui_canvas-master".ref   = "master";
  inputs."denim_ui_canvas-master".repo  = "denim_ui_canvas";
  inputs."denim_ui_canvas-master".type  = "github";
  inputs."denim_ui_canvas-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."denim_ui_canvas-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}