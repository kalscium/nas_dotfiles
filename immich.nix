{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  networking.firewall.allowedTCPPorts = [ 2283 ];

  systemd.services.init-immich-network = {
    description = "Create the Docker network bridge for Immich.";
    after = [ "docker.service" ];
    requires = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      check=$(${pkgs.docker}/bin/docker network ls | grep "immich-net" || true)
      if [ -z "$check" ]; then
        ${pkgs.docker}/bin/docker network create immich-net
      else
        echo "immich-net already exists"
      fi
    '';
  };

  systemd.services."docker-immich"      = { after = [ "init-immich-network.service" ]; requires = [ "init-immich-network.service" ]; };
  systemd.services."docker-redis"       = { after = [ "init-immich-network.service" ]; requires = [ "init-immich-network.service" ]; };
  systemd.services."docker-postgres14"  = { after = [ "init-immich-network.service" ]; requires = [ "init-immich-network.service" ]; };

  virtualisation.oci-containers.containers = {
    immich = {
      autoStart = true;
      image = "ghcr.io/imagegenius/immich:latest";
      volumes = [
        "/cloud/Misc/immich/config:/config"
        "/cloud/Misc/immich/photos:/photos"
        "/nas:/nas:ro"
      ];
      ports = [ "2283:8080" ];
      environment = {
        PUID = "1002";
        PGID = "1000";
        TZ = "Australia/Melbourne";
        DB_HOSTNAME = "postgres14";
        DB_USERNAME = "postgres";
        DB_PASSWORD = "postgres";
        DB_DATABASE_NAME = "immich";
        REDIS_HOSTNAME = "redis";
        IMMICH_MACHINE_LEARNING_ENABLED = "false";
      };
      extraOptions = [ "--network=immich-net" ];
    };

    redis = {
      autoStart = true;
      image = "redis:alpine";
      extraOptions = [ "--network=immich-net" ];
    };

    postgres14 = {
      autoStart = true;
      image = "tensorchord/pgvecto-rs:pg14-v0.2.0";
      volumes = [ "pgdata:/var/lib/postgresql/data" ];
      environment = {
        POSTGRES_USER = "postgres";
        POSTGRES_PASSWORD = "postgres";
        POSTGRES_DB = "immich";
      };
      extraOptions = [ "--network=immich-net" ];
    };
  };
}
