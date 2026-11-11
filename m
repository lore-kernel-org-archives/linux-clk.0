Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434261;
	b=RvNk3z5EN8lPHNh4Zqzv38WquM/XPOStj2KP9Sd9BfuAQHyL9RvZzV7c8iWuysFZTGTD
	 GLe5u5kQF3Re/8PgqeqLwN8O6IatzM2KN+CsuMJp/82xK92CRJ/ADcEOZB9iqxhxg22HJ
	 5Wq1Ke5V9D0AKQTO3TgJF0q5W1qV1mIq+sOZpNIg/3XD4iW5EUY5fTdOwQuzU9qEqYKBB
	 4ZikQs69SU4byVgBK90QbvCS6Cj8Oce1b4dF2BCZnaOlnjbjz+YvfUIFlWcwbvah8UPNL
	 7P8iH7mlQrJ/ze0JWVyQNSDYmbAe7cOUdGG5EBRz726n8/XxJq1p6NZY/PZ9sJ7XRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
	b=dmSOy17oEKyVd1MldWjqCSV72N8S11lJw4IkMZeHT5iOl84fzkGQcVGVUw56VBGxJDua
	 OnFv7FNjpsXZcfwSFE7wxXArH2cbfP28vZmAcBUBos6fpvqaXe3f2nrpNy3FlU8UkWtjn
	 8rMzzilYacvKvStOtlKTSzy/TllQDtDr8bRAGb6WmEl4aivVxVUf/4qhV2w7KQ9NrWSeq
	 7T7x76bF40iAK4vywm6/uAPwi6jfD/B9QCuLMthkxY1+fuGIJh2L8imHBxfihwkC/V3FN
	 AFHPml/5MEPmqNzDwNwJX//XEP+tjG7OI6r0GRkL0zHBKrSb6/z0zXKQAXNxcers4pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jIvB/fdN";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13967606A8BB
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13967606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jIvB/fdN
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1452437a12.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434260; x=1795039060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
        b=jIvB/fdNBR4OQV69zpGUacx0rezvsVdwS89SlNQSgSOqYSVDiXWZBUgkhwv+G5BWpo
         ZKcxhvyWWML2tg6Zin0RQJyLPFMHCnswgFlGKHghG5RDaaXTfdFI/YvAJ48d4VyrmBiL
         pMw9HnYicpVpJJ+VJJnJs4fXhgFGgwOzhh1v9koNAL2tBWSP8MDozLpOj3tO+5Xvtvoz
         hr+LZfA8SfhrSa5RPxLpBraPtkDEndCCilnrTCgVqNG9aLWOUzfXDzWN11fkM+2EQiDG
         bxLEMVbgJsXCO7IuL3Wcm5dkjFXSuHGZbVW+fFjEin5rw53lLSfN03JyEaTac55ON6nX
         iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434260; x=1795039060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
        b=a/DGEid+pxzxopyXEy8RcvxJjwQ5Z8h9YhlcXzq3IFz/8HeXUImX94EPco8IdBhs9R
         72tpuMJHrh0dKZH1LUvPdOlBWqsbah6yOJO8c+OWekeFcX+DOUxzYCvHMJ+1SjCs2wK2
         jIYnAG2F2oCIMrNS6OfVHXCBWUAvC+OxnqK5yfCEiFvoOSTY0+o0qRE5y2Rn1g+D1u3D
         8UuDn+huZrRSjsyXTT0nZNaUZuu+EmxGBgAFPJK+Rp5E7UfbO462rLrN5RGXSvXKqSH/
         AZTvuMwRWsI9/fb7N/43tI9wX1ZT6xMTTqAHEWVPeSmuwHD4exe/q8lxm4VtvsEIdGEB
         fspw==
X-Forwarded-Encrypted: i=1; AL+hErFMEUShMeIC+f9JX5d/BKm2R7QrBV2cGJ+VKIDEtnBjzs50dD5BLokOZqvmDTs0/C4HsAJRr56mYdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4qvfBY0XvsTgUKMITvmLSAkyRUM+8fCxw23q9mGAPfQfpo6CP
	gA8qWuOEAfjg+rou+9fYDjNQQ2viXUsddpGZWW0Zm9rVywGkaxHQTV+8
X-Gm-Gg: AYBFou2MeL4sObbHuGjwt51Lh6QfCqJeWcNmGg2QrD0k/rvx1j48hnc0wSEru4YGbTM
	rxKUhbcBwvEc93t5nSgWD3vewv5US1X6WcPtSycgEQEhhzvJAvc/NegCNvurSojZclB75Xtc+ua
	mHGRwqBsybPEHb0cq51lxKKNC+TZ5d65wDdKDnp6WohEA0ProuFTuYmJKPnZVXQVq/4Jm/qx/cc
	O5yCXtbWe5BD311YL10maQT6lSfUBJGbBE7BD2sBGYU8BRqNkEd+TT5OHJfJcv8VJ4wQg0oUBpw
	Lb0KdLjjOOWka19AcReFtuW6jcAQ1jh4lipTNwxo/OYzktNxEZnuR26jBxcM5xeecVWMLRgZW+1
	gaP/bcoi84aiAgN6zXkSq1NT4bas3xXlHYUQE+rwrTOU9uCo+dyqz+7W5k3s5ROHust4YJZAPzn
	TUwoMpblX1EHwLPpBXWDhndXqFjSgEf+WWv+RDLnyfzstZu7/R57SOxiVNaV3cpYQiiLO0hJQ6Z
	UY3X/EAL9QYaj8LUqPjvIYl0pqX1/Vo6z6ujvEpjeIO7iCLR/u2qkS0l1WtNEubOsgqWL98rcKL
	dOltn6WUWwi8JPzCJkKrQmHfsaV+VahL/mytIXWNVABqYaaJDTBfRXNmLXOlcoX0HlXeSxr22KO
	BaW/Wf4bLa/wSnUq+R6lOAsdpLLwvVGqJ48JA6G/F+q5HLnpe9S+W6ibWK0sCaSdipR0eiOlubZ
	+EWK/JGd3Y1WnefHTybaXMSa0=
X-Received: by 2002:a17:90b:2688:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b182dea8bcmr3780486a91.3.1794434260372;
        Wed, 11 Nov 2026 13:57:40 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
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
Subject: [PATCH v3 2/7] MIPS: ath79: move the bootstrap reference clock to setup
Date: Wed, 11 Nov 2026 13:57:24 -0800
Message-ID: <20261111215729.10683-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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
2.56.0

