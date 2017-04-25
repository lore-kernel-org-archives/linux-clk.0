Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Provide dummy of_clk_get_from_provider() for compile-testing
Date: Tue, 25 Apr 2017 19:28:48 +0200
Message-Id: <1493141328-28201-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

When CONFIG_ON=n, dummies are provided for of_clk_get() and
of_clk_get_by_name(), but not for of_clk_get_from_provider().

Provide a dummy for the latter, to improve the ability to do
compile-testing.

Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index e9d36b3e49de5b1b..3ed97abb5cbb7f94 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -539,6 +539,10 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
+{
+	return ERR_PTR(-ENOENT);
+}
 #endif
 
 #endif
-- 
2.7.4
