Return-Path: <RAJANV@xilinx.com>
Return-Path: rajan.vaja@xilinx.com
From: Rajan Vaja <rajan.vaja@xilinx.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rajan Vaja
	<rajan.vaja@xilinx.com>
Subject: [PATCH] clk: clk-fixed-factor: Clear OF_POPULATED flag in case of failure
Date: Tue, 17 Jul 2018 06:17:00 -0700
Message-ID: <1531833420-27175-1-git-send-email-rajan.vaja@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Fixed factor clock has two initializations at of_clk_init() time
and during platform driver probe. Before of_clk_init() call,
node is marked as populated and so its probe never gets called.

During of_clk_init() fixed factor clock registration may fail if
any of its parent clock is not registered. In this case, it doesn't
get chance to retry registration from probe. Clear OF_POPULATED
flag if fixed factor clock registration fails so that clock
registration is attempted again from probe.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
---
 drivers/clk/clk-fixed-factor.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.=
c
index d72ef2d..f3ae4ff 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -177,8 +177,15 @@ static struct clk *_of_fixed_factor_clk_setup(struct d=
evice_node *node)

        clk =3D clk_register_fixed_factor(NULL, clk_name, parent_name, flag=
s,
                                        mult, div);
-       if (IS_ERR(clk))
+       if (IS_ERR(clk)) {
+               /*
+                * If parent clock is not registered, registration would fa=
il.
+                * Clear OF_POPULATED flag so that clock registration can b=
e
+                * attempted again from probe function.
+                */
+               of_node_clear_flag(node, OF_POPULATED);
                return clk;
+       }

        ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
        if (ret) {
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
