Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>
From: Phil Elwell <phil@raspberrypi.org>
Subject: CLK_OF_DECLARE advice required
Message-ID: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
Date: Tue, 30 May 2017 13:23:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

I've run into a problem using the fixed-factor clock on Raspberry Pi and I'd
like some advice before I submit a patch.

Some context: the aim is to use a standard UART and some external circuitry
as a MIDI interface. This would be straightforward except that Linux doesn't
recognise the required 31.25KHz as a valid UART baud rate. Rhe workaround is
to declare the UART clock such that the reported rate differs from the actual
rate. If one sets the reported rate to be (actual*38400)/31250 then
requesting a 38400 baud rate will result in an actual 31250 baud signal.

The fixed-factor-clock device is perfect for such a deception, but when one
is inserted between the clock source and the UART the probe function of the
UART always returns -EPROBE_DEFER because its input clock isn't available.
This is due to an initialisation order problem that requires code changes to
resolve.

fixed-factor-clock has two ways to initialise and register its clock. One is
via a standard module probe method, and the other is through the CLK_OF_DECLARE
macro, adding a registration to the __clk_of_table section. of_clk_init walks
the list of clocks, calling the initialisation functions for nodes that either
have no parent (input) clock or where the parent clock is ready. The init
function itself has no return value, so is assumed to succeed. In the event
that the parent never becomes ready, the initialisation function is called
anyway and the clock node is marked as being populated, preventing the probe
function from ever being called.

In this MIDI application using UART 1 on a Raspberry Pi, the parent clock is
provided by the clk-bcm2835-aux driver which registers using a probe function.
Because regular platform drivers are probed long after of_clk_init returns, the
parent clock for the fixed-factor clock doesn't become available early enough,
resulting in a failing call to the initialisation and no subsequent probe,
even after the parent finally becomes available.

My questions are:

1. Should all system clock drivers use OF_CLK_DECLARE? Doing so would probably
avoid this problem, but further initialisation order dependencies may
require more drivers to be initialised early.

2. Why does the clock initialisation hook registered by OF_CLK_DECLARE not
return any indication of success? If it did, and if the OF_POPULATED flag
was only set after successful initialisation then the normal retrying of
a deferred probe would also avoid this problem.

3. Would adding the OF_CLK_DECLARE hook prevent the use of the devm_ managed
functions like devm_kzalloc? If not, why doesn't fixed-factor-clock use it?

Thank you for your time,

Phil
