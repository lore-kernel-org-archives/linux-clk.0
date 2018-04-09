Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: cs2000: mark resume function as __maybe_unused
Date: Mon,  9 Apr 2018 12:54:34 +0200
Message-Id: <20180409105438.2402477-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

When power management is disabled, we get a harmless warning:

drivers/clk/clk-cs2000-cp.c:544:12: error: 'cs2000_resume' defined but not used [-Werror=unused-function]

Marking the function as __maybe_unused lets the compiler silently
drop it instead.

Fixes: eade4ccdb087 ("clk: cs2000: set pm_ops in hibernate-compatible way")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/clk-cs2000-cp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index c58019750b7e..a2f8c42e527a 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -541,7 +541,7 @@ static int cs2000_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int cs2000_resume(struct device *dev)
+static int __maybe_unused cs2000_resume(struct device *dev)
 {
 	struct cs2000_priv *priv = dev_get_drvdata(dev);
 
-- 
2.9.0
