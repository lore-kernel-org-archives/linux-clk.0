Return-Path: <alexander.levin@verizon.com>
From: "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
	Carlos Palminha <palminha@synopsys.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "Levin, Alexander (Sasha Levin)"
	<alexander.levin@verizon.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH for 4.9 22/59] clk/axs10x: Clear init field in driver probe
Date: Thu, 14 Sep 2017 15:51:12 +0000
Message-ID: <20170914155051.8289-22-alexander.levin@verizon.com>
References: <20170914155051.8289-1-alexander.levin@verizon.com>
In-Reply-To: <20170914155051.8289-1-alexander.levin@verizon.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Return-Path: alexander.levin@one.verizon.com
List-ID: <linux-clk.vger.kernel.org>

From: Jose Abreu <Jose.Abreu@synopsys.com>

[ Upstream commit 6205406cf6f282d622f31de25036e6d1ab3a2ff5 ]

Init field must be cleared in driver probe as this structure is not
dinamically allocated. If not, wrong flags can be passed to core.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Cc: Carlos Palminha <palminha@synopsys.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Fixes: 923587aafc2c ("clk/axs10x: Add I2S PLL clock driver")
Signed-off-by: Michael Turquette <mturquette@baylibre.com>
Link: lkml.kernel.org/r/040cc9afdfa0e95ce7a01c406ff427ef7dc0c0fd.1481540717=
.git.joabreu@synopsys.com
Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
---
 drivers/clk/axs10x/i2s_pll_clock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pl=
l_clock.c
index 411310d29581..02d3bcd6216c 100644
--- a/drivers/clk/axs10x/i2s_pll_clock.c
+++ b/drivers/clk/axs10x/i2s_pll_clock.c
@@ -182,6 +182,7 @@ static int i2s_pll_clk_probe(struct platform_device *pd=
ev)
 	if (IS_ERR(pll_clk->base))
 		return PTR_ERR(pll_clk->base);
=20
+	memset(&init, 0, sizeof(init));
 	clk_name =3D node->name;
 	init.name =3D clk_name;
 	init.ops =3D &i2s_pll_ops;
--=20
2.11.0
