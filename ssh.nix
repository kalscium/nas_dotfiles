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
      PermitRootLogin = "prohibit-password";
    };
  };

  # Basic SSH Protection
  services.fail2ban.enable = true;
}
