Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.15
Date: Wed,  4 Oct 2017 11:44:18 +0200
Message-Id: <1507110258-11714-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.15-tag1

for you to fetch changes up to b4021bbe10017d994e5a96ebfd2677bbaf2b37e0:

  clk: renesas: rcar-gen2: Delete error message for failed memory allocation (2017-09-28 17:57:34 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.15

  - Add support for the new R-Car V3M SoC,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Markus Elfring (2):
      clk: renesas: mstp: Delete error messages for failed memory allocations
      clk: renesas: rcar-gen2: Delete error message for failed memory allocation

Sergei Shtylyov (2):
      dt-bindings: clock: Add R8A77970 CPG core clock definitions
      clk: renesas: cpg-mssr: Add R8A77970 support

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   5 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/clk-mstp.c                     |   5 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |   1 -
 drivers/clk/renesas/r8a77970-cpg-mssr.c            | 199 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a77970-cpg-mssr.h      |  48 +++++
 9 files changed, 264 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a77970-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77970-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
