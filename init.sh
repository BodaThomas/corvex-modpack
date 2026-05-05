#!/usr/bin/env bash
# ------------------------------------------------------------------
# init.sh — initialisation complète du modpack "Corvex Friends"
# ------------------------------------------------------------------
# Prérequis :
#   - packwiz installé (go install github.com/packwiz/packwiz@latest)
#   - être dans un dossier vide (ou accepter d'écraser pack.toml)
# ------------------------------------------------------------------

set -e

PACK_NAME="Corvex Friends"
PACK_AUTHOR="bodathomas"
PACK_VERSION="0.1.0"
MC_VERSION="1.21.1"
LOADER="neoforge"

# ------------------------------------------------------------------
# 1. Init du pack
# ------------------------------------------------------------------
if [ ! -f "pack.toml" ]; then
  echo "Initialisation du pack..."
  packwiz init \
    --name "$PACK_NAME" \
    --author "$PACK_AUTHOR" \
    --version "$PACK_VERSION" \
    --mc-version "$MC_VERSION" \
    --modloader "$LOADER"
fi

# ------------------------------------------------------------------
# 2. Fonction utilitaire
# ------------------------------------------------------------------
add_mr() {
  # Ajoute un mod depuis Modrinth (source préférée : libre, pas de token)
  local slug=$1
  echo "  → [Modrinth] $slug"
  packwiz modrinth add "$slug" --yes || echo "    ⚠ échec $slug (à vérifier manuellement)"
}

add_cf() {
  # Ajoute un mod depuis CurseForge (fallback)
  local slug=$1
  echo "  → [CurseForge] $slug"
  packwiz curseforge add "$slug" --yes || echo "    ⚠ échec $slug (à vérifier manuellement)"
}

# ------------------------------------------------------------------
# 3. Mods — PERFORMANCE (obligatoires)
# ------------------------------------------------------------------
echo ""
echo "=== PERFORMANCE ==="
add_mr embeddium            # Sodium pour NeoForge
add_mr ferritecore          # Réduction RAM
add_mr canary               # Ex-Lithium pour NeoForge (optimisations serveur)
add_mr modernfix            # Patches perfs + memory leaks
add_mr c2me                 # Concurrent Chunk Management Engine

# ------------------------------------------------------------------
# 4. Mods — QUALITY OF LIFE
# ------------------------------------------------------------------
echo ""
echo "=== QUALITY OF LIFE ==="
add_mr jei                                      # Just Enough Items
add_mr jade                                     # Infobulles sur blocs/entités
add_mr xaeros-minimap                           # Minimap
add_mr xaeros-world-map                         # Carte monde
add_mr sophisticated-backpacks                  # Sacs à dos évolutifs
add_mr iron-chests                              # Coffres améliorés
add_mr appleskin                                # Stats nourriture
add_mr clumps                                   # Regroupement orbes XP
add_mr controlling                              # Meilleur écran des contrôles
add_mr mouse-tweaks                             # Interactions souris inventaire

# ------------------------------------------------------------------
# 5. Mods — AVENTURE / EXPLORATION (worldgen — installés dès J1)
# ------------------------------------------------------------------
echo ""
echo "=== AVENTURE / EXPLORATION ==="
add_mr alexs-mobs                               # ~90 mobs uniques
add_mr when-dungeons-arise                      # Grands donjons
add_mr yungs-better-dungeons                    # Refonte donjons vanilla
add_mr yungs-better-strongholds                 # Refonte strongholds
add_mr yungs-better-mineshafts                  # Refonte mines abandonnées
add_mr terralith                                # +85 biomes
add_mr explorers-compass                        # Boussole structures
add_mr natures-compass                          # Boussole biomes
add_mr yungs-api                                # Dépendance YUNG's

# ------------------------------------------------------------------
# 6. Mods — TECH
# ------------------------------------------------------------------
echo ""
echo "=== TECH ==="
add_mr create                                   # LE mod tech casual

# ------------------------------------------------------------------
# 7. Mods — SOCIAL SERVEUR
# ------------------------------------------------------------------
echo ""
echo "=== SOCIAL SERVEUR ==="
add_mr ftb-chunks                               # Claims de territoire
add_mr ftb-essentials                           # /home /back /tpa /rtp
add_mr ftb-library                              # Dépendance FTB
add_mr ftb-teams                                # Dépendance FTB
add_mr ftb-quests                               # Système de quêtes

# ------------------------------------------------------------------
# 8. Mods — IMMERSION / NARRATION (tirés de la liste "divertissement")
# ------------------------------------------------------------------
echo ""
echo "=== IMMERSION ==="
add_mr waystones                                # Pierres de téléportation
add_mr corail-tombstone                         # Tombes à la mort
add_mr farmers-delight                          # Cuisine + cultures
add_mr supplementaries                          # Déco / petits blocs utiles
add_mr simple-voice-chat                        # VoIP spatiale

# ------------------------------------------------------------------
# 9. Dépendances communes (si pas auto-résolues)
# ------------------------------------------------------------------
echo ""
echo "=== DEPS ==="
add_mr architectury-api                         # Requis par beaucoup de mods
add_mr balm                                     # Requis par Waystones
add_mr curios                                   # Slots d'équipement (Curios API)
add_mr puzzles-lib                              # Requis par certains mods

# ------------------------------------------------------------------
# 10. Refresh & récap
# ------------------------------------------------------------------
echo ""
echo "=== REFRESH ==="
packwiz refresh

echo ""
echo "✅ Modpack initialisé."
echo ""
echo "Prochaines étapes :"
echo "  1. Vérifier les slugs qui ont échoué (voir ⚠ ci-dessus)"
echo "  2. Lancer 'packwiz list' pour voir tous les mods"
echo "  3. Tester localement via Prism Launcher"
echo "  4. Exporter : 'packwiz modrinth export'"
