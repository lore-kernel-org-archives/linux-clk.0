Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: David Lechner <david@lechnology.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: davinci: fix a typo (which leads to build failures)
Date: Mon, 25 Jun 2018 19:25:50 +0200
Message-Id: <20180625172550.17379-1-brgl@bgdev.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This should have been DM365, not DM356.

Fixes: 4eff0bebf4ed5 ("clk: davinci: Fix link errors when not all SoCs are enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/clk/davinci/psc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/psc.h b/drivers/clk/davinci/psc.h
index 6a42529d31a9..cc5614567a70 100644
--- a/drivers/clk/davinci/psc.h
+++ b/drivers/clk/davinci/psc.h
@@ -107,7 +107,7 @@ extern const struct davinci_psc_init_data of_da850_psc1_init_data;
 #ifdef CONFIG_ARCH_DAVINCI_DM355
 extern const struct davinci_psc_init_data dm355_psc_init_data;
 #endif
-#ifdef CONFIG_ARCH_DAVINCI_DM356
+#ifdef CONFIG_ARCH_DAVINCI_DM365
 extern const struct davinci_psc_init_data dm365_psc_init_data;
 #endif
 #ifdef CONFIG_ARCH_DAVINCI_DM644x
-- 
2.17.1
