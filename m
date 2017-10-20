Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.15 (take two)
Date: Fri, 20 Oct 2017 13:23:10 +0200
Message-Id: <1508498590-10566-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit b4021bbe10017d994e5a96ebfd2677bbaf2b37e0:

  clk: renesas: rcar-gen2: Delete error message for failed memory allocation (2017-09-28 17:57:34 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.15-tag2

for you to fetch changes up to 3f7a4d084159c52513d1ff77f3b3b880bcf517d9:

  clk: renesas: rcar-gen3: Restore R clock during resume (2017-10-20 11:16:09 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.15 (take two)

  - Add support for the second display unit clock on RZ/G1E,
  - Add git repository to MAINTAINERS,
  - Add suspend/resume support for R-Car Gen3 CPG/MSSR,
  - Small fixes and cleanups.

Note: this is on top of my previous pull request, for
tags/clk-renesas-for-v4.15-tag1, which you haven't pulled yet.

Thanks for pulling!
----------------------------------------------------------------
Fabrizio Castro (1):
      clk: renesas: cpg-mssr: Add du1 clock to R8A7745

Geert Uytterhoeven (10):
      clk: renesas: r8a7795: Correct parent clock of INTC-AP
      clk: renesas: r8a7796: Correct parent clock of INTC-AP
      clk: renesas: r8a77995: Correct parent clock of INTC-AP
      clk: renesas: rz: clk-rz is meant for RZ/A1
      MAINTAINERS: Add git repository to Renesas clock driver section
      clk: renesas: cpg-mssr: Restore module clocks during resume
      clk: renesas: cpg-mssr: Add support to restore core clocks during resume
      clk: renesas: div6: Restore clock state during resume
      clk: renesas: rcar-gen3: Restore SDHI clocks during resume
      clk: renesas: rcar-gen3: Restore R clock during resume

 .../bindings/clock/renesas,rz-cpg-clocks.txt       |  4 +-
 MAINTAINERS                                        |  1 +
 drivers/clk/renesas/clk-div6.c                     | 38 ++++++++-
 drivers/clk/renesas/clk-div6.h                     |  3 +-
 drivers/clk/renesas/clk-rz.c                       |  2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  3 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  2 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                |  7 +-
 drivers/clk/renesas/rcar-gen2-cpg.h                |  6 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                | 79 +++++++++++++----
 drivers/clk/renesas/rcar-gen3-cpg.h                |  3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             | 99 +++++++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.h             |  3 +-
 15 files changed, 217 insertions(+), 36 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
