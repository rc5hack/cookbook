# ~/.profile: executed by the command interpreter for login shells.

# set PATH so it includes user's private bin if exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# locale for formatting numbers - keep POSIX (default)
export LC_NUMERIC=POSIX

#export CHARSET=ru_RU.KOI8-R
#export MM_CHARSET=ru_RU.KOI8-R
#export LANG=ru_RU.KOI8-R

## locale for string collation routines (controls alphabetic ordering in strcoll() and strxfrm())
#export LC_COLLATE=ru_RU.KOI8-R
## locale for the ctype(3) and multibyte(3) (controls upper/lower case, alphabetic/non-alphabetic characters, and so on)
#export LC_CTYPE=ru_RU.KOI8-R
## locale for message catalogs, see catopen(3)
#export LC_MESSAGES=ru_RU.KOI8-R
## locale for formatting monetary values; this affects the localeconv()
#export LC_MONETARY=ru_RU.KOI8-R
## locale for formatting numbers
#export LC_NUMERIC=ru_RU.KOI8-R
## locale for formatting dates and times using the strftime()
#export LC_TIME=ru_RU.KOI8-R
