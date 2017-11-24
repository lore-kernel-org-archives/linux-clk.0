Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: sboyd@codeaurora.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 ysato@users.sourceforge.jp, vz@mleia.com, slemieux.tyco@gmail.com,
 vireshk@kernel.org
Subject: [PATCH 2/6] clk: lpc32xx: pr_err() strings should end with newlines
Date: Fri, 24 Nov 2017 12:25:29 +0530
Message-Id: <1dddfd71153339875c7bedf6e562483607180a4d.1511505932.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

pr_err() messages should end with a new-line to avoid other messages
being concatenated.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 7b359af..b669a5c 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -526,7 +526,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	    !(pll_is_valid(parent_rate, 1, 1000000, 20000000)
 	      && pll_is_valid(cco_rate, 1, 156000000, 320000000)
 	      && pll_is_valid(ref_rate, 1, 1000000, 27000000)))
-		pr_err("%s: PLL clocks are not in valid ranges: %lu/%lu/%lu",
+		pr_err("%s: PLL clocks are not in valid ranges: %lu/%lu/%lu\n",
 		       clk_hw_get_name(hw),
 		       parent_rate, cco_rate, ref_rate);
 
@@ -1505,7 +1505,7 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 		return;
 	}
 	if (clk_get_rate(clk_32k) != 32768) {
-		pr_err("invalid clock rate of external 32KHz oscillator");
+		pr_err("invalid clock rate of external 32KHz oscillator\n");
 		return;
 	}
 
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
