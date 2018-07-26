Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/11] clk: renesas: rcar-gen3: OSC and RCLK improvements
Date: Thu, 26 Jul 2018 17:35:06 +0200
Message-Id: <20180726153517.10020-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi all,

This patch series contains various improvements for OSC and RCLK
handling on R-Car Gen3 SoCs.

Changes compared to v1:
  - Add Reviewed-by,
  - Fix OSC predivider for 27 MHz EXTAL on R-Car V3H,
  - Rename "r_int" to ".r", and "oco" to ".oco", as they are internal
    clocks,
  - Gain a dependency on "[PATCH] clk: renesas: rcar-gen3: Rename rint
    to .r".

This has been tested on R-Car H3 ES1.0/ES2.0, R-Car M3-W ES1.0, R-Car
D3, and R-Car E3.
The R-Car V3H (r8a77980) patches were compile-tested only due to lack of
hardware.

I intend to queue this in clk-renesas-for-v4.20.

Thanks!

Geert Uytterhoeven (11):
  clk: renesas: rcar-gen3: Add support for OSC EXTAL predivider
  clk: renesas: r8a7795: Add OSC EXTAL predivider configuration
  clk: renesas: r8a7796: Add OSC EXTAL predivider configuration
  clk: renesas: r8a77965: Add OSC EXTAL predivider configuration
  clk: renesas: r8a77980: Add OSC predivider configuration and clock
  clk: renesas: cpg-mssr: Add support for fixed rate clocks
  clk: renesas: rcar-gen3: Add support for RCKSEL clock selection
  clk: renesas: r8a77990: Correct RCLK handling
  clk: renesas: r8a77995: Correct RCLK handling
  clk: renesas: rcar-gen3: Add support for mode pin clock selection
  clk: renesas: r8a77980: Add RCLK for watchdog timer

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 66 ++++++++++++-------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 66 ++++++++++++-------------
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 66 ++++++++++++-------------
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 28 ++++++-----
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 12 ++++-
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 12 ++++-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 40 +++++++++++----
 drivers/clk/renesas/rcar-gen3-cpg.h     | 24 +++++++--
 drivers/clk/renesas/renesas-cpg-mssr.c  |  5 ++
 drivers/clk/renesas/renesas-cpg-mssr.h  |  3 ++
 10 files changed, 194 insertions(+), 128 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
