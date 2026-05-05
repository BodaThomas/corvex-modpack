# Corvex Friends Modpack

Modpack custom NeoForge 1.21.1 pour notre serveur entre potes.
Géré avec [packwiz](https://packwiz.infra.link/).

## Philosophie

- **Casual-friendly** : pas de complexité excessive, courbe douce
- **Aventure + Tech léger + QoL** : Create, Alex's Mobs, Terralith, Dungeons Arise, etc.
- **Worldgen complète dès J1** : tous les mods qui touchent à la génération sont installés au lancement pour éviter les chunk borders moches plus tard
- **Déblocage progressif via ServerEvents** : certains contenus sont gatekeepés et se débloquent via quêtes FTB

## Stack

- Minecraft : **1.21.1**
- Loader : **NeoForge 21.1.x**
- Java : **21** (Temurin ou Corretto recommandé)

## Structure

```
modpack/
├── pack.toml              # Manifest racine
├── index.toml             # Index des fichiers
├── mods/                  # 1 fichier .pw.toml par mod
├── config/                # Configs serveur pré-tweakées
├── resourcepacks/         # Optionnel
└── shaderpacks/           # Optionnel
```

## Utilisation (dev — toi)

```bash
# Installer packwiz
go install github.com/packwiz/packwiz@latest

# Ajouter un mod depuis Modrinth
packwiz modrinth add <slug>

# Ajouter depuis CurseForge
packwiz curseforge add <slug>

# Mettre à jour tous les mods
packwiz update --all

# Refresh l'index après modifs manuelles
packwiz refresh

# Exporter pour distribution
packwiz modrinth export        # .mrpack pour Prism / Modrinth App
packwiz curseforge export      # .zip CurseForge
```

## Installation côté client (tes potes)

### Option A : Prism Launcher (recommandé)

1. Installer [Prism Launcher](https://prismlauncher.org/)
2. Add Instance → Import → `.mrpack` fourni
3. Lancer, se connecter au serveur

### Option B : packwiz-installer-bootstrap

1. Télécharger [packwiz-installer-bootstrap.jar](https://github.com/packwiz/packwiz-installer-bootstrap/releases)
2. Dans Prism : Edit Instance → Settings → Custom Commands → Pre-launch :
   ```
   $INST_JAVA -jar packwiz-installer-bootstrap.jar <URL_DU_PACK.TOML>
   ```
3. Le pack se met à jour automatiquement à chaque lancement

## Installation côté serveur (AWS)

Voir `server/README.md` (à venir).

## Mods

Liste complète : voir `mods/` ou générer avec `packwiz list`.

## Versioning

Ce repo est versionné. Chaque saison = une branche + tag.

- `saison-1` : configuration initiale
- `saison-2` : ajout des mods déco/QoL (Chipped, Furniture, Apotheosis…)
- `saison-3` : ajout endgame (Cataclysm, Steam 'n' Rails)
