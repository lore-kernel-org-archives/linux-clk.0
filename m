Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi: don't mark sun6i_ar100_data __initconst
Date: Tue,  2 Feb 2016 16:55:30 +0100
Message-Id: <1454428571-4040607-1-git-send-email-arnd@arndb.de>
In-Reply-To: <1453727747-23307-11-git-send-email-wens@csie.org>
References: <1453727747-23307-11-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The clk-sun6i-ar100 clk driver is a platform driver that may use
deferred probing, so its probe function must not access
__init symbols. Kbuild warns about this:

WARNING: drivers/clk/sunxi/built-in.o(.text+0x15f0): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
The function sun6i_a31_ar100_clk_probe() references
the (unknown reference) __initconst (unknown).
This is often because sun6i_a31_ar100_clk_probe lacks a __initconst
annotation or the annotation of (unknown) is wrong.

Removing the __initconst annotation avoids the warning and makes
deferred probing work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 3ca2377b6fed ("clk: sunxi: rewrite sun6i-ar100 using factors clk")
---
 drivers/clk/sunxi/clk-sun6i-ar100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index a7f5777834eb..84a187e55360 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -60,7 +60,7 @@ static const struct clk_factors_config sun6i_ar100_config = {
 	.pshift = 4,
 };
 
-static const struct factors_data sun6i_ar100_data __initconst = {
+static const struct factors_data sun6i_ar100_data = {
 	.mux = 16,
 	.muxmask = GENMASK(1, 0),
 	.table = &sun6i_ar100_config,
-- 
2.7.0
