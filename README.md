
# Shell Speed Tests

Benchmark the speed of various shells on your system. Providing a variety of
tests and shells to choose from!

## Requires

- bsd make (`bmake`)
- bash

## Usage

Run from an `bash` compatible shell.
Multithreaded make jobs `-jn` are known to break output. If issues occur 
please use `-j1`.

`bmake test-all` to run all tests (default behavior)  
`bmake list-tests` to list available tests  
`bmake list-shells` to list available shells  
`bmake <test name>` to run a specific test from `list-tests`  
`bmake -- 'check_shells=sh bash zsh'` to only test sh, bash, and zsh.  
`bmake -- 'available_tests=test1 test2 test3'` to test only the specified tests  

