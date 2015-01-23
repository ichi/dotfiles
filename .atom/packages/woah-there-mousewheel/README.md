# Woah There Mousewheel

[Until](http://discuss.atom.io/t/scroll-performance-behavior/291)
[the](https://github.com/atom/atom/issues/1666)
[React](https://github.com/atom/atom/pull/1863)
[editor](https://github.com/atom/atom/pull/2258) is implemented, it looks like
scrolling in Atom for now will be a little bit janky compared to other apps.
This package is a pretty basic hack that'll slow down the scrolling down to
something a bit more natural. Props to derek on the discussion site for the
[original solution](http://discuss.atom.io/t/scroll-performance-behavior/291/21).

Note that currently open tabs are unaffected when enabling or disabling the
package. It's a fun way to compare the scroll speed!

## Installing

Use the Atom package manager, which can be found in the Settings view or
run `apm install woah-there-mousewheel` from the command line.
