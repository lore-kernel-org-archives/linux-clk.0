Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 4/4] clk-u300: Fix a typo in two comment lines
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 trivial@kernel.org
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Message-ID: <c113ba39-e9b4-a4e5-6fa1-f83c9b59a4d5@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:25:15 +0200
MIME-Version: 1.0
In-Reply-To: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 19:57:50 +0200

Add a missing character in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-u300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index b36ca3a14c42..7b3e1921771f 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -256,7 +256,7 @@
 #define U300_SYSCON_S1CCR_SEL_APP_FSM_CLK			(0x2 << 1)
 #define U300_SYSCON_S1CCR_SEL_RTC_CLK				(0x4 << 1)
 #define U300_SYSCON_S1CCR_SEL_APP_PLL208_CLK			(0x6 << 1)
-/* SYS_2_CLK_CONTROL third clock contol 16 bit (R/W) */
+/* SYS_2_CLK_CONTROL third clock control 16 bit (R/W) */
 #define U300_SYSCON_S2CCR					(0x128)
 #define U300_SYSCON_S2CCR_FIELD_MASK				(0xC3FF)
 #define U300_SYSCON_S2CCR_CLK_STEAL				(0x8000)
@@ -378,7 +378,7 @@
  *  +- ISP Image Signal Processor (U335 only)
  *  +- CDS (U335 only)
  *  +- DMA Direct Memory Access Controller
- *  +- AAIF APP/ACC Inteface (Mobile Scalable Link, MSL)
+ *  +- AAIF APP/ACC Interface (Mobile Scalable Link, MSL)
  *  +- APEX
  *  +- VIDEO_ENC AVE2/3 Video Encoder
  *  +- XGAM Graphics Accelerator Controller
-- 
2.14.1
