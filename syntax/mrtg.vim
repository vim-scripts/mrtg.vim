" Vim syntax file
" Language:	MRTG Multi Router Traffic Grapher config file
" Maintainer:	Pep M. Banus i Alsina
" Email: a@b.c (a=palsina b=tinet c=cat)
" Version: 1.0
" Last change:	Spring 2014
" Comment: preliminary version (only keywords and some other stuff)
" Comment: needs debuging : feedback|suggestions|improvments are wellcome

set bg=light
highlight clear
syntax clear
if exists("syntax_on")
        syntax reset
endif

" syn case ignore

" ==================== BEGIN OF MRTG KEYWORDS ====================
" TODO: Keywords must start at the beginning of a line
"
" mrtgGlobal: value
syn keyword mrtgGlobal ConversionCode EnableIPv6 EnableSnmpV3 Forks HtmlDir IconDir ImageDir Interval Language LibAdd LoadMIBs LogDir LogFormat
syn keyword mrtgGlobal MaxAge NoMib2 PathAdd Refresh RRDCached RunAsDaemon SingleRequest SnmpOptions Target WorkDir WriteExpires

" mrtgTarget[graphName]: value
syn keyword mrtgTarget AbsMax AddHead Background BodyTag Colours Clonedirectory Directory Extension Factor IPv4Only Legend[IO1234]
syn keyword mrtgTarget Legend1 Legend2 Legend3 Legend4 LegendI LegendO
syn keyword mrtgTarget MaxBytes MaxBytes1 MaxBytes2 NoSpaceChar PageFoot PageTop PNGTitle Options RRDRowCount RRDRowCount30m
syn keyword mrtgTarget RRDRowCount2h RRDRowCount1d RRDHWRRAs TimeStrPos TimeStrFmt RouterName RouterUptime SetEnv ShortLegend
syn keyword mrtgTarget Step Suppress Timezone Title Unscaled Weekformat WithPeak XScale XSize XZoom
syn keyword mrtgTarget YLegend YScale YSize YTics YTicsFactor YZoom kMG kilo

" Options[graphName]: mrtgOptions
syn keyword mrtgOptions absolute avgpeak bits dorelpercent gauge growright integer noarrow nobanner noborder noi noinfo
syn keyword mrtgOptions nolegend noo nopercent perhour perminute unknaszero withzeroes
syn keyword mrtgOptions /transparent/ 

" Example: SnmpOptions: retries => 2, only_ip_address_matching => 0 
syn keyword mrtgSNMP timeout retries backoff default_max_repetitions lenient_source_port_matching lenient_source_address_matching

" Global: ThreshHyst: 0.05
" Target especific: ThreshMailAddress[_]: admin@example.com
syn keyword mrtgThreshold ThreshDir ThreshHyst ThreshMailServer ThreshMailSender ThreshMailAddress ThreshMinI
syn keyword mrtgThreshold ThreshMaxI ThreshDesc ThreshProgI ThreshProgOKI ThreshMinO ThreshMaxO ThreshProgO ThreshProgOKO

" ==================== END OF MRTG KEYWORDS ====================

syn region	htmlTag		start="<" end=">" 
syn match	htmlChar	"&\a\+;"

syn match	colours	"[A-Z ]\+\#[a-fA-F0-9]\+,*"

syn region	Cadena		start="\"" end="\"" 
syn region	Script		start="`" end="`" 
syn match	Comentari	"^#.*$"

syn region	graphName	start="\[" end="\]" 
syn match	defaultGraph	"\[_\]"
syn match	prefixGraph		"\[\^\]"
syn match	postfixGraph	"\[\$\]"

"syn match	interface	"\]: *-*\d*:"ms=s+3,me=e-1 skipwhite
"syn match	interface	"\]:\s\d\+:"ms=s+3,me=e-1 skipwhite
syn match	interface	":\s\d\+:"ms=s+2,me=e-1 
" TODO interface by: IP, description, Name, Mac address, type
syn match	numOIDs		"\(\.\d\+\)\{5,}"
syn match	textOIDs	"[a-zA-Z0-9\.]\+\.\d\+"
" TODO check community syntax
syn match	community	"[a-zA-Z0-9]\+@"me=e-1
syn match	machine		"@\([a-zA-Z0-9\.]\+\)\+"ms=s+1
syn match	numSNMP		":[0-9]*:[0-9]*:[0-9]*:[0-9]*:[123]*"

" TODO: destTarget as a sequence of previous matches


" ==================== BEGIN OF IP SECTION ====================
" copied form: cisco.vim (http://www.vim.org/scripts/script.php?script_id=4624)
" (unknown license)

syn match ipaddress /\v\s(25[0-4]|2[0-4]\d|1\d{1,2}|[1-9]\d|[1-9])\.(25[0-5]|2[0-4]\d|1\d\d|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d\d|\d{1,2})\.(25[0-5]|2[0-4]\d|1\d\d|\d{1,2})/ nextgroup=ipaddr skipwhite 

" BadIPaddr match {{{2
syn match BadIPaddr /\v(25[6-9]|2[6-9]\d|[3-9]\d\d)\.\d{1,3}\.\d{1,3}\.\d{1,3}/       
syn match BadIPaddr /\v\d{1,3}\.(2[5][6-9]|2[6-9]\d|[3-9]\d\d)\.\d{1,3}\.\d{1,3}/     
syn match BadIPaddr /\v\d{1,3}\.\d{0,3}\.(2[5][6-9]|2[6-9]\d|[3-9]\d\d)\.\d{1,3}/     
syn match BadIPaddr /\v\d{1,3}\.\d{1,3}\.\d{1,3}\.(2[5][6-9]|2[6-9]\d|[3-9]\d\d)/     
syn match BadIPaddr /\v(25[6-9]|2[6-9]\d|[3-9]\d\d)\.
                        \(25[6-9]|2[6-9]\d|[3-9]\d\d)\.
                        \(25[6-9]|2[6-9]\d|[3-9]\d\d)\.
                        \(25[6-9]|2[6-9]\d|[3-9]\d\d)/                                
syn match BadIPaddr /\v\d{1,3}\.\d{1,3}\.\d{4,}\.\d{1,3}/                             
syn match BadIPaddr /\v\d{1,3}\.\d{4,}\.\d{1,3}\.\d{1,3}/                             
syn match BadIPaddr /\v\d{4,}\.\d{1,3}\.\d{1,3}\.\d{1,3}/                             
syn match BadIPaddr /\v\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{4,}\./                           
syn match BadIPaddr /\v\d{1,3}\.\d{1,3}\.\d{4,}\.\d{1,3}\./                           
syn match BadIPaddr /\v\d{1,3}\.\d{4,}\.\d{1,3}\.\d{1,3}\./                           
syn match BadIPaddr /\v\d{4,}\.\d{1,3}\.\d{1,3}\.\d{1,3}\./                           
syn match BadIPaddr /\v\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{4,}/                             
"2}}}

" ==================== END OF IP SECTION ====================

if !exists("did_mrtg_syntax_inits")
  let did_mrtg_syntax_inits = 1

  hi htmlTag guibg=gray ctermbg=gray guifg=white ctermfg=white
  hi htmlChar guibg=gray ctermbg=gray guifg=white ctermfg=white

  hi link mrtgGlobal	Statement
  hi link Target 		Statement
  hi link mrtgTarget	Statement
  hi mrtgOptions		cterm=bold gui=bold guifg=darkgreen ctermfg=darkgreen
"  hi link mrtgOptions	Statement
  hi mrtgSNMP			cterm=bold gui=bold guifg=green ctermfg=green
  hi mrtgThreshold		cterm=bold gui=bold guifg=red ctermfg=red


  hi link graphName 	Identifier

  hi defaultGraph guibg=lightyellow ctermbg=lightyellow guifg=blue ctermfg=blue
  hi link prefixGraph  defaultGraph
  hi link postfixGraph defaultGraph

  hi link Cadena String
  hi link Script String
  hi link Comentari Comment

  hi interface guibg=yellow ctermbg=yellow guifg=red ctermfg=red
  hi numOIDs cterm=bold gui=bold guifg=magenta ctermfg=magenta
  hi link textOIDs	numOIDs
  hi community guifg=darkmagenta ctermfg=darkmagenta
  hi link machine Underlined
  hi numSNMP guibg=lightblue ctermbg=lightblue guifg=darkblue ctermfg=darkblue

  hi ipaddress guifg=lightred ctermfg=lightred
  hi BadIPaddr guibg=red ctermbg=red guifg=white ctermfg=white

  hi colours guifg=darkcyan ctermfg=darkcyan

endif

let b:current_syntax = "mrtg"
