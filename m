Return-Path: <gregkh@linuxfoundation.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>,
	Carlos Palminha <palminha@synopsys.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Sasha Levin <alexander.levin@verizon.com>
Subject: [PATCH 4.9 021/104] clk/axs10x: Clear init field in driver probe
Date: Fri,  6 Oct 2017 10:50:59 +0200
Message-Id: <20171006083843.870474139@linuxfoundation.org>
In-Reply-To: <20171006083840.743659740@linuxfoundation.org>
References: <20171006083840.743659740@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

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
Link: lkml.kernel.org/r/040cc9afdfa0e95ce7a01c406ff427ef7dc0c0fd.1481540717.git.joabreu@synopsys.com
Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/axs10x/i2s_pll_clock.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/clk/axs10x/i2s_pll_clock.c
+++ b/drivers/clk/axs10x/i2s_pll_clock.c
@@ -182,6 +182,7 @@ static int i2s_pll_clk_probe(struct plat
 	if (IS_ERR(pll_clk->base))
 		return PTR_ERR(pll_clk->base);
 
+	memset(&init, 0, sizeof(init));
 	clk_name = node->name;
 	init.name = clk_name;
 	init.ops = &i2s_pll_ops;
