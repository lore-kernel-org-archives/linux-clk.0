Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/11] clk: renesas: rcar-gen3: OSC and RCLK improvements
Date: Wed, 11 Jul 2018 16:20:49 +0200
Message-Id: <20180711142100.3765-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi all,

This patch series contains various improvements for OSC and RCLK
handling on R-Car Gen3 SoCs.

This has been tested on R-Car H3 ES1.0/ES2.0, R-Car M3-W ES1.0, R-Car
D3, and R-Car E3.
The R-Car V3H (r8a77980) patches were compile-tested only due to lack of
hardware.

Thanks for your comments!

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
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  9 +++-
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  9 +++-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 40 +++++++++++----
 drivers/clk/renesas/rcar-gen3-cpg.h     | 25 ++++++++--
 drivers/clk/renesas/renesas-cpg-mssr.c  |  5 ++
 drivers/clk/renesas/renesas-cpg-mssr.h  |  3 ++
 10 files changed, 189 insertions(+), 128 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
