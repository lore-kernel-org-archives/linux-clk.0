Return-Path: <Akshu.Agrawal@amd.com>
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Cc: djkurtz@chromium.org,
	akshu.agrawal@amd.com,
	Alexander.Deucher@amd.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Akshu Agrawal <Akshu.Agrawal@amd.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: x86: Set default parent to 48Mhz
Date: Tue, 21 Aug 2018 12:21:57 +0530
Message-Id: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: akshu.agrawal@amd.com
List-ID: <linux-clk.vger.kernel.org>

System clk provided in ST soc can be set to:
48Mhz, non-spread
25Mhz, spread
To get accurate rate, we need it to set it at non-spread
option which is 48Mhz.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 drivers/clk/x86/clk-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-st.c b/drivers/clk/x86/clk-st.c
index fb62f39..3a0996f 100644
--- a/drivers/clk/x86/clk-st.c
+++ b/drivers/clk/x86/clk-st.c
@@ -46,7 +46,7 @@ static int st_clk_probe(struct platform_device *pdev)
 		clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
 		0, st_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0, NULL);
 
-	clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_25M]->clk);
+	clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
 
 	hws[ST_CLK_GATE] = clk_hw_register_gate(NULL, "oscout1", "oscout1_mux",
 		0, st_data->base + MISCCLKCNTL1, OSCCLKENB,
-- 
1.9.1
