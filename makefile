#!/usr/bin/env bmake

root_dir = .

.include "${root_dir}/config.mk"

# tests
available_tests ?= test_fib_1m

# shells
all_shells    = sh bash zsh ksh csh tcsh fish
check_shells ?= auto

# generate validate_shells 
.if ${check_shells} == auto
validate_shells = ${all_shells}
.else
validate_shells = ${check_shells}
.endif

# generate available_shells
.for shell in ${validate_shells}
shell_found != (which ${shell} >/dev/null && echo "true") || echo "false"
.if ${shell_found} == true
available_shells += ${shell}
.endif # shell_found == true
.endfor # shell in validate_shells
.undef shell_found

# validate that all check_shells were found
.if ${check_shells} != auto
missing_shells != echo '${check_shells} ${available_shells}' |tr ' ' '\n' |sort |uniq -u |xargs
compare_missing := '${missing_shells}'
.if ${compare_missing} != ''
.error failed to find one or more required shells! missing ${missing_shells}
.endif # no missing_shells
.undef compare_missing
.undef missing_shells
.endif # no auto

# handle exports
.export root_dir
.export available_tests
.export test_log_dir

# phoneys
all: test-all

list-tests:
	@echo "${available_tests}" |xargs |tr ' ' '\n'

list-shells:
	@echo "${available_shells}" |xargs |tr ' ' '\n'

test-all: ${available_tests}

${available_tests}:
	@echo '-------------------------------------------------------------------------------' >&2
	@echo 'test $@:' >&2
.for shell in ${available_shells}
	@echo '----' >&2
	@echo '${shell}' >&2
	@bash -c 'time { ${root_dir}/tests/$@/${shell} 2>&1 >/dev/null ; }'
.endfor

# end of file
