Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
	geert@linux-m68k.org, Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement hand-off
Date: Fri,  7 Aug 2015 12:09:27 -0700
Message-Id: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an alternative solution to Lee's "clk: Provide support for
always-on clocks" series[0].

The first two patches introduce run-time checks to ensure that clock
consumer drivers are respecting the clk.h api. The former patch checks
for prepare and enable imbalances. The latter checks for calls to
clk_put without first disabling and unpreparing the clk.

The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
prepares and enables a clk at registration-time. The reference counts
(prepare & enable) are transferred to the first clock consumer driver
that clk_get's the clk with this flag set AND calls clk_prepare or
clk_enable.

The net result is that a clock with this flag set will be enabled at
boot and neither the clk_disable_unused garbage collector or the
"sibling clock disables a shared parent" scenario will cause the flagged
clock to be disabled. The first driver to come along and explicitly
claim, prepare and enable this clock will inherit those reference
counts. No change to clock consumer drivers is required for this to
work. Please continue to use the clk.h api properly.

In time this approach can probably replace the CLK_IGNORE_UNUSED flag
and hopefully reduce the number of users of the clk_ignore_unused boot
parameter.

Finally, a quick note on comparing this series to Lee's. I went with the
simplest approach to solve a real problem: preventing critical clocks
from being spuriously disabled at boot, or before a their parent clock
becomes accidentally disabled by a sibling.

All of the other kitchen sink stuff (DT binding, passing the flag back
to the framework when the clock consumer driver calls clk_put) was left
out because I do not see a real use case for it. If one can demonstrate
a real use case (and not a hypothetical one) then this patch series can
be expanded further.

[0] http://lkml.kernel.org/r/<1437570255-21049-1-git-send-email-lee.jones@linaro.org>

Michael Turquette (3):
  clk: per-user clk prepare & enable ref counts
  clk: clk_put WARNs if user has not disabled clk
  clk: introduce CLK_ENABLE_HAND_OFF flag

 drivers/clk/clk.c            | 79 +++++++++++++++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |  3 ++
 2 files changed, 78 insertions(+), 4 deletions(-)

-- 
1.9.1

