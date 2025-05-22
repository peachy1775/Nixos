{pkgs, ...}: {
    
    home.packages = with pkgs; [
      screenfetch
      sl
      pipes
      cmatrix
      asciiquarium
      aalib
      nyancat
      bb
    ];
  
}