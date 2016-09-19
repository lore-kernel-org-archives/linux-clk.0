Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: sunxi-ng: Fix reset offset for the A23 and A33
Date: Mon, 19 Sep 2016 22:00:15 +0200
Message-Id: <20160919200015.23641-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

There's been a copy and paste mistake in the A23 and A33 from the H3,
leading in the reset offset for the UART and I2C.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
Hi Stephen, Mike,

Could you apply that patch directly?

Thanks!
Maxime

 drivers/clk/sunxi-ng/ccu-sun8i-a23.c | 16 ++++++++--------
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
index 11e624ab28b1..2646d980087b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
@@ -689,14 +689,14 @@ static struct ccu_reset_map sun8i_a23_ccu_resets[] = {
 	[RST_BUS_I2S0]		=  { 0x2d0, BIT(12) },
 	[RST_BUS_I2S1]		=  { 0x2d0, BIT(13) },
 
-	[RST_BUS_I2C0]		=  { 0x2d4, BIT(0) },
-	[RST_BUS_I2C1]		=  { 0x2d4, BIT(1) },
-	[RST_BUS_I2C2]		=  { 0x2d4, BIT(2) },
-	[RST_BUS_UART0]		=  { 0x2d4, BIT(16) },
-	[RST_BUS_UART1]		=  { 0x2d4, BIT(17) },
-	[RST_BUS_UART2]		=  { 0x2d4, BIT(18) },
-	[RST_BUS_UART3]		=  { 0x2d4, BIT(19) },
-	[RST_BUS_UART4]		=  { 0x2d4, BIT(20) },
+	[RST_BUS_I2C0]		=  { 0x2d8, BIT(0) },
+	[RST_BUS_I2C1]		=  { 0x2d8, BIT(1) },
+	[RST_BUS_I2C2]		=  { 0x2d8, BIT(2) },
+	[RST_BUS_UART0]		=  { 0x2d8, BIT(16) },
+	[RST_BUS_UART1]		=  { 0x2d8, BIT(17) },
+	[RST_BUS_UART2]		=  { 0x2d8, BIT(18) },
+	[RST_BUS_UART3]		=  { 0x2d8, BIT(19) },
+	[RST_BUS_UART4]		=  { 0x2d8, BIT(20) },
 };
 
 static const struct sunxi_ccu_desc sun8i_a23_ccu_desc = {
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index fc00892906d8..96b40ca57697 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -732,14 +732,14 @@ static struct ccu_reset_map sun8i_a33_ccu_resets[] = {
 	[RST_BUS_I2S0]		=  { 0x2d0, BIT(12) },
 	[RST_BUS_I2S1]		=  { 0x2d0, BIT(13) },
 
-	[RST_BUS_I2C0]		=  { 0x2d4, BIT(0) },
-	[RST_BUS_I2C1]		=  { 0x2d4, BIT(1) },
-	[RST_BUS_I2C2]		=  { 0x2d4, BIT(2) },
-	[RST_BUS_UART0]		=  { 0x2d4, BIT(16) },
-	[RST_BUS_UART1]		=  { 0x2d4, BIT(17) },
-	[RST_BUS_UART2]		=  { 0x2d4, BIT(18) },
-	[RST_BUS_UART3]		=  { 0x2d4, BIT(19) },
-	[RST_BUS_UART4]		=  { 0x2d4, BIT(20) },
+	[RST_BUS_I2C0]		=  { 0x2d8, BIT(0) },
+	[RST_BUS_I2C1]		=  { 0x2d8, BIT(1) },
+	[RST_BUS_I2C2]		=  { 0x2d8, BIT(2) },
+	[RST_BUS_UART0]		=  { 0x2d8, BIT(16) },
+	[RST_BUS_UART1]		=  { 0x2d8, BIT(17) },
+	[RST_BUS_UART2]		=  { 0x2d8, BIT(18) },
+	[RST_BUS_UART3]		=  { 0x2d8, BIT(19) },
+	[RST_BUS_UART4]		=  { 0x2d8, BIT(20) },
 };
 
 static const struct sunxi_ccu_desc sun8i_a33_ccu_desc = {
-- 
2.9.3
