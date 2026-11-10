Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274615;
	b=myxc5679Pv8jmFZNfbJLQPsIFU6iNy8HgwczjrRk9Sp0JkRqVXPY/3UWutf0ZyleCh1Q
	 LjMihO8r13qUieCWJ+YEqX3rVmhhTHhA+TQVV3K9cyyhTNnnilrWrb3lPASTqm/wvcmA1
	 QogiP9cQr26PZi12nGhVfmFxIb7Tjmiz7Pbacn3xNpEbzKKzkYyGY4Wz4A9rphXjjdZOB
	 vU5WoQHIQ3AVPwpsGcfnRQEtCuRkA1dcpAPxMEjt//NimLh2NIrUjzhae72QuTwc4j7se
	 btWMmHayqJVeUYZmqa2G6V0hNMKQ+ylFkUa86mc2ZudsSW2m0dEUgR5DGyVjkhfvCJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
	b=oNH4tPcxrtp52v+5jc71NJQjU9OAyF7gfYTWX577JkSwA6W0svxCFBR0XtAzCU9EGBgt
	 /IG3YhiU2UBI2ipH85tgxkudmhLWXSEPXK58cOUftasU7B873CxeY3IyW7IbPWLmpVtkw
	 yGjrRTRcvhb53xxjP9lNVwiwU9oCLSNo623htnYygCN+dDM04ytrvjdvnXM0Wlet4eaHL
	 auBe+zocq6zyQHmjDKNi3RqoS1zvP+MvyTrByWLVpA5JOTrcVf1QHCvRoBIE8LJoCkzpl
	 /uKY5hv+rWvMbttFwOo33dX/jpVJgjScq6u2ANuzMUrNCS6uMsnxnbOqsl+Nk1inWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8Dw0DPZ;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA06606A335
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA06606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8Dw0DPZ
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1414df17so6063725ad.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 17:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274615; x=1794879415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
        b=C8Dw0DPZw/D0v7XEqqXB7SxWL2SoUg/if0sdLFNK3BY4qVTym93pOZcfWAcruPNAmT
         iNEh3omOWPxSCjld0CCOm7qXyyaaggEK2ywoVNYu5b9GKZ3KOZY85H+lTrbtc3K7ckns
         MRgvxnx/QsX5JNwZ4wPbewvWyVyZg5uWV2lzp+wJ+J//5bxjedaYpRQ+JS6Hbb/7yw2G
         yNIPQP/ln+6IOB1W6YCv2tySqrqkUEiuCJtibwsK7VhE5KaL63wPwH0dGIkFb37tCoGz
         MieLqCuTr8Ah9MBrVk8/bC+swUUN06bRLJeIBhkYia6GIE7Pv70uv2Zp8+qAb0dnSENC
         AnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274615; x=1794879415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Vc/bhluZnpjMuyXWR7b/9sm8tAC+F5WUkwsk/fKBWU=;
        b=tJjmYEwEmloK9WOfw5Z2f36DWH3k5qRCuLjU661s5Bz+HrXoJh1qSh3nmpUID8HRoS
         MXidGwlQ5qJwMtGkG+MlQfxWwmUkV3fQ24imYLt4aO6bo/qeg+rHwXxLWxsGj3n6pxbB
         X99W9/sA/rJVOh4Iprpx1n9ZqnoDspXI0gaUz3AQeWGcJSR2EHwZ4wpDUM0fsXMFvB0c
         1R+OF2lvaJf1KS6xApj6leXIZxpNk+0BZ72wCNh00DYglyo2AVSjmiIuVwaXDTBC3Odt
         T5tTgC2YGbiQVfc1tt+SrfglH/Q27It4z9DHMsyngp317PBqehcyuFFD5cc7QX1DooRI
         nCOQ==
X-Forwarded-Encrypted: i=1; AL+hErFObDZEyR29JAt+KFCpgBeOCCCiyrVBb/KhNNqrFzzQiu3b2YSt2OVec/96FFNP1mjxxE7oKsVrxRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SzoBip3ziRH1D1pVTBtonzNwBHLZv9+7hR/SYWht2JQ7RnEyP
	S2Hyac+z1tAD1Zw/CNfTbQ5EcThc503O6rERYEMULBHaJw+GDswZW1ro
X-Gm-Gg: AYBFou1Zb0HHDcLEmYERVSA9mo3+4WCWm+IY5DEIdSLiwmREqwsei3P9HQJIHQycU3S
	IU2k+PUr32I54GGkuEccjlhCXryB+mVlOzJnQZ74AYJ5BLwpRYhQtNW8n0tzmF7ex42/6T+q+DP
	Akev5oB1YexcOYlSyVlRisQkaD2iQQUcaXMNaWZTEzIqp8umXui1EffnuppTow6StM8IKuPxFpS
	2UMummey0uuCXYHc6EPY9j+QuONK+TeVNlomNsp4o3EwYnQ09d3bL8Yd8+SwGZSJyFqWHCqYdjv
	KP7Xg/2yjc3yqbXfTZ58YlxIlBEu+y6rAONETZPvcvOvZNN5YKqjSD4mati8uC4JttTRqzIbg2o
	VZFKaN9sKBdRkMZ8rLyYeaEFsDTnhkxFDcKJ06FNuBfkLwfmJe517HbhyxyHpPI11d3EAi4PIKl
	cMASdVa7/wwri4MrLBuopsxIlP/AdGKd5TbbTe5vO2SPdQGHqK6MkZU/KzRwF/O/a2gPgzy6bxa
	GbRfX6chY/dOl9vlUHq1je1A1bG8EkhwT5BTJaXeT12mJDez3qbkBBotc3kFOj4f9t7AejzHU+C
	xdmDa6j49Dzatd8JCybxSrc7vLDDKt1nEGQuTh69YfRU6WUXlPbbymDqDsaaIQv+BCGnWMfswlD
	+fIAT8ysUYNbe94kMgBDUciQ6j8iS+InnjCdw7KsAabFZKbxadKynbDnPXrSBOBvTEd1U6yzrU5
	pqtA==
X-Received: by 2002:a17:902:e544:b0:2e8:295c:f03d with SMTP id d9443c01a7336-2edb92348f5mr9974495ad.58.1794274614447;
        Mon, 09 Nov 2026 17:36:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:53 -0800 (PST)
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
Subject: [PATCH v2 2/6] MIPS: ath79: move the bootstrap reference clock to setup
Date: Mon,  9 Nov 2026 17:36:42 -0800
Message-ID: <20261110013646.1582970-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

