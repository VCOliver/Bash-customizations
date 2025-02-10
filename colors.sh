
# =============================================================================
# ANSI Color Escape Sequence Generator and Exporter
#
# This script defines a function `ansi_color` which converts RGB values along
# with optional text formatting flags (like bold, underline, etc.) into a full
# ANSI escape sequence. It then exports several basic color variables for ease
# of use in shell scripts.
#
# Usage of ansi_color:
#   ansi_color <fg|bg> R G B [flags...]
#
#   <fg|bg>  : Choose 'fg' for foreground or 'bg' for background color.
#   R G B    : RGB components (values 0-255).
#   flags    : (Optional) Text attributes. Supported flags:
#              - bold
#              - dim
#              - underline
#              - blink
#              - reverse
#              - hidden
#
# Example:
#   ansi_color fg 255 100 0 bold underline
#   Produces an escape sequence that sets bold, underlined text in a 24-bit
#   orange color.
#
# After sourcing this file, you can use exported variables like $FG_RED,
# $BG_BLUE, $BOLD, etc., to colorize your terminal output.
# =============================================================================

# -----------------------------------------------------------------------------
# Function: get_truecolor
# -----------------------------------------------------------------------------
get_truecolor() {
    if [ "$#" -lt 4 ]; then
        echo "Usage: ansi_color <fg|bg> R G B [flags...]"
        return 1
    fi

    local mode="$1"
    local r="$2"
    local g="$3"
    local b="$4"
    shift 4

    # Array to accumulate SGR (Select Graphic Rendition) codes.
    local codes=()

    # Process any additional formatting flags.
    for flag in "$@"; do
        case "$flag" in
            bold)       codes+=("1") ;;
            dim)        codes+=("2") ;;
            underline)  codes+=("4") ;;
            blink)      codes+=("5") ;;
            reverse)    codes+=("7") ;;
            hidden)     codes+=("8") ;;
            *)          ;;  # Unknown flags are skipped.
        esac
    done

    # Append the true color code.
    if [ "$mode" == "fg" ]; then
        # Foreground true color: \e[38;2;<R>;<G>;<B>m
        codes+=("38" "2" "$r" "$g" "$b")
    elif [ "$mode" == "bg" ]; then
        # Background true color: \e[48;2;<R>;<G>;<B>m
        codes+=("48" "2" "$r" "$g" "$b")
    else
        echo "Invalid mode: $mode. Use 'fg' for foreground or 'bg' for background."
        return 1
    fi

    # Join all codes with semicolons.
    local IFS=";"
    local code_str="${codes[*]}"

    # Output the final ANSI escape sequence.
    echo -e "\e[${code_str}m"
}

# Function to return 256-color escape sequence
get_256color() {
    local mode="$1"
    local index="$2"

    if [[ "$mode" == "fg" ]]; then
        echo -ne "\e[38;5;${index}m"
    else
        echo -ne "\e[48;5;${index}m"
    fi
}

# -----------------------------------------------------------------------------
# Function: supports_truecolor
# Checks whether the terminal supports 24-bit (true) color.
# Returns 0 (true) if supported; nonzero otherwise.
# -----------------------------------------------------------------------------
supports_truecolor() {
    if [[ "$COLORTERM" == "truecolor" || "$COLORTERM" == "24bit" ]]; then
        return 0
    else
        return 1
    fi
}

# Wrapper function that automatically selects the right method
get_color() {
    if supports_truecolor; then
        get_truecolor "$@"
    else
        get_256color "$@"
    fi
}

# Export the functions so they are available in subshells, if needed.
export -f supports_truecolor
export -f index_to_rgb
export -f get_color

# -----------------------------------------------------------------------------
# Exporting Basic Formatting and Color Variables
# -----------------------------------------------------------------------------

# Reset sequence to clear all attributes.
export RESET="\e[0m"

# Basic text formatting variables.
export BOLD="\e[1m"
export DIM="\e[2m"
export UNDERLINE="\e[4m"
export BLINK="\e[5m"
export REVERSE="\e[7m"
export HIDDEN="\e[8m"

declare -rA FG_COLORS=(
    [black]=$($get_color 0 0 0)
    [red]=$($get_color 255 0 0)
    [green]=$($get_color 0 255 0)
    [yellow]=$($get_color 255 255 0)
    [blue]=$($get_color 0 0 255)
    [magenta]=$($get_color 255 0 255)
    [cyan]=$($get_color 0 255 255)
    [white]=$($get_color 255 255 255)
    [gray]=$($get_color 128 128 128)
    [orange]=$($get_color 255 165 0)
    [purple]=$($get_color 128 0 128)
)

declare -rA BG_COLORS=(
    [black]=$($get_color 0 0 0)
    [red]=$($get_color 255 0 0)
    [green]=$($get_color 0 255 0)
    [yellow]=$($get_color 255 255 0)
    [blue]=$($get_color 0 0 255)
    [magenta]=$($get_color 255 0 255)
    [cyan]=$($get_color 0 255 255)
    [white]=$($get_color 255 255 255)
    [gray]=$($get_color 128 128 128)
    [orange]=$($get_color 255 165 0)
    [purple]=$($get_color 128 0 128)
)
