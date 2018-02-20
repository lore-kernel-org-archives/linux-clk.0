Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: hisilicon: mark wdt_mux_p[] as const
Date: Tue, 20 Feb 2018 16:15:21 +0100
Message-Id: <20180220151531.3379003-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

The symbol is in the __initconst section but not marked init, which
caused a warning when building with LTO.

This makes it 'const' as was obviously intended.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/hisilicon/crg-hi3516cv300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/crg-hi3516cv300.c b/drivers/clk/hisilicon/crg-hi3516cv300.c
index 2007123832bb..53450b651e4c 100644
--- a/drivers/clk/hisilicon/crg-hi3516cv300.c
+++ b/drivers/clk/hisilicon/crg-hi3516cv300.c
@@ -204,7 +204,7 @@ static const struct hisi_crg_funcs hi3516cv300_crg_funcs = {
 /* hi3516CV300 sysctrl CRG */
 #define HI3516CV300_SYSCTRL_NR_CLKS 16
 
-static const char *wdt_mux_p[] __initconst = { "3m", "apb" };
+static const char *const wdt_mux_p[] __initconst = { "3m", "apb" };
 static u32 wdt_mux_table[] = {0, 1};
 
 static const struct hisi_mux_clock hi3516cv300_sysctrl_mux_clks[] = {
-- 
2.9.0
