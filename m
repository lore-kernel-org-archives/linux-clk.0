Return-Path: <slash.tmp@free.fr>
To: linux-clk <linux-clk@vger.kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Frias <sf84@laposte.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Mason <slash.tmp@free.fr>
Subject: Common/typical fractional divider HW API
Message-ID: <56B4B67D.2080707@free.fr>
Date: Fri, 5 Feb 2016 15:49:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

Hello,

AFAICT, the clk-fractional-divider driver implements the following
hardware API:

  M and N are two fields in the same register.
  DIV = M / N

Is this HW API common/typical in the embedded world?
in the PC world?


My hardware uses a slightly weird (to me) API:

  I = 0-255 (8 bits)
  F = 0-15  (4 bits)

  I = 0 => DIV = +INF
  I = 1 => DIV = 1 + F/(32-F)
  I > 1 => DIV = I + F/16

Is this HW API common/typical in the embedded world?
(Perhaps just the linear part for I > 1)

I see two downsides to this API:

1) I = 1 is a special case
2) A lot of the value space is wasted on large values.

For example, when I = 250, we don't really care about 250.0625, 250.125,
etc, or even nearby integer values, for that matter.

I think it's better to have a distribution with high density in small
values, and low density in high values (sort of like floating point).

For example:

  I = 0-15  (4 bits)
  F = 0-255 (8 bits)
  DIV = 2^I * (1 + F/256)

(We could probably even shave 2-4 bits on F.)

Are there downsides to this HW API?
Is this HW API common/typical in the embedded world?

Regards.
