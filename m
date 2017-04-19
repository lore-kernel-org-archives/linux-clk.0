Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: cs2000: Add cs2000_set_saved_rate
Date: Thu, 20 Apr 2017 02:46:31 +0900
Message-Id: <1492624001-3758-11-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Gaku Inami <gaku.inami.xw@bp.renesas.com>

This patch adds the common function to reset the clk rate in order to
be able to use it in other cases.

Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/clk-cs2000-cp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 4df38c5..5b3516d 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -324,6 +324,15 @@ static int cs2000_set_rate(struct clk_hw *hw,
 	return __cs2000_set_rate(priv, ch, rate, parent_rate);
 }
 
+static int cs2000_set_saved_rate(struct cs2000_priv *priv)
+{
+	int ch = 0; /* it uses ch0 only at this point */
+
+	return __cs2000_set_rate(priv, ch,
+				 priv->saved_rate,
+				 priv->saved_parent_rate);
+}
+
 static int cs2000_enable(struct clk_hw *hw)
 {
 	struct cs2000_priv *priv = hw_to_priv(hw);
@@ -516,11 +525,8 @@ static int cs2000_probe(struct i2c_client *client,
 static int cs2000_resume(struct device *dev)
 {
 	struct cs2000_priv *priv = dev_get_drvdata(dev);
-	int ch = 0; /* it uses ch0 only at this point */
 
-	return __cs2000_set_rate(priv, ch,
-				 priv->saved_rate,
-				 priv->saved_parent_rate);
+	return cs2000_set_saved_rate(priv);
 }
 
 static const struct dev_pm_ops cs2000_pm_ops = {
-- 
1.9.1
