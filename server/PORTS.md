# Ports à ouvrir sur le Security Group AWS

## Obligatoires

| Port    | Protocole | Source          | Usage                        |
|---------|-----------|-----------------|------------------------------|
| 25565   | TCP       | 0.0.0.0/0       | Minecraft (client → serveur) |
| 24454   | UDP       | 0.0.0.0/0       | Simple Voice Chat            |
| 22      | TCP       | **TON IP/32**   | SSH admin (JAMAIS 0.0.0.0/0) |

## Optionnels (selon besoins)

| Port    | Protocole | Source          | Usage                        |
|---------|-----------|-----------------|------------------------------|
| 8080    | TCP       | 0.0.0.0/0       | Dashboard web (ServerEvents) |
| 25566   | TCP       | 127.0.0.1       | RCON (admin console local)   |

## Notes

- **Port custom Minecraft** : tu peux changer le 25565 dans `server.properties` pour
  un port random (ex: 45678) et l'ouvrir à la place. Ça évite les scans automatiques
  bots qui cherchent 25565. Tes potes utiliseront `ip:45678`.

- **Simple Voice Chat UDP** : souvent oublié, doit être ouvert sinon le voice ne
  marche pas. Et c'est bien UDP, pas TCP.

- **RCON** : garde-le en `127.0.0.1` (local only) + un tunnel SSH quand tu veux
  admin à distance. Jamais exposé publiquement.
