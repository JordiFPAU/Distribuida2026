job "book-store" {
  datacenters = ["dc1"]

  group "servers" {

    count = 2

    network {
      port "http" {}
    }

    task "app-customers" {
      #driver = "java"
      driver = "raw_exec"

      artifact {
        source      = "https://github.com/Byron45/Programacion-Distribuida/releases/download/VERSION_1.0.1/app-customers-0.0.1-SNAPSHOT.zip"
        destination = "local/"
        mode        = "any"
      }

      config {
        #jar_path = "C:/distribuida 2626/app-customers-0.0.1-SNAPSHOT.jar"
        #jar_path = "local/app-customers-0.0.1-SNAPSHOT.jar"
        #jvm_options = ["-Xmx1024m", "-Xms128m"]
        command = "/opt/java/jdk-25.0.3+9-jre/bin/java"
        args = [
          "-Xmx1024m",
          "-Xms128m",
          "-jar",
          "local/app-customers-0.0.1-SNAPSHOT.jar"
        ]
      }

      env {
        SERVER_PORT              = "${NOMAD_PORT_http}"
        SPRING_CLOUD_CONSUL_HOST = "192.168.224.20"
      }

      service {
        provider = "nomad"
        name     = "app-customers"
        port     = "http"
      }
    }
  }
}

