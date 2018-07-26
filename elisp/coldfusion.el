(setq cfml-keywords
      `("cfabort" "cfapplet" "cfapplication" "cfargument" "cfassociate"
	"cfbreak" "cfcache" "cfcalendar" "cfcase" "cfcatch"
	"cfchart" "cfchartdata" "cfchartseries" "cfcol" "cfcollection"
	"cfcomponent" "cfcontent" "cfcookie" "cfdefaultcase" "cfdirectory"
	"cfdocument" "cfdocumentitem" "cfdocumentsection" "cfdump" "cfelse"
	"cfelseif" "cferror" "cfexecute" "cfexit" "cffile" "cfflush" "cfform"
	"cfformgroup" "cfformitem" "cfftp" "cffunction" "cfif"
	"cfscript" "cfsearch" "cfselect" "cfservletparam"
	"cfloop" "cfmail" "cfmailparam" "cfmailpart" "cfmodule"
	"cfNTauthenticate" "cfobject" "cfobjectcache" "cfoutput" "cfparam"
	"cfpop" "cfprocessingdirective" "cfprocparam" "cfprocresult"
	"cfproperty" "cfquery" "cfqueryparam" "cfregistry" "cfreport"
	"cfreportparam" "cfrethrow" "cfreturn" "cfsavecontent" "cfschedule"
	"cfscript" "cfsearch" "cfselect" "cfservletparam" "cfset"
	"cfsetting" "cfsilent" "cfslider" "cfstoredproc" "cfswitch" "cftable"
	"cftextarea" "cftextinput" "cfthrow" "cftimer" "cftrace" "cftransaction"
	"cftree" "cftreeitem" "cftry" "cfupdate" "cfwddx" "cfxml"))

(setq cfml-functions `("ACos" "ASin" "Abs" "AddSOAPRequestHeader" "AddSOAPResponseHeader"
		       "ArrayAppend" "ArrayAvg" "ArrayClear" "ArrayDeleteAt" "ArrayInsertAt"
		       "ArrayIsEmpty" "ArrayLen" "ArrayMax" "ArrayMin" "ArrayNew"
		       "ArrayPrepend" "ArrayResize" "ArraySet" "ArraySort" "ArraySum"
		       "Chr" "Compare" "CompareNoCase" "Cos" "CreateDate" "CreateDateTime"
		       "URLDecode" "URLEncodedFormat" "URLSessionFormat" "Val" "ValueList"
		       "Week" "Wrap" "WriteOutput" "XmlParse" "XmlSearch" "XmlTransform"
		       "XmlGetNodeType" "XmlNew" "XmlParse" "XmlSearch" "XmlTransform"
		       "XmlValidate" "Year" "YesNoFormat" "TransactionSetSavePoint"
		       "ThreadTerminate" "ThreadJoin" "Throw" "Writelog" "Writedump"))
(setq cfml-keywords-regexp (regexp-opt cfml-keywords 'words))
(setq cfml-functions-regexp (regexp-opt cfml-functions 'words))
(setq cfml-font-lock-keywords
      `((,cfml-keywords-regexp . font-lock-keyword-face)
	("<cfset \\([^ ]+\\) " . (1 font-lock-variable-name-face))
	("#\\([^#]+\\)#" . (1 font-lock-variable-name-face))
	(,cfml-functions-regexp . font-lock-function-name-face)))
(define-derived-mode cfml-mode html-mode
  "cfml mode"
  "Major mode for editing CFML"
  (setq font-lock-defaults '((cfml-font-lock-keywords))))

(provide 'cfml-mode)
