{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Asia/Colombo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  

  # Enable the Desktop Environment.
  
  # gnome
  # services.xserver.desktopManager.gnome.enable = true;
  
  # kde plasma
  # services.xserver.desktopManager.plasma6.enable = true;
  
  # icewm (enabling essentials might be essential)
  # services.xserver.windowManager.icewm.enable = true;
 

  # sway
  # programs.sway = {
  #enable = true;
  # wrapperFeatures.gtk = true;
  # };

  # Pantheon desktop (doesnt work with ly. might hv to use lightdm)
    services.xserver.desktopManager.pantheon.enable = true;
  
  # enlightment
  # services.xserver.desktopManager.enlightenment.enable = true;

 # ly display manager
  # services.displayManager.ly.enable = true;
 # LightDM
  services.xserver.displayManager.lightdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  #programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	
	brave
	localsend
	btop
	fastfetch
	
	# if using a window manager enable essentials
	# alacritty              # Terminal emulator
  	# xfce.thunar            # File manager 
 	# rofi                   # App launcher / window switcher
  	# dunst                  # Notification daemon
    # feh                    # Wallpaper setter & simple image viewer
  	# flameshot              # Screenshot tool 
	# pavucontrol            # Audio volume control 
  	# networkmanagerapplet   # Network tray icon
  	# xclip                  # Clipboard tool for X11
	
       ];
  

  # appimage support
  programs.appimage = {
  enable = true;
  binfmt = true;
  };
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # dns server
  services.resolved.enable = true;

   networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    };

  services.resolved.extraConfig = ''
   DNS=1.1.1.1 1.0.0.1
   FallbackDNS=2606:4700:4700::1111 2606:4700:4700::1001
     '';


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
