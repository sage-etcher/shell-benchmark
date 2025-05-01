
# Shell Speed Tests

Benchmark the speed of various shells on your system. Providing a variety of
tests and shells to choose from!

## Requires

- bsd make (`bmake`)
- posix `sh` compatible shell

## Usage

Run from an `sh` compatible shell.

`bmake run-all` to run all tests (default behavior)  
`bmake list-available` to list available tests  
`bmake run-<test>` to run a specific test  
`bmake ... -- TEST_SH=false` to disable all `sh` tests (all enabled by default)  

