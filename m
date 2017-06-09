Return-Path: <s.nawrocki@samsung.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette
	<mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi
	<cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz
	<b.zolnierkie@samsung.com>, linux-samsung-soc
	<linux-samsung-soc@vger.kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 4.13
Message-id: <9a88fc9f-dcf0-806d-dfa8-25767c11a5d7@samsung.com>
Date: Fri, 09 Jun 2017 17:34:19 +0200
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
References: <CGME20170609153423epcas1p1ed185ee02db60f56deccdc271ecbc927@epcas1p1.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.13-samsung

for you to fetch changes up to 9842452acd3dae661f4430c4460edd1fc188377f:

  clk: samsung: exynos542x: Add EPLL rate table (2017-06-09 13:12:55 +0200)

----------------------------------------------------------------
clk/samsung updates for 4.13

 - conversion to the clk_hw API
 - definitions and fixes of exynos5420 SoC audio subsystem
   related clocks

----------------------------------------------------------------
Marek Szyprowski (6):
      clk: samsung: Remove dead code
      clk: samsung: Add local variable to match its purpose
      clk: samsung: Convert common drivers to the new clk_hw API
      clk: samsung: exynos-audss: Convert to the new clk_hw API
      clk: samsung: exynos-clkout: Convert to the new clk_hw API
      clk: samsung: s5pv210-audss: Convert to the new clk_hw API

Sylwester Nawrocki (3):
      clk: samsung: Add enable/disable operation for PLL36XX clocks
      clk: samsung: Add missing exynos5420 audio related clocks
      clk: samsung: exynos542x: Add EPLL rate table

 drivers/clk/samsung/clk-cpu.c           |  17 ++-
 drivers/clk/samsung/clk-exynos-audss.c  |  57 +++++-----
 drivers/clk/samsung/clk-exynos-clkout.c |  18 ++--
 drivers/clk/samsung/clk-exynos5420.c    |  27 ++++-
 drivers/clk/samsung/clk-pll.c           | 101 ++++++++++--------
 drivers/clk/samsung/clk-pll.h           |   4 -
 drivers/clk/samsung/clk-s3c2410-dclk.c  |  75 +++++++------
 drivers/clk/samsung/clk-s5pv210-audss.c |  52 ++++-----
 drivers/clk/samsung/clk.c               |  91 +++++++---------
 drivers/clk/samsung/clk.h               |   9 +-
 include/dt-bindings/clock/exynos5420.h  |   3 +
 11 files changed, 238 insertions(+), 216 deletions(-)

-- 
Thanks,
Sylwester
