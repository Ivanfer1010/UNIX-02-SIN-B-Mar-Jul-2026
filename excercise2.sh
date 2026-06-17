#!/usr/bin/env bash


# ==============================================================================
# GENERAL CONFIGURATION
# ==============================================================================
# Target Git branch to inspect
RAMA_A_EVALUAR="blackhatbash"

# School/Class time window
HORA_INICIO="12:00"
HORA_FIN="14:00"

# Maximum achievable score on the grading scale
PUNTAJE_MAXIMO=100

# Initialize partial scores to 0
nota_commits=0
nota_horario=0
nota_comentarios=0

echo "=== Evaluating branch: $RAMA_A_EVALUAR ==="

# ENVIRONMENT CONTROL: Verify if the branch exists in the repository
# Switch to the target branch. '&> /dev/null' silences native Git outputs.
git checkout $RAMA_A_EVALUAR &> /dev/null

# '$?' captures the exit status of the last command. A non-zero value means failure.
if [ $? -ne 0 ]; then
    echo "Error: The branch $RAMA_A_EVALUAR does not exist in this repository."
    exit 1 # Stops script execution immediately
fi

# SECTION 1: COMMIT EVALUATION (Total volume of work)
# 'git rev-list --count HEAD' counts the total number of commits on the current branch
total_commits=$(git rev-list --count HEAD)
echo "-> Total commits detected: $total_commits"

# Conditional structure to allocate the first 30 points
if [ "$total_commits" -ge 10 ]; then
    nota_commits=30  # Excellent: 10 or more commits
elif [ "$total_commits" -gt 3 ]; then
    nota_commits=15  # Fair: Between 4 and 9 commits
else
    nota_commits=5   # Poor: 3 commits or less
fi

# SECTION 2: SCHEDULE EVALUATION (Mondays & Wednesdays from 12:00 to 14:00)
# Convert time strings into 'total minutes of the day' to mathematically
# evaluate ranges (e.g., 12:00 = 12 * 60 = 720 minutes).
# '10#' forces Bash to read the number in base 10 (prevents octal errors with leading zeros).
inicio_min=$((10#${HORA_INICIO%:*} * 60 + 10#${HORA_INICIO#*:}))
fin_min=$((10#${HORA_FIN%:*} * 60 + 10#${HORA_FIN#*:}))

commits_en_clase=0

# INFORMATIVE DEBUG MODE: Prints internal log processing on screen
echo "--- PROCESSED LOGS DETAIL ---"

# Start loop to process the Git history line by line.
# Splitting each line into two variables: '$dia' (e.g., Monday) and '$hora' (e.g., 13:15)
while read -r dia hora; do
    # Skip empty lines if any occur for any reason
    if [ -z "$dia" ] || [ -z "$hora" ]; then continue; fi

    # Convert the specific commit timestamp to total minutes of the day
    h_min=$((10#${hora%:*} * 60 + 10#${hora#*:}))
    
    # Print current processing state to stdout
    echo "   Commit detected -> Day: $dia | Local time: $hora ($h_min min)"

    # STRICT TIME WINDOW RULE:
    # 1. Validate that the day is strictly Monday or Wednesday
    if [[ "$dia" == "Monday" || "$dia" == "Wednesday" ]]; then
        # 2. Validate that the commit minute falls within the class range (720 to 840 min)
        if [ "$h_min" -ge "$inicio_min" ] && [ "$h_min" -le "$fin_min" ]; then
            ((commits_en_clase++)) # Increment valid schedule counter
            echo "   [+] VALID! This commit matches class hours."
        fi
    fi
# LOOP FEEDING MECHANISM:
# LC_ALL=C: Forces Git to output day names in standard English (Monday, Wednesday...)
# --date=local: Key fix! Converts Git's internal UTC timestamps to your PC's configured local time.
done < <(LC_ALL=C git log --format="%ad" --date=local --date=format:"%A %H:%M")
echo "----------------------------------"

echo "-> Valid commits found during class hours: $commits_en_clase"

# Calculate schedule score based on a completion percentage
if [ "$total_commits" -gt 0 ]; then
    # Rule of three to determine what percentage of total work was done in class
    porcentaje_en_clase=$(( (commits_en_clase * 100) / total_commits ))
    
    # If at least 70% of total commits were done during class, award full 30 points
    if [ "$porcentaje_en_clase" -ge 70 ]; then
        nota_horario=30
    else
        # Proportional score penalty if lower than 70%
        nota_horario=$(( (porcentaje_en_clase * 30) / 100 ))
    fi
fi


# SECTION 3: COMMENT QUALITY EVALUATION 
echo "-> Analyzing comment quality in .sh files..."
comentarios_totales=0
comentarios_largos_bien_explicados=0
en_ingles=0

# GENERAL LOOP: 'find' locates all files with a .sh extension (skipping hidden folders)
while read -r archivo; do
    # INTERNAL LOOP: Reads line by line from the filtered grep output below
    while read -r linea; do
        # 'sed' strips the '#' character and leading whitespaces, leaving clean text
        comentario=$(echo "$linea" | sed 's/^#\s*//g')
        
        # Verify that the line actually contains text and isn't an empty comment
        if [ -n "$comentario" ]; then
            ((comentarios_totales++)) # Increment global counter of analyzed comments
            
            # CRITERION 1: LENGTH. If longer than 15 characters, assume it is well-explained
            if [ ${#comentario} -gt 15 ]; then
                ((comentarios_largos_bien_explicados++))
            fi

            # CRITERION 2: LANGUAGE (Requires the aspell tool installed on the machine)
            if command -v aspell &> /dev/null; then
                # 'aspell -a -l en_US' checks text against the US English dictionary.
                # Each correct word returns an asterisk (*), so we count them using 'grep -c'
                palabras_ok=$(echo "$comentario" | aspell -a -l en_US | grep -c "^\*")
                # Count total words within the comment string using 'wc -w'
                palabras_totales=$(echo "$comentario" | wc -w)
                
                if [ "$palabras_totales" -gt 0 ]; then
                    # Calculate percentage of words that are valid English
                    porcentaje_ingles=$(( (palabras_ok * 100) / palabras_totales ))
                    # If more than 60% of the comment uses valid English, mark it as successful
                    if [ "$porcentaje_ingles" -gt 60 ]; then
                        ((en_ingles++))
                    fi
                fi
            else
                # FAIL-SAFE: If aspell is missing, default approve language to prevent unfair penalties
                ((en_ingles++))
            fi
        fi
    # The grep statement filters out only lines starting with '#' in the current file
    done < <(grep -E '^\s*#' "$archivo")
done < <(find . -name "*.sh" -not -path "*/.*")

# Ponderation for comment score (Worth a maximum of 40 points)
if [ "$comentarios_totales" -gt 0 ]; then
    # Extract total success rates for the project
    pct_calidad=$(( (comentarios_largos_bien_explicados * 100) / comentarios_totales ))
    pct_ingles=$(( (en_ingles * 100) / comentarios_totales ))
    
    # Assign up to 20 points for quality and 20 points for language matching
    puntos_calidad=$(( (pct_calidad * 20) / 100 ))
    puntos_ingles=$(( (pct_ingles * 20) / 100 ))
    
    # Combine both results to calculate final section score
    nota_comentarios=$(( puntos_calidad + puntos_ingles ))
else
    echo "   [!] Warning: No descriptive comments (#) detected inside your shell scripts."
    nota_comentarios=0
fi

# ==============================================================================
# FINAL GRADING REPORT
# ==============================================================================
# Total sum of the 3 evaluated sections ($30 + $30 + $40)
nota_final=$(( nota_commits + nota_horario + nota_comentarios ))
#Print the final result
echo "--------------------------------------------"
echo "GRADING SCORE RESULTS (Scale 1-100)"
echo "--------------------------------------------"
echo "1. Commit Volume       (Max 30): $nota_commits pts"
echo "2. Schedule Alignment  (Max 30): $nota_horario pts"
echo "3. Comment Quality     (Max 40): $nota_comentarios pts"
echo "--------------------------------------------"
echo "FINAL GRADE:                     $nota_final / 100"
echo "--------------------------------------------"
sleep 800