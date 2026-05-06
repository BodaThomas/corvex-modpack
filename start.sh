#!/usr/bin/env bash
# ------------------------------------------------------------------
# start.sh — lancement du serveur Minecraft
# ------------------------------------------------------------------
# Flags JVM : Aikar's flags, optimisés pour serveurs Minecraft moddés.
# Cible : t4g.medium (4 Go RAM) → alloue 6 Go à la JVM (marge pour l'OS).
# ------------------------------------------------------------------

# Mémoire (ajuster selon instance)
MIN_MEM="6G"
MAX_MEM="6G"

# Java 21 requis pour NeoForge 1.21.x
JAVA_BIN="java"

# Flags Aikar optimisés pour G1GC + gros heap Minecraft
JVM_FLAGS=(
  "-Xms${MIN_MEM}"
  "-Xmx${MAX_MEM}"
  "-XX:+UseG1GC"
  "-XX:+ParallelRefProcEnabled"
  "-XX:MaxGCPauseMillis=200"
  "-XX:+UnlockExperimentalVMOptions"
  "-XX:+DisableExplicitGC"
  "-XX:+AlwaysPreTouch"
  "-XX:G1NewSizePercent=30"
  "-XX:G1MaxNewSizePercent=40"
  "-XX:G1HeapRegionSize=8M"
  "-XX:G1ReservePercent=20"
  "-XX:G1HeapWastePercent=5"
  "-XX:G1MixedGCCountTarget=4"
  "-XX:InitiatingHeapOccupancyPercent=15"
  "-XX:G1MixedGCLiveThresholdPercent=90"
  "-XX:G1RSetUpdatingPauseTimePercent=5"
  "-XX:SurvivorRatio=32"
  "-XX:+PerfDisableSharedMem"
  "-XX:MaxTenuringThreshold=1"
  "-Dusing.aikars.flags=https://mcflags.emc.gs"
  "-Daikars.new.flags=true"
  "-Dfile.encoding=UTF-8"
)

# Lancement : NeoForge doit être installé au préalable via son installer
# Il génère un 'run.sh' ou un fichier 'args.txt' à inclure.

exec "$JAVA_BIN" "${JVM_FLAGS[@]}" @user_jvm_args.txt @libraries/net/neoforged/neoforge/*/unix_args.txt nogui "$@"
