Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Bailon <abailon@baylibre.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ARM: sa1100: normalize clk API
Date: Fri, 21 Jul 2017 17:22:47 +0200
Message-Id: <20170721152250.3310552-3-arnd@arndb.de>
In-Reply-To: <20170721152250.3310552-1-arnd@arndb.de>
References: <20170721152250.3310552-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

sa1100 provides its own variant of the clk API rather than using the
generic COMMON_CLK API. This generally works, but it causes some link
errors with drivers using the clk_set_rate, clk_get_parent, clk_set_parent
or clk_round_rate functions when a platform lacks those interfaces.

This adds trivial stub implementations for each of them, based on
the behavior of the COMMON_CLK implementation:

- set_rate() and set_parent() report success without doing anything
- round_rate() returns the clk rate
- get_parent() returns NULL.

This adds the minimal bloat and should do the right thing for
the simple clock hardware in this SoC.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-sa1100/clock.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
index 0db46895c82a..7d52cd97d96e 100644
--- a/arch/arm/mach-sa1100/clock.c
+++ b/arch/arm/mach-sa1100/clock.c
@@ -35,6 +35,31 @@ struct clk clk_##_name = {				\
 
 static DEFINE_SPINLOCK(clocks_lock);
 
+/* Dummy clk routine to build generic kernel parts that may be using them */
+long clk_round_rate(struct clk *clk, unsigned long rate)
+{
+	return clk_get_rate(clk);
+}
+EXPORT_SYMBOL(clk_round_rate);
+
+int clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+EXPORT_SYMBOL(clk_set_rate);
+
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	return 0;
+}
+EXPORT_SYMBOL(clk_set_parent);
+
+struct clk *clk_get_parent(struct clk *clk)
+{
+	return NULL;
+}
+EXPORT_SYMBOL(clk_get_parent);
+
 static void clk_gpio27_enable(struct clk *clk)
 {
 	/*
-- 
2.9.0
