Return-Path: <m.szyprowski@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/4] Samsung clock providers: convert to the new clk_hw API
Date: Thu, 20 Apr 2017 15:16:35 +0200
Message-id: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
References: 
 <CGME20170420131645eucas1p1953f481cf4ca328ad7cf6be53f626600@eucas1p1.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Dear All,

Clock providers should use the new struct clk_hw based API, so convert
all Samsung clock providers and their helper functions to the new approach.

Patches are based on top of linux-next from 20170420.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (4):
  clk: samsung: Convert common drivers to the new clk_hw API
  clk: samsung: exynos-audss: Convert to the new clk_hw API
  clk: samsung: exynos-clkout: Convert to the new clk_hw API
  clk: samsung: s5pv210-audss: Convert to the new clk_hw API

 drivers/clk/samsung/clk-cpu.c           | 15 +++---
 drivers/clk/samsung/clk-exynos-audss.c  | 55 ++++++++++----------
 drivers/clk/samsung/clk-exynos-clkout.c | 18 +++----
 drivers/clk/samsung/clk-pll.c           | 14 ++---
 drivers/clk/samsung/clk-pll.h           |  4 --
 drivers/clk/samsung/clk-s3c2410-dclk.c  | 75 ++++++++++++++-------------
 drivers/clk/samsung/clk-s5pv210-audss.c | 50 +++++++++---------
 drivers/clk/samsung/clk.c               | 91 +++++++++++++++------------------
 drivers/clk/samsung/clk.h               |  9 ++--
 9 files changed, 159 insertions(+), 172 deletions(-)

-- 
1.9.1
