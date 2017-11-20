# SimVision

Waveform viewer. Packaged with NCSim.

The SimVision GUI can be opened with:

    ncverilog -access +rwc -gui counter_tb.v

Or to view a `.shm` wave file:

    simvision waves.shm

`-access +rwc` allows you to see and alter values. Source: <https://community.cadence.com/cadence_technology_forums/f/30/t/11942>

TODO: what is `c` for? Stands for "connectivity" <http://www.edaboard.com/thread23842.html>

Looks like a step debugger / waveform viewer for Verilog.

There are several open videos from Cadence about it: <https://www.youtube.com/watch?v=a2YmCK0uzJs&list=PLYdInKVfi0KYzCjnkgRgDXFJcKyQRz6eM>
