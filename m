Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] clk: Fix debugfs_create_*() usage
Date: Wed,  3 Jan 2018 12:06:13 +0100
Message-Id: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

When exposing data access through debugfs, the correct
debugfs_create_*() functions must be used, matching the data types.

This patch series remove all casts from data pointers passed to
debugfs_create_*() functions, as such casts prevent the compiler from flagging
bugs, and fixes wrong usage exposed by that.

Please refer to the individual patches for a changelog.

Thanks!

Geert Uytterhoeven (4):
  clk: Improve flags doc for of_clk_detect_critical()
  clk: Use octal instead of symbolic permissions
  clk: Show symbolic clock flags in debugfs
  clk: Fix debugfs_create_*() usage

 drivers/clk/clk.c            | 92 +++++++++++++++++++++++++++++++++-----------
 include/linux/clk-provider.h |  2 +
 2 files changed, 72 insertions(+), 22 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
