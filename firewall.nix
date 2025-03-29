{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8080 25565 ];
    allowedUDPPorts = [ 80 443 8080 25565 ];
  };
}
