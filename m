Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699757;
	b=d3OidT5lt+b0PjyMlq97gr6gqTqYuRe4cGREHzaXgrlXOqutiC5hWsAkYxuD90Vb8n6R
	 N7FcAHq5lXA1JQdDELYnbFr89QRZB7A80mkxbqpgIV/Nt6d6ttC4j+YwwfVKwV99Xrip3
	 nhwe+5f7ADmYleqj7JpijbMh+IfBlj6SJpt+juhux24Bgr01dh2y6WX67aQqixtz82NvW
	 RaksBwMS8ADOKKAJCWob9RQlUCyRIUMx4nFAbN7F1XLpzU4Czeu20covJ/Epd5s6N9SU9
	 QZUTmlM64LxTvjgTEaWEn1NcM+KrniBo4A2DgmcwTVl/ki6DC2p/UKAtcoj49Bv85kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U4Wp3uhTvjCynmWCLS5Rd8vTJ5kiOQZe2vBJ9RpJPeo=;
	b=o6FzWF/5HOVM2xlpHlLZ45hJZ8FHeiG6z6hufN/N0c8yI398JkwI5fM8+WNUDcvJyMGc
	 QrUv0TekCSvIilvC4PV2BwoW7vfyF89Fe2fJsttlfaS8S74WWm+zbRqX4K9iSvyP7emAI
	 NteGtuwhNmri+R6KdgiETilZRp97BwZc8PvSzPIYr/0IMbpprmuHuMMUQkcMzSn6Scf59
	 KTRPtvtrM02lEKTbb01xVy/eFuMbqDZcKjuqeDiN9ntmbV8wPxC9RjJetWPZd5c6Ear1q
	 id1Y9woiHq6PoEe3NqOWXZcg54ol4lS7SdjERoRLvdd8D6rNGv7gBCcf/51boGHIrmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6A9sHpO;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBE606A894
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DBE606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6A9sHpO
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1091978a91.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699756; x=1795304556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4Wp3uhTvjCynmWCLS5Rd8vTJ5kiOQZe2vBJ9RpJPeo=;
        b=k6A9sHpOYyI+6ZIQK4KbT+tLovLlf53HzeyjQQmZSjRuXZjeS5Py/nbcAkkJWw71/T
         PWqsBLGHAu55ZITm14h0RGGL3hQTbPLvLCq5blZsnHyc3HnjFxYI/c+N30w/SDfs19f8
         eBb2zZJQSmzyFj9cuS4z59b83/cYRK/0mxQ14AlgFbDSB0aIfL/rIdDzOroKdO6w2K9c
         kHl2f0tXLH/NQF5SwGx5xErb5cmQgpwAtC35ijCT/tMU+BWSUTo1VYaFopBfrDmfCxjI
         DWDtghVaycfC87jy1a6SH3ZFaY5BYPbYyZESw8tfze3kdYZKAXbY5UDgglzTHUWaFSzd
         lPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699756; x=1795304556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4Wp3uhTvjCynmWCLS5Rd8vTJ5kiOQZe2vBJ9RpJPeo=;
        b=UGUit0hv6pbPePjCLIrznKnFxfrsPZDNWzvbLmxLhAhnO3OFO2a5sfycdmJo2Do0R2
         5jL6LqxT0CcyyBYedNfIhZi1Rpw9UWQruvNKg4o3Xsc2s0mTKEOINQg4EDw0M6Wwz5U4
         zmruTYUIPFK5e8jQnXv74oJHnna+JTCg288yiJP/TbZuhrbuzGR3/6ONIonBr3awSS7T
         zn2kEuXM28aRWDvU91skt42YMGZPjVYOL/wawsY/c1AtGnOOVR/DoDN7XKviwFt6S8U5
         NmDfUMlZQjXyTOD9aNEYYcaHiKO7tGIA0i8eLBFZeQFrqs31GH2xXXJXlDAUTDZoil/m
         YMQg==
X-Forwarded-Encrypted: i=1; AL+hErFzGRks5MRJMiJPXNYVX6wujBoUTxyPEICU2nJeJgJQau7XzETOWXQsA7BHfXFAIxxNVw3VobyGQvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gXC7Pg6QyI7zOCtBejIANqXIcjo0q/PueOMJi03zIgwQq+XwK
	LvuTHns8owcpLqXO8/q+RwkOvFF/hexfRidkKg24wDyYPPQmhCQ9cnhH
X-Gm-Gg: AYBFou1h0DBAtRenNjIJIBn2PAD6/y/wLdsqxs4bI1Pmi9K83+DD8bRcBh1dtOcR4fO
	lnLfIb/F+/K6f769W1Tu8zdf9Icv762/TjILQloXt3IZDotGrrafLWj/JNIyZVMX0eF6d0v4NXs
	w7E5/DVP9k9tEYaycT2r3ne3Drpc7zuQFgxuFcCYfigkzKEK9Z40f88k+Fzjf9LY+BCA46pKccH
	M+wXxBBeOQ7JmrSeTYFJaa5CoOzEWvZ+alCAJgmhREdH5L+8qHKjJSO38vajjxtMWeeOgaCT6KM
	mXgatqoTETZ4BFD0sKGsHMkHkz9ZnRRsXCk8kMSJGz1lEkcsEeunrQFv8TEbnnpG3lM/xJ00nku
	kh5LnAYNIWiDg0rQGDJ9GFHYtxkFnh6BRVAUWVDFXWVpZg3xXyqEr5nsvNr9w2VUSgyc4IWDbMY
	EohM3e1pzfQ8o8E2hMlKVYUeEl1+R20LLEj7YkKHr4XUYgiD7lKjpqU/x1YN7zgpfolK3ajr+tT
	xTKmMyztXg3/a7wZg/BpJ1DMuby3/3gbRGLD2r4qAqBM4oujnYz0uH6tJ9xUKMno928WhzZoJdB
	bS1wXlmV/tJtR1W7unK/aqajDRUZ45Dia6gEucZSLGyiXhmKK2FObiEGnrx0PZs7uel7hPv9IFS
	xFKy6ZX0fU+w1HKOgzegXYYiIh/xC07dNmBCTkDvr3C1t5tJ/eoEEgqIl+nXlQ6oW2ITnaLm67a
	7RsjSVD71LLM+UeGGlwSmQYbmq
X-Received: by 2002:a17:90b:2b87:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b1b07e9026mr5652010a91.6.1794699756210;
        Sat, 14 Nov 2026 15:42:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/7] MIPS: ath79: move the bootstrap reference clock to setup
Date: Sat, 14 Nov 2026 15:42:17 -0800
Message-ID: <20261114234222.88337-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

Read the pins in plat_time_init() instead. When the device tree gives
no rate, so that the fixed-clock driver can't register the clock, register
it from the pins as the provider of the reference clock node. The clock
code then takes it from the device tree, like every other consumer of the
node, such as the AR933x UART, and no longer needs ath79_reset_base.

When the device tree does give a rate, warn if it disagrees with the
pins: a wrong rate leaves the CPU, DDR and AHB rates off, the UART baud
rate included.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 65 +++++-----------------------
 arch/mips/ath79/setup.c | 94 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+), 54 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 8c5eaa4ab6e0..6a8bef782186 100644
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
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index d9e1cc77ad04..d06e8cc378bc 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -15,6 +15,8 @@
 #include <linux/memblock.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
 #include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/irqchip.h>
@@ -235,6 +237,97 @@ void __init plat_mem_setup(void)
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
+ * register it from those for them, as the provider of the DT node so that
+ * its other consumers find it too. Otherwise warn if the device tree
+ * disagrees with the pins, as a wrong rate leaves every derived clock off,
+ * the UART baud rate included.
+ */
+static void __init ath79_setup_ref_clk(void)
+{
+	struct device_node *np, *ref_np;
+	unsigned long strap_rate;
+	struct clk_hw *hw;
+	bool strapped;
+	u32 dt_rate;
+	int ret;
+
+	strap_rate = ath79_bootstrap_ref_rate(&strapped);
+
+	np = of_find_matching_node(NULL, ath79_pll_ids);
+	ref_np = np ? of_parse_phandle(np, "clocks", 0) : NULL;
+	of_node_put(np);
+	if (!ref_np)
+		return;
+
+	if (!of_property_read_u32(ref_np, "clock-frequency", &dt_rate)) {
+		if (strapped && dt_rate != strap_rate)
+			pr_warn("ath79: reference clock is %u Hz in the device tree, but the bootstrap pins select %lu Hz\n",
+				dt_rate, strap_rate);
+		goto out_put;
+	}
+
+	hw = clk_hw_register_fixed_rate(NULL, "ref", NULL, 0, strap_rate);
+	if (IS_ERR(hw)) {
+		pr_err("ath79: failed to register the reference clock\n");
+		goto out_put;
+	}
+
+	ret = of_clk_add_hw_provider(ref_np, of_clk_hw_simple_get, hw);
+	if (ret) {
+		pr_err("ath79: failed to add the reference clock provider\n");
+		clk_hw_unregister_fixed_rate(hw);
+	}
+
+out_put:
+	of_node_put(ref_np);
+}
+
 void __init plat_time_init(void)
 {
 	struct device_node *np;
@@ -254,6 +347,7 @@ void __init plat_time_init(void)
 		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
 	}
 
+	ath79_setup_ref_clk();
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.1

