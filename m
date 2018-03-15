Return-Path: <s.nawrocki@samsung.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette
	<mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi
	<cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz
	<b.zolnierkie@samsung.com>, linux-samsung-soc
	<linux-samsung-soc@vger.kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 4.17
Message-id: <a64f8f5e-2d6b-a277-17cc-4c6102dc7aaa@samsung.com>
Date: Thu, 15 Mar 2018 20:02:15 +0100
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
References: <CGME20180315190219epcas1p364b2b0777c6f60c55a60119ea3d16480@epcas1p3.samsung.com>
List-ID: <linux-clk.vger.kernel.org>


Hi Stephen, Mike,

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.17-samsung

for you to fetch changes up to 182c084da5d1e4d7c02d913de154cf5167521580:

  clk: samsung: Add fout=196608001 Hz EPLL rate entry for exynos4412 (2018-03-15 19:27:29 +0100)

----------------------------------------------------------------
clk/samsung updates for v4.17

This change set includes the PLL rate definition fixes and an addition
of compile time PLL rate validation macros. It adds definitions of some
missing clocks and extends the PLL rate tables required in the sound
subsystem.
In order to handle dependencies of clocks on the power domains a clock
provider sub-driver is added for Exynos5 SoCs. In newer Exynos SoCs
there is no need to do such things as the clocks/power domain relations
are more clearly defined and better documented.

----------------------------------------------------------------
Andrzej Hajda (7):
      clk: samsung: exynos3250: Fix PLL rates
      clk: samsung: exynos5250: Fix PLL rates
      clk: samsung: exynos5260: Fix PLL rates
      clk: samsung: exynos5433: Fix PLL rates
      clk: samsung: exynos7: Fix PLL rates
      clk: samsung: s3c2410: Fix PLL rates
      clk: samsung: Add compile time PLL rate validators

Chanwoo Choi (1):
      clk: samsung: s3c: Remove unneeded enumeration

Marek Szyprowski (5):
      soc: samsung: pm_domains: Add blacklisting clock handling
      clk: samsung: Add Exynos5 sub-CMU clock driver
      clk: samsung: exynos5420: Move PD-dependent clocks to Exynos5 sub-CMU
      clk: samsung: exynos5250: Move PD-dependent clocks to Exynos5 sub-CMU
      clk: samsung: exynos5250: Add missing clocks for FIMC LITE SYSMMU devices

Sylwester Nawrocki (7):
      clk: samsung: Add a git tree entry to MAINTAINERS
      clk: exynos5433: Add CLK_IGNORE_UNUSED flag to sclk_ioclk_i2s1_bclk
      clk: exynos5433: Extend list of available AUD_PLL output frequencies
      Merge branch 'for-v4.17/power_domains' into for-v4.17/next
      clk: samsung: exynos5420: Add CLK_SET_RATE_PARENT flag to mout_mau_epll_clk
      clk: samsung: exynos5420: Add more entries to EPLL rate table
      clk: samsung: Add fout=196608001 Hz EPLL rate entry for exynos4412

Wei Yongjun (2):
      clk: samsung: Remove redundant dev_err call in exynos5433_cmu_probe()
      clk: samsung: Remove redundant dev_err call in exynos_audss_clk_probe()

 MAINTAINERS                              |   1 +
 drivers/clk/samsung/Makefile             |   2 +
 drivers/clk/samsung/clk-exynos-audss.c   |   4 +-
 drivers/clk/samsung/clk-exynos3250.c     | 114 +++++++++----------
 drivers/clk/samsung/clk-exynos4.c        | 103 ++++++++---------
 drivers/clk/samsung/clk-exynos5-subcmu.c | 189 ++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5-subcmu.h |  26 +++++
 drivers/clk/samsung/clk-exynos5250.c     | 111 +++++++++++--------
 drivers/clk/samsung/clk-exynos5260.c     |  90 +++++++--------
 drivers/clk/samsung/clk-exynos5410.c     |  20 ++--
 drivers/clk/samsung/clk-exynos5420.c     | 189 ++++++++++++++++++++++----------
 drivers/clk/samsung/clk-exynos5433.c     | 121 ++++++++++----------
 drivers/clk/samsung/clk-exynos7.c        |   2 +-
 drivers/clk/samsung/clk-pll.h            |  48 ++++++--
 drivers/clk/samsung/clk-s3c2410.c        | 108 +++++++++---------
 drivers/clk/samsung/clk-s3c2412.c        |  11 +-
 drivers/clk/samsung/clk-s3c2443.c        |  17 +--
 drivers/clk/samsung/clk-s3c64xx.c        |  17 +--
 drivers/soc/samsung/pm_domains.c         |  11 ++
 19 files changed, 758 insertions(+), 426 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.c
 create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.h

-- 
Regards,
Sylwester
