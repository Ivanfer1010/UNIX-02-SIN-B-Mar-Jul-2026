#!/usr/bin/env bash

# ==============================================================================
# Evaluador de Repositorio Local - blackhatbash (v3)
# Criterios flexibles: 
# 1. Horario de Commits (Clase UNIX: Lun/Mie 07:00-09:00 UTC-5)
# 2. Calidad de código: Conceptos de Cap 1 y 2 (Flexibles, max 40 pts)
# 3. Comentarios: Densidad general sin validación de idioma (max 30 pts)
# ==============================================================================

if [ ! -d ".git" ]; then
    echo "Error: Este script debe ejecutarse en la carpeta raíz de tu repositorio de Git."
    exit 1
fi

SCORE=0

echo -e "==========================================="
echo -e "   Evaluando Repositorio Local (Modo Flexible)"
echo -e "===========================================\n"

for cmd in git grep awk; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: Dependencia '$cmd' no instalada."
        exit 1
    fi
done

# ---------------------------------------------------------
# 1. Evaluación de Horario de Commits (Máximo 30 puntos)
# ---------------------------------------------------------
echo "[*] Evaluando historial de commits locales en zona horaria UTC-5..."

TIMESTAMPS=$(git log --format='%at' 2>/dev/null)

if [ -z "$TIMESTAMPS" ]; then
    echo "    [!] No se encontraron commits en el historial local."
    TIME_SCORE=0
else
    TOTAL_COMMITS=0
    VALID_COMMITS=0

    for ts in $TIMESTAMPS; do
        TOTAL_COMMITS=$((TOTAL_COMMITS + 1))
        
        DAY_OF_WEEK=$(LC_ALL=C TZ="America/Guayaquil" date -d "@$ts" +%A)
        HOUR=$(LC_ALL=C TZ="America/Guayaquil" date -d "@$ts" +%H)
        
        if [[ "$DAY_OF_WEEK" == "Monday" || "$DAY_OF_WEEK" == "Wednesday" ]]; then
            if [[ 10#$HOUR -eq 7 || 10#$HOUR -eq 8 ]]; then
                VALID_COMMITS=$((VALID_COMMITS + 1))
            fi
        fi
    done

    if [ $TOTAL_COMMITS -gt 0 ]; then
        TIME_SCORE=$(( (VALID_COMMITS * 30) / TOTAL_COMMITS ))
        echo "    -> $VALID_COMMITS de $TOTAL_COMMITS commits realizados en horario de clase (07:00-09:00 UTC-5)."
    else
        TIME_SCORE=0
    fi
fi
echo "    -> Puntos por horario: $TIME_SCORE/30"
SCORE=$((SCORE + TIME_SCORE))

# ---------------------------------------------------------
# 2. Evaluación de Calidad de Scripts (Máximo 40 puntos)
# ---------------------------------------------------------
echo -e "\n[*] Evaluando calidad de código de forma flexible..."
CODE_SCORE=0

SH_FILES=$(find . -type f -name "*.sh" -not -path '*/.*' -not -name "grade_local*.sh")

if [ -z "$SH_FILES" ]; then
    echo "    [!] No se encontraron archivos .sh en este directorio."
else
    # Búsqueda general de conceptos
    HAS_VARS=$(cat $SH_FILES 2>/dev/null | grep -E '\$[a-zA-Z0-9_]+|\$\{.*\}' | wc -l)
    HAS_REDIRECTION=$(cat $SH_FILES 2>/dev/null | grep -E '>|>>|<|\|' | wc -l)
    HAS_ARGS=$(cat $SH_FILES 2>/dev/null | grep -E '\$1|\$@|\$#' | wc -l)
    HAS_CONDITIONS=$(cat $SH_FILES 2>/dev/null | grep -E '\bif\b|\belif\b|\bcase\b' | wc -l)
    HAS_LOOPS=$(cat $SH_FILES 2>/dev/null | grep -E '\bfor\b|\bwhile\b|\buntil\b' | wc -l)
    HAS_FUNCTIONS=$(cat $SH_FILES 2>/dev/null | grep -E '\(\)\s*\{|\bfunction\b' | wc -l)
    HAS_TEXT_PROC=$(cat $SH_FILES 2>/dev/null | grep -E '\bgrep\b|\bawk\b|\bsed\b' | wc -l)

    # Se otorgan 10 puntos por cada concepto encontrado, con un tope de 40 puntos.
    if [ $HAS_VARS -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Variables detectadas (+10 pts)"; fi
    if [ $HAS_REDIRECTION -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Redirecciones detectadas (+10 pts)"; fi
    if [ $HAS_ARGS -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Argumentos posicionales detectados (+10 pts)"; fi
    if [ $HAS_CONDITIONS -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Condicionales detectados (+10 pts)"; fi
    if [ $HAS_LOOPS -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Bucles detectados (+10 pts)"; fi
    if [ $HAS_FUNCTIONS -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Funciones detectadas (+10 pts)"; fi
    if [ $HAS_TEXT_PROC -gt 0 ]; then CODE_SCORE=$((CODE_SCORE + 10)); echo "    -> Procesamiento de texto (grep/awk/sed) detectado (+10 pts)"; fi

    if [ $CODE_SCORE -gt 40 ]; then CODE_SCORE=40; fi
fi
echo "    -> Puntos por calidad de código: $CODE_SCORE/40"
SCORE=$((SCORE + CODE_SCORE))

# ---------------------------------------------------------
# 3. Evaluación de Comentarios (Máximo 30 puntos)
# ---------------------------------------------------------
echo -e "\n[*] Evaluando densidad de comentarios (Sin restricción de idioma)..."
COMMENT_SCORE=0

if [ -n "$SH_FILES" ]; then
    TOTAL_LINES=$(cat $SH_FILES 2>/dev/null | wc -l)
    COMMENT_LINES=$(cat $SH_FILES 2>/dev/null | grep -E '^\s*#' | grep -v '#!/bin/' | wc -l)
    
    if [ $TOTAL_LINES -gt 0 ]; then
        COMMENT_RATIO=$(( (COMMENT_LINES * 100) / TOTAL_LINES ))
        if [ $COMMENT_RATIO -ge 5 ]; then
            COMMENT_SCORE=30
            echo "    -> Densidad de comentarios aceptable ($COMMENT_RATIO%). (+30 pts)"
        elif [ $COMMENT_RATIO -gt 0 ]; then
            COMMENT_SCORE=15
            echo "    -> Densidad de comentarios baja ($COMMENT_RATIO%). (+15 pts)"
        else
            echo "    -> Sin comentarios descriptivos. (+0 pts)"
        fi
    fi
fi
echo "    -> Puntos por comentarios: $COMMENT_SCORE/30"
SCORE=$((SCORE + COMMENT_SCORE))

# ---------------------------------------------------------
# Resultado Final
# ---------------------------------------------------------
echo -e "\n==========================================="
echo -e "   CALIFICACIÓN FINAL: $SCORE / 100"
echo -e "==========================================="