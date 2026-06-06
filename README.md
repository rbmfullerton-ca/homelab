# Terraform + K3S Homelab Adventures

Welcome to my journey into using **Terraform** to automate and manage my K3S-powered Kubernetes homelab! This project documents my experiments, learnings, and ongoing progress as I bring modern infrastructure-as-code tools into my personal environment.

## Table of Contents

- [About This Project](#about-this-project)
- [Homelab Hardware](#homelab-hardware)
- [Homelab Diagram](#homelab-diagram)

## About This Project

This repository contains my experiments with using **Terraform** to define, provision, and manage services in my (K3S) homelab cluster. My ultimate goal is to codify the configuration and setup process, making environments reproducible and easy to share or rebuild.

## Homelab Hardware
![Image of Homelab hardware](Homelab.jpeg)

## Homelab Diagram
```mermaid
flowchart TD
 subgraph PX1VMs["VMs on Node 1"]
        PX1VM["Docker VM<br>K3S Master 2<br>K3s Master 3<br>K3S Worker 2<br>K3S Longhorn 3<br>K3S Admin"]
        PX1DMZ["PX1DMZ"]
  end
 subgraph PX1DMZ["DMZ"]
        PX1VMDMZ["Game Server"]
  end
 subgraph PX2VMs["VMs on Node 2"]
        PX2VM["K3S Master 1<br>K3S Worker 1<br>K3S Longhorn 1<br>K3s Longhorn 2"]
        PX2DMZ["PX2DMZ"]
  end
 subgraph PX2DMZ["DMZ"]
        PX2VMDMZ["Plex (ARC A380)"]
  end
 subgraph K3SSers["K3S Services"]
        K3SPodList["Longhorn<br>Authenik<br>Rancher<br>Traefik<br>Metallb<br>Atlantis<br>Cert Manager"]
  end
 subgraph K3SCons["K3S Containers"]
        K3SSerList["Pi-Hole1<br>Pi-Hole2<br>UpTimeKuma<br>Servarr Suite<br>Pterodactyl<br>ComfyUI<br>Ollama<br>OpenWebUI"]
  end
 subgraph K3S["K3S Cluster"]
        K3SCons
        K3SSers
  end
 subgraph ProxmoxCluster["Proxmox Cluster"]
        PX1["Proxmox Node 1"]
        PX2["Proxmox Node 2"]
        PX1VMs
        PX2VMs
        K3S
        PXBKHA["Proxmox Backup VM (HA)<br>iSCSI 10G"]
  end
 subgraph TNMainVMs["Containers"]
        TNMainVM1["Pi-Hole3<br>UptimeKuma-NAS<br>Proxmox QDevice"]
  end
 subgraph TrueNAS["TrueNAS Hosts"]
        TNmain["TrueNAS Main - RAIDZ1"]
        TNMainVMs
        TNbackup["TrueNAS Backup - Striped"]
        TNZFSRep["Hourly ZFS Replication"]
  end
 subgraph Wireless["Wireless"]
        AP1["Access Point 1 - House"]
        AP2["Access Point 2 - Shed"]
  end
  style AP1 color:#000
  style AP2 color:#000

    ONT@{ label: "ONT (ISP)<span class=\"grow\"></span>" } --> FG["Fortigate"]
    FG -- "192.168.2.X/24 User LAN" --- Wireless
    PXBKHA -.- PX1 & PX2
    FG -- "192.168.0.X/24 Server LAN" --- ProxmoxCluster
    PX1VMs --> K3S
    PX2VMs --> K3S
    PX1 --> PX1VMs
    PX2 --> PX2VMs
    FG -- "192.168.0.X/24 Server LAN" --> TrueNAS
    TNmain --> TNMainVMs
    TNmain --- TNZFSRep
    TNbackup --- TNZFSRep
    ProxmoxCluster --- 10G["10.0.0.X/24 10G SFP+"]
    TrueNAS --- 10G
    FG -- "172.16.0.X/24 DMZ" --> ProxmoxCluster

  style FG color:#000
  style ONT color:#000
  style PXBKHA color:#000
  style PX1 color:#000
  style PX2 color:#000
  style 10G color:#000

    K3SPodList@{ shape: rect}
    PX1@{ shape: db}
    PX2@{ shape: db}
    TNmain@{ shape: disk}
    TNbackup@{ shape: disk}
    AP1@{ shape: rect}
    AP2@{ shape: rect}
    ONT@{ shape: rect}
     PX1:::server
     PX2:::server
     PXBKHA:::storage
     TNmain:::server
     TNbackup:::server
     TNZFSRep:::storage
     AP1:::server
     AP2:::server
     ONT:::server
     FG:::server
     10G:::storage
    classDef server fill:#e3f2fd,stroke:#2196f3,stroke-width:2px
    classDef storage fill:#f1f8e9,stroke:#689f38,stroke-width:2px
    style PX1VM stroke:#2962FF
    style PX1DMZ stroke:#D50000
    style PX2VM stroke:#2962FF
    style PX2DMZ fill:transparent,stroke:#D50000
    linkStyle 1 stroke:#BBDEFB,fill:none
    linkStyle 4 stroke:#2962FF,fill:none
    linkStyle 8 stroke:#FFFFFF,fill:none
    linkStyle 9 stroke:#2962FF,fill:none
    linkStyle 11 stroke:#689f38,fill:none
    linkStyle 12 stroke:#689f38,fill:none
    linkStyle 13 stroke:#689f38,fill:none
    linkStyle 14 stroke:#689f38,fill:none
    linkStyle 15 stroke:#D50000,fill:none

  style 10G color:#000
  style TNmain color:#000
  style TNbackup color:#000
  style TNZFSRep color:#000
```
