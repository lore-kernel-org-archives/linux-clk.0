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
 Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 4/8] clk: tegra: Fix duplicate const for parent names
Date: Tue, 28 Apr 2015 13:46:19 +0900
Message-id: <1430196383-9190-5-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Replace duplicated const keyword for 'emc_parent_clk_names' with proper
array of const pointers to const strings.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/tegra/clk-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 8757feda4a11..59697c61f2f1 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -45,7 +45,7 @@
 #define CLK_SOURCE_EMC_EMC_2X_CLK_SRC(x) (((x) & CLK_SOURCE_EMC_EMC_2X_CLK_SRC_MASK) << \
 					  CLK_SOURCE_EMC_EMC_2X_CLK_SRC_SHIFT)
 
-static const char const *emc_parent_clk_names[] = {
+static const char * const emc_parent_clk_names[] = {
 	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud",
 	"pll_c2", "pll_c3", "pll_c_ud"
 };
-- 
1.9.1
