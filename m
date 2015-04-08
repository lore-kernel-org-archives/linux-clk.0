Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/8] clk: Minor cleanups
Date: Wed, 08 Apr 2015 15:22:11 +0200
Message-id: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,


Small cleanups for different clock drivers.

The first two patches are independent.

Rest of the patches (these related to constifying parent names)
depend on the third patch: "clk: Constify pointers to parent
names in init data".


Tested on Arndale Octa (Exynos5420) and Trats2 (Exynos4412). Other
drivers (and MIPS related) only compile tested plus some static
checkers.

Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  clk: rockchip: Staticize file-scope declarations
  clk: exynos: Staticize file-scope declarations
  clk: Constify pointers to parent names in init data
  clk: tegra: Fix duplicate const for parent names
  clk: cdce706: Constify parent names in clock init data
  clk: sirf: Constify parent names in clock init data
  clk: ls1x: Fix duplicate const for parent names
  MIPS: Alchemy: Remove unneeded cast removing const

 arch/mips/alchemy/common/clock.c     |  6 +--
 drivers/clk/clk-cdce706.c            |  4 +-
 drivers/clk/clk-composite.c          |  2 +-
 drivers/clk/clk-ls1x.c               |  6 +--
 drivers/clk/clk-mux.c                |  8 ++--
 drivers/clk/rockchip/clk-rk3188.c    |  2 +-
 drivers/clk/rockchip/clk-rk3288.c    |  2 +-
 drivers/clk/samsung/clk-exynos5260.c | 74 ++++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos5420.c | 10 ++---
 drivers/clk/sirf/clk-common.c        | 12 +++---
 drivers/clk/tegra/clk-emc.c          |  2 +-
 include/linux/clk-provider.h         | 12 +++---
 12 files changed, 70 insertions(+), 70 deletions(-)

-- 
1.9.1
