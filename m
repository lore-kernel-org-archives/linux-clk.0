Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org,
	Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ARM: davinci: normalize clk API
Date: Fri, 21 Jul 2017 17:22:46 +0200
Message-Id: <20170721152250.3310552-2-arnd@arndb.de>
In-Reply-To: <20170721152250.3310552-1-arnd@arndb.de>
References: <20170721152250.3310552-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

davinci still has its own clk implementation, but lacks
a clk_get_parent() helper, which can lead to link errors
in randconfig builds.

This adds the usual implementation.

Acked-by: Sekhar Nori <nsekhar@ti.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-davinci/clock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-davinci/clock.c b/arch/arm/mach-davinci/clock.c
index f5dce9b4e617..f77a4f766050 100644
--- a/arch/arm/mach-davinci/clock.c
+++ b/arch/arm/mach-davinci/clock.c
@@ -218,6 +218,15 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL(clk_set_parent);
 
+struct clk *clk_get_parent(struct clk *clk)
+{
+	if (!clk)
+		return NULL;
+
+	return clk->parent;
+}
+EXPORT_SYMBOL(clk_get_parent);
+
 int clk_register(struct clk *clk)
 {
 	if (clk == NULL || IS_ERR(clk))
-- 
2.9.0
