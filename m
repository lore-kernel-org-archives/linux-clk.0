Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	jsarha@ti.com
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v4 2/4] clk: gpio-gate: Stay silent on EPROBE_DEFER
Date: Sun, 28 Jun 2015 16:24:54 +0200
Message-Id: <1435501496-25761-3-git-send-email-ce3a@gmx.de>
In-Reply-To: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
References: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

Do not output an error message if requesting gpio failes with EPROBE_DEFER.

Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-gpio-gate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
index a377f88..ef942da 100644
--- a/drivers/clk/clk-gpio-gate.c
+++ b/drivers/clk/clk-gpio-gate.c
@@ -90,8 +90,9 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
 		err = gpio_request_one(gpio, gpio_flags, name);
 
 	if (err) {
-		pr_err("%s: %s: Error requesting clock control gpio %u\n",
-		       __func__, name, gpio);
+		if (err != -EPROBE_DEFER)
+			pr_err("%s: %s: Error requesting clock control gpio %u\n",
+					__func__, name, gpio);
 		return ERR_PTR(err);
 	}
 
-- 
1.9.1
