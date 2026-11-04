Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771938;
	b=wJl9SPHJUAmxBWhTypjzrKuK8sE+HpZ5o25owAxvSvbyTgmAVjBPX+XaPS49N2c/Wtf8
	 FBaLm57xQd8TWy9gb8H6+MZiGJBu7sUduoXhz4OnZ87v9QW4Q75N14Ijmk4vyKk+W4gXK
	 qDvLhHr/HQH+DiYemA5NtXtBqDmGwuvVumpEzLyyTfR3yJyshMUm6rHVwQ/C4RxB3VeSq
	 suhqLDtwsws7Xq2je+PVntUA/gbITdaQsQxr3FAxsgbN7G0OAonokmL8RmoNQbltW6Cgt
	 fn2Q6vSFNWGMPkGhOUhJx5Z1RMrFiLDeBq/jgbhRhXr+Dn2a2zKQjOoX+pI7iEct95Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
	b=PSB5DHdn789WC0Rw3x7XusotjK1mzEnSBEDaTjHaG1t6iL16p3QsmAEdYbFVrZGNa+Io
	 gejnbuidpkuQQNNLhS9eid6pO3/ZVzmwgARPaosm4u/hn0Ry2E78UW78peGvVwyluPyWT
	 zMjMDnr4VUv6liCWh0JEsLAEf2+PbYurB5W3jeyL2QV0iD/5R7MGhUKejh6x6MqrnKaN+
	 ZKVXAn6h9qpcBMkPOZKnPkLDxy39L0n6rHNWTKoyOGa99F80+VZIuuI0y0lJuygzsF/V3
	 RWVu9tesuJEUjxK06iU0ioeZtNDu6C8hwXMKBlqWP1b9JfAoPIZSgRXXEvB03vFnhyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M66wTn/+";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B569606D803
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B569606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M66wTn/+
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso206225a91.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771938; x=1794376738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
        b=M66wTn/+nTPCzyy4fmd6ZUObE5w7chpfOJjGrIHT2xkaFTjxU5SyF83IwxBB9oTAPM
         KKXY6odzNN4y6a5LnBPlob84zJFcXTYHslS7UCwOS1iussLZV610ali4YQ7ZmKJbieJ/
         S9RbUqgoPtgpag8TgqXpDmhyhIZ/TPlOShIssH8mfjo0x5LCYrPl0SjNpGolsfkBPo2Q
         xlj8jNlmTSpVJRmlT49bkAVx/7cHqzJOiuN2dhu7bbpkRqCH3RbsSPOex/k5H+y120K6
         i7Xxod4gNiJ81TKKNhYOE5bo9jO46zEjAdCpYqaZkPTZFLyxB7z95KY40MAZupljKRjh
         X44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771938; x=1794376738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
        b=JzTs0sdLQzitbAQVSL8g3kM1npS6NcS/mYe7GRtZvtl/Bmnh+tqrh/xWGjlV/bsRHE
         cH+nz8gYtGwxbnE7aFo8TAu3nqIB7l4dr6JBwK9rsTeotp65k+ZxUNkG0OdrZkm802dD
         xCElaS/GnHb67MWErr18bo7eUhzZzPxJPhGvsWVLgJ1oT72uv80JoX+V9Ztb0GRbqDvm
         /ktp9s1RN+gh1hnEgcoqeIYFmjhiBaxaXiv9DTJOXf6YaaLGDvraNxIXkngzvF8kjJS4
         Lau+4OfrQg0NAw9HvKYYdzurCOTm0hVzoJe90wFdltRZtRz5RbJt1UIFjSJO7u78TL/W
         64ew==
X-Forwarded-Encrypted: i=1; AKwUvBzm2JU4y/q1xaxoylAyNbs46vvRz63g7gzhtRELHM2hHEhpeBVAjbRuL6gpjNJvxnpBjZY5hYhjwPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1OvEIj+Hp4xyulJtnSKKwCqgOuxhZT5VgylIdeN0Jb8bE+pdD
	sKY/OUgJ0KxbYvho2X/l+9WL/Fz2iHkWdTZHtns5GLcuJsK3TJlS3Y16
X-Gm-Gg: AYBFou0JvvuxykhlEadlSoguispzVNJL+AetJF7ix9JGbVd6GB40wulTtRG7nJC7P8s
	g5WLUdf0ac3YSEvXtzUWWLREiD4C/nPpwpmf6RkLx+Bw+pqTNQyMGbRe6Kg3Tv98d82CUyQwP2w
	LhDVOuwHHDLNoq6Flvo0nqYsCkewxL+qwQa3rZ+09FOZxZxfCVdvbV8LMnE1jBSm5NT5Q9VnVtv
	LoebnlGA4F9U8i2pnkISWHIXwgitmhG2e/479r6FlJjD5c6S6UUSz6L//rJ92hf5xyavU5do3LW
	aliRzn/2C+1h6epzw55fRqrRsbbW+L2OCEeGBHbppPdOsHdi5N5ua1EnRQIoBb/PMYp+nNkLE8P
	A6+7lTtenP+QADqMTLQZM7F5KyiLU7zgc1RZnpz7NGIIuIyKbYKG8td1a1lVFHloVfTAVFQgug+
	cZKdAlvvC/rqLkLGhBoPgzPO22GShxsKXlgCWdhyJGRHlPEcGb7ybZPnTL/1Zc0Siurcaz2nZuI
	yfxmtTRQRO1LpsBufZj7nubwpw5h8y9JZSDmIjVnlqitNDoy6/84+DZEZdUkbg5X/RewjQeeE9y
	xoQfRPNyOvA9FNV2JrXTVwSHErh5Aeou/LG6w5JQPDxF7N/4MWr0yneqU/O0WOXJj4MXQEDYo7K
	7m8RvA7k7qRh7cYbjtEmLtTILdSexWEtjx/OQ2yJsybh+dz9S/6LCsx0Bs9UfNhzd5KiYpdNfTa
	5T1A==
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr12579499a91.11.1793771937704;
        Tue, 03 Nov 2026 21:58:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 2/8] MIPS: ath79: move the bootstrap reference clock to setup
Date: Tue,  3 Nov 2026 21:58:46 -0800
Message-ID: <20261104055852.152340-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qca,ath79-pll binding requires the reference clock as an input, and a
rate in the device tree already took precedence over the 25/40 MHz that
the clock code read from the bootstrap pins. Many AR933x boards leave the
rate out, though, and rely on the pins.

Read the pins in plat_time_init() instead, and register the reference
clock from them only when the device tree gives no rate. The clock code
then takes the DT clock or this one through the clk API and no longer
needs ath79_reset_base. When the device tree does give a rate, warn if
it disagrees with the pins: a wrong rate leaves the CPU, DDR and AHB rates
off, the UART baud rate included.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 71 ++++++++-------------------------
 arch/mips/ath79/setup.c | 87 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 54 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 8c5eaa4ab6e0..85f747cf37a8 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,9 +25,6 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-#define AR71XX_BASE_FREQ	40000000
-#define AR724X_BASE_FREQ	40000000
-
 static struct clk *clks[ATH79_CLK_END];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
@@ -78,16 +75,12 @@ static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
 	return clk;
 }
 
-static unsigned long __init ath79_setup_ref_clk(unsigned long rate)
+static unsigned long __init ath79_get_ref_rate(void)
 {
-	struct clk *clk = clks[ATH79_CLK_REF];
-
-	if (clk)
-		rate = clk_get_rate(clk);
-	else
-		clk = ath79_set_clk(ATH79_CLK_REF, rate);
+	if (!clks[ATH79_CLK_REF])
+		panic("ath79: no reference clock");
 
-	return rate;
+	return clk_get_rate(clks[ATH79_CLK_REF]);
 }
 
 static void __init ar71xx_clocks_init(void __iomem *pll_base)
@@ -100,7 +93,7 @@ static void __init ar71xx_clocks_init(void __iomem *pll_base)
 	u32 freq;
 	u32 div;
 
-	ref_rate = ath79_setup_ref_clk(AR71XX_BASE_FREQ);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + AR71XX_PLL_REG_CPU_CONFIG);
 
@@ -126,7 +119,7 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	u32 mult, div, ddr_div, ahb_div;
 	u32 pll;
 
-	ath79_setup_ref_clk(AR71XX_BASE_FREQ);
+	ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
 
@@ -143,7 +136,6 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 
 static void __init ar933x_clocks_init(void __iomem *pll_base)
 {
-	unsigned long ref_rate;
 	u32 clock_ctrl;
 	u32 ref_div;
 	u32 ninit_mul;
@@ -152,15 +144,8 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 	u32 cpu_div;
 	u32 ddr_div;
 	u32 ahb_div;
-	u32 t;
 
-	t = ath79_reset_rr(AR933X_RESET_REG_BOOTSTRAP);
-	if (t & AR933X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = (40 * 1000 * 1000);
-	else
-		ref_rate = (25 * 1000 * 1000);
-
-	ath79_setup_ref_clk(ref_rate);
+	ath79_get_ref_rate();
 
 	clock_ctrl = __raw_readl(pll_base + AR933X_PLL_CLOCK_CTRL_REG);
 	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
@@ -237,18 +222,11 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, nfrac, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
 	void __iomem *dpll_base;
 
 	dpll_base = ioremap(AR934X_SRIF_BASE, AR934X_SRIF_SIZE);
 
-	bootstrap = ath79_reset_rr(AR934X_RESET_REG_BOOTSTRAP);
-	if (bootstrap & AR934X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
-
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
@@ -355,15 +333,8 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
-
-	bootstrap = ath79_reset_rr(QCA953X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA953X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
 
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
@@ -438,15 +409,8 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
 
-	bootstrap = ath79_reset_rr(QCA955X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA955X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
-
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
@@ -521,15 +485,8 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, hfrac, lfrac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
-
-	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
 
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
@@ -610,7 +567,13 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	struct clk *ref_clk;
 	void __iomem *pll_base;
 
+	/*
+	 * The board's crystal. Without a rate in the device tree, the arch
+	 * code registers it from the bootstrap pins.
+	 */
 	ref_clk = of_clk_get(np, 0);
+	if (IS_ERR(ref_clk))
+		ref_clk = clk_get_sys(NULL, "ref");
 	if (!IS_ERR(ref_clk))
 		clks[ATH79_CLK_REF] = ref_clk;
 
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index d9e1cc77ad04..dff0fbe07b04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -15,6 +15,9 @@
 #include <linux/memblock.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/of.h>
 #include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/irqchip.h>
@@ -235,6 +238,89 @@ void __init plat_mem_setup(void)
 	pm_power_off = ath79_halt;
 }
 
+static const struct of_device_id ath79_pll_ids[] __initconst = {
+	{ .compatible = "qca,ar7100-pll" },
+	{ .compatible = "qca,ar7240-pll" },
+	{ .compatible = "qca,ar9130-pll" },
+	{ .compatible = "qca,ar9330-pll" },
+	{ .compatible = "qca,ar9340-pll" },
+	{ .compatible = "qca,qca9530-pll" },
+	{ .compatible = "qca,qca9550-pll" },
+	{ .compatible = "qca,qca9560-pll" },
+	{ /* sentinel */ }
+};
+
+/* the crystal that the bootstrap pins select */
+static unsigned long __init ath79_bootstrap_ref_rate(bool *strapped)
+{
+	unsigned int reg;
+	u32 bit;
+
+	*strapped = true;
+	if (soc_is_ar933x()) {
+		reg = AR933X_RESET_REG_BOOTSTRAP;
+		bit = AR933X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_ar934x()) {
+		reg = AR934X_RESET_REG_BOOTSTRAP;
+		bit = AR934X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca953x()) {
+		reg = QCA953X_RESET_REG_BOOTSTRAP;
+		bit = QCA953X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca955x()) {
+		reg = QCA955X_RESET_REG_BOOTSTRAP;
+		bit = QCA955X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca956x() || soc_is_tp9343()) {
+		reg = QCA956X_RESET_REG_BOOTSTRAP;
+		bit = QCA956X_BOOTSTRAP_REF_CLK_40;
+	} else {
+		/* no bootstrap pin for the crystal on AR71xx, AR724x, AR913x */
+		*strapped = false;
+		return 40000000;
+	}
+
+	return (ath79_reset_rr(reg) & bit) ? 40000000 : 25000000;
+}
+
+/*
+ * The clock code takes the reference clock from the device tree. Many
+ * AR933x boards leave its rate out and rely on the bootstrap pins, so
+ * register it from those for them. Otherwise warn if the device tree
+ * disagrees with the pins, as a wrong rate leaves every derived clock off,
+ * the UART baud rate included.
+ */
+static void __init ath79_setup_ref_clk(void)
+{
+	struct device_node *np, *ref_np;
+	unsigned long rate, strap_rate;
+	struct clk *clk;
+	bool strapped;
+	u32 dt_rate;
+
+	strap_rate = ath79_bootstrap_ref_rate(&strapped);
+
+	np = of_find_matching_node(NULL, ath79_pll_ids);
+	ref_np = np ? of_parse_phandle(np, "clocks", 0) : NULL;
+	of_node_put(np);
+
+	if (ref_np && !of_property_read_u32(ref_np, "clock-frequency", &dt_rate)) {
+		of_node_put(ref_np);
+		rate = dt_rate;
+		if (strapped && rate != strap_rate)
+			pr_warn("ath79: reference clock is %lu Hz in the device tree, but the bootstrap pins select %lu Hz\n",
+				rate, strap_rate);
+		return;
+	}
+	of_node_put(ref_np);
+
+	clk = clk_register_fixed_rate(NULL, "ref", NULL, 0, strap_rate);
+	if (IS_ERR(clk)) {
+		pr_err("ath79: failed to register the reference clock\n");
+		return;
+	}
+
+	clk_register_clkdev(clk, "ref", NULL);
+}
+
 void __init plat_time_init(void)
 {
 	struct device_node *np;
@@ -254,6 +340,7 @@ void __init plat_time_init(void)
 		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
 	}
 
+	ath79_setup_ref_clk();
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

