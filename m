Return-Path: <RAJANV@xilinx.com>
Return-Path: rajan.vaja@xilinx.com
From: Rajan Vaja <rajan.vaja@xilinx.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<JOLLYS@xilinx.com>, <michals@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>
Subject: [PATCH] clk: clk-fixed-factor: Use new macro CLK_OF_DECLARE_DRIVER
Date: Thu, 8 Mar 2018 06:15:00 -0800
Message-ID: <1520518500-5500-1-git-send-email-rajanv@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Fixed factor clock has two initialization at of_clk_init()
time and also during platform driver probe. So declare the
fixed factor clock with CLK_OF_DECLARE_DRIVER instead of
CLK_OF_DECLARE.

See below commit for reference:
"clk: sunxi: apb0: Use new macro CLK_OF_DECLARE_DRIVER"
(sha1: 915128b621a05c63fa58ca9e4cbdf394bbe592f3)

Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
Suggested-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/clk/clk-fixed-factor.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.=
c
index a5d402d..d72ef2d 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -196,8 +196,9 @@ void __init of_fixed_factor_clk_setup(struct device_nod=
e *node)
 {
        _of_fixed_factor_clk_setup(node);
 }
-CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
-               of_fixed_factor_clk_setup);
+
+CLK_OF_DECLARE_DRIVER(fixed_factor_clk, "fixed-factor-clock",
+                     of_fixed_factor_clk_setup);

 static int of_fixed_factor_clk_remove(struct platform_device *pdev)
 {
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
