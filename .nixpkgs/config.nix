{
  packageOverrides = pkgs: with pkgs; rec {
    myEmacsPackages = epkgs: (with epkgs.melpaPackages; [
      haskell-mode
      ghc
      magit
      nix-mode
      solarized-theme
      pinentry
      evil
      exec-path-from-shell
      spaceline
      helm
      helm-projectile
      projectile
    ]) ++ (with epkgs.orgPackages; [
      org-plus-contrib
    ]) ++ (with pkgs; [
      mu
    ]);

    myEmacs = (emacsWithPackages
                (with emacsPackagesNgGen emacs; myEmacsPackages));

    myEnv = buildEnv {
      name = "myEnv";
      paths = [
        isync
          myEmacs
      ];
    };
  };
}

