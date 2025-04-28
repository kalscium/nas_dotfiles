# SSH configurations
{
  # Configure SSH
  services.openssh = {
    enable = true;

    # Open ports in the firewall
    ports = [ 22 ];
    openFirewall = true;

    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      PermitRootLogin = "yes";
    };
  };

  # Basic SSH Protection
  services.fail2ban.enable = false; # it's annoying, I'll turn it on if I need
}
