Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771944;
	b=Z2WfNem0O4bgfRsshJ1ZbDJ4FcnBIMLp5GDNUaQX9M4X+sv8P/pux7mc6cRxsRW5ypQ7
	 daQWuzQBBJFNw+At2IMYw8kCJ6s9twh5x3UWhSxtPIgcZFQukeNiuccsPgW6kOEenFE/t
	 O+qQfSCP0shl7CHppviOQcT0HDEh5Gut/OVLT0+iVkWnJ8m/232cs8iArBxvd5oZfzR9I
	 d912PiDUNrRlsT4Gow86Epxe+lSHsY3LgP4nqhqeT3hZ5D94O8gzIfveIOKk9xhoOYI3d
	 44Eohqj8gQN7rgTNFXUAIu1cZIzh0TvczjXSj7IgtihhBYvmxorLAyyOq2tTQDPTeNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fNRBMXlwk24Mzn8KVn0Oxp5G6ZbP4CwDZWXVYAn6nrA=;
	b=BCId7Wp95ry0348ed7RMYRIIqi1IKOJfRsNhRb0RB81aBQAPzvcDyT6SyKt6mRC3Q4oL
	 dm+wxOO37pFrr8IBgMfJdhi2n3s77c8uaAHqJwd3Efpfs0OYn1ZLzx+tGrKFW1KWPltIg
	 zFsnl0wplhbcYp29sia2DtXip1vyj0tYwmSy6YOuXcH4gxlbrwythVqVmcaKShauhlDCl
	 bfF01bwhqzcl3WNyVyjGtwKFxQTzOnDROSURtuvok7/CbcAm+Av/9ZGZcMI4jrZjxacRe
	 m5DLAHg/M+2/dt5eI7BH0JJpauZCS1h/sXcrBBRyC7VBDbrgj7oykupJwyo3XZeYwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdLCIU8f;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C3D606A326
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdLCIU8f
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso145485a12.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771944; x=1794376744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNRBMXlwk24Mzn8KVn0Oxp5G6ZbP4CwDZWXVYAn6nrA=;
        b=XdLCIU8fV/iP0dCJXCO1Q+aZDYdl34O/vFr9tx9DeYsYjzFz+F9IW2w3eqi+LsLGSi
         hS/0eUzkySFE984JSvQyklttpnyb/l4hGVnYn+ANOZLOVq65Ok+FEJ8Y+3sWg+0wxm7A
         uSNJz4W00EALvSo630aMGXVn2OdfGzvmdtDVjsI69s3bEAQUJNvAf3o3r4TC+rDLQxi+
         cqkhq/2R6N3mfXsL17H96X8PVn3Ejd3nOURNmmYHvZY00EFmg3WjfC8/tAh7GB++coKE
         iVXQkSIHSv8vvKfTe0g9/gqE8KkEB9FXnUj4ZNChsifysg1NvM7ZT2XgM85f56wGBdv0
         IIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771944; x=1794376744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fNRBMXlwk24Mzn8KVn0Oxp5G6ZbP4CwDZWXVYAn6nrA=;
        b=DlFZ9TMYa73D89DY35tYQzzxUNwFZ02lk2sy58WKMnSSJr4tSL6Cz69ItIn/TYYt3O
         4iRCTcqbKEn/3f9U1TAuLuzB0PLlwBsyGnM5qIceYBbVGGmqXQCKE86QNZ/TcpZwOcbd
         +9RB9BthGzN9NDJdUpzdATmumI+f7gTtx4qjQt9t48etMFohZY5mSb+Eqr+/qG2IsN0M
         27fSeXs3lWdt/37j/oYVrVmzVZgkoBWja5sNjRRULTzGlgE+uUkZMLkI8w9ZrN/60CO8
         OToW9BRxmftNEKqlQ8AXlF6UtXfjsG3cs53feNpQtZAhxsLoJpwJQdw62WtxbazPyLmJ
         xwCg==
X-Forwarded-Encrypted: i=1; AKwUvBylKTPF6rWK6aFcQU2l0sriAsWAcd7JzD816UWUgoxtg9v9wfkZg3sjAw8L0NFDfMsZV9bkfiniSnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88pT0aDpg2ZJMzrd9uxpHzlHtw7uA/TYfZNaVy/HPhiKh0ITlD
	KufUCLREcijpwSeAsRHyok7oK3HHwm5cc00LcmOS0AigaBtf02Hy6gsp1CJjxg==
X-Gm-Gg: AYBFou2AKvg9kgHcOI2ckazFnnFMN5KHsq/0rB+8+ZnxX0HFJc+4pE34GUab99wk+3z
	hOmk5ww9S6ZWfu9w2tFMCLnofSk7jzqxrCDCGxLq15rqe0UynDiwWDBuUbgQmA9EpelyGLenwlf
	m+QpnbQZrAxKKKm9ZZCZii47mjcF1gV+bJNS3BDVl4f1m3LPMUWo79TL5MBazEXsc4kG6F7LDJR
	0+6je2A1ayUO1PEfJZaGeXx1djGkLF4YEEEx8mu7w3zZnTUzJoEP1u+7N8DQPiY0cgk5ziUJneV
	q82+phxrVeNzqe5SHwnaZfxCHf+RYTRWJdFq0vh1R1WJ5Jii2v9aRTK4nD3Gm+NgNeHMk8W8B5T
	IcVxyAqzUv3qMzWJLFFtDWdfeCXUVPbU4Wn1KBBI0gRKEtHkrAKbr0r9IPKG6FoMXgfsdXIrBFc
	MaQ8+FnCQ+D/gOhokua6ncIxkymmhbAvM21BQPkqjBvG1tQAlUnsqaE1RGmW3d1tld49W4Y6YUl
	ugNRzK3Iex6ydJnRrZ7uTL0YbekuIy5hPhD1vI1VEYVOfcmtbRIxIfKNYkzqzcEnB4eM1GSmjtd
	ElmYZ620uUaMuw2L5W/jOx/ig4sb++58vk3ROWbwMkzq3qUl0Trv46Nk4fke3fLFGyFw7585xpN
	LeAzAOnv68XI1/xm5Z57VKvY9k8Wzk83CMXtAFS+A3Bn73hjbz79MyyVb6sS850KQpSN8QsnHeH
	TLTw==
X-Received: by 2002:a17:90b:17d1:b0:3b0:9941:8d41 with SMTP id 98e67ed59e1d1-3b09941917emr945274a91.28.1793771943413;
        Tue, 03 Nov 2026 21:59:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:02 -0800 (PST)
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
Subject: [PATCH 6/8] clk: ath79: fix the error handling
Date: Tue,  3 Nov 2026 21:58:50 -0800
Message-ID: <20261104055852.152340-7-rosenp@gmail.com>
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

Report errors instead of crashing, and clean up after them:

- Check the ioremap() of the AR934x SRIF block, which was used without
  a check.
- Without a reference clock, ath79_clocks_init_dt() called clk_put() on
  an error pointer, which warns, and left the stale pointer in the clock
  table. Bail out early instead.
- Return registration errors from the SoC init functions instead of
  panicking, log them, and free the clock data.
- Drop the BUG_ON() on the clock index, which is always a constant.

The PLL registers aren't needed once the rates are known, so unmap them
after the SoC init in all cases, and unmap the SRIF block as soon as the
DPLLs are read. Registering the CPU, DDR and AHB clocks together also
removes some repetition.

If the clocks can't be set up, plat_time_init() still reports that it
can't get the CPU clock.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 179 ++++++++++++++++++++++------------------
 1 file changed, 100 insertions(+), 79 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 3afda29377b5..768c9e410b59 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -35,53 +35,71 @@ static const char * const clk_names[ATH79_CLK_END] = {
 	[ATH79_CLK_MDIO] = "mdio",
 };
 
-static const char * __init ath79_clk_name(int type)
+static int __init ath79_add_clk(int type, struct clk_hw *hw)
 {
-	BUG_ON(type >= ARRAY_SIZE(clk_names) || !clk_names[type]);
-	return clk_names[type];
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[type] = hw;
+	clk_hw_register_clkdev(hw, clk_names[type], NULL);
+	return 0;
 }
 
-static void __init __ath79_set_clk(int type, const char *name,
-				   struct clk_hw *hw)
+static int __init ath79_set_clk(int type, unsigned long rate)
 {
-	if (IS_ERR(hw))
-		panic("failed to allocate %s clock structure", clk_names[type]);
+	return ath79_add_clk(type, clk_hw_register_fixed_rate(NULL,
+					clk_names[type], NULL, 0, rate));
+}
 
-	clk_data->hws[type] = hw;
-	clk_hw_register_clkdev(hw, name, NULL);
+/* a clock derived from the reference clock by a fixed factor */
+static int __init ath79_set_ff_clk(int type, unsigned int mult,
+				   unsigned int div)
+{
+	return ath79_add_clk(type, clk_hw_register_fixed_factor_parent_hw(NULL,
+					clk_names[type],
+					clk_data->hws[ATH79_CLK_REF],
+					0, mult, div));
 }
 
-static void __init ath79_set_clk(int type, unsigned long rate)
+static int __init ath79_set_clks(unsigned long cpu_rate,
+				 unsigned long ddr_rate,
+				 unsigned long ahb_rate)
 {
-	const char *name = ath79_clk_name(type);
-	struct clk_hw *hw;
+	int ret;
+
+	ret = ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
+	if (ret)
+		return ret;
 
-	hw = clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
-	__ath79_set_clk(type, name, hw);
+	ret = ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
+	if (ret)
+		return ret;
+
+	return ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
 }
 
-/* a clock derived from the reference clock by a fixed factor */
-static void __init ath79_set_ff_clk(int type, unsigned int mult,
-				    unsigned int div)
+static int __init ath79_set_ff_clks(unsigned int mult, unsigned int cpu_div,
+				    unsigned int ddr_div, unsigned int ahb_div)
 {
-	const char *name = ath79_clk_name(type);
-	struct clk_hw *hw;
+	int ret;
 
-	hw = clk_hw_register_fixed_factor_parent_hw(NULL, name,
-						    clk_data->hws[ATH79_CLK_REF],
-						    0, mult, div);
-	__ath79_set_clk(type, name, hw);
+	ret = ath79_set_ff_clk(ATH79_CLK_CPU, mult, cpu_div);
+	if (ret)
+		return ret;
+
+	ret = ath79_set_ff_clk(ATH79_CLK_DDR, mult, ddr_div);
+	if (ret)
+		return ret;
+
+	return ath79_set_ff_clk(ATH79_CLK_AHB, mult, ahb_div);
 }
 
 static unsigned long __init ath79_get_ref_rate(void)
 {
-	if (!clk_data->hws[ATH79_CLK_REF])
-		panic("ath79: no reference clock");
-
 	return clk_hw_get_rate(clk_data->hws[ATH79_CLK_REF]);
 }
 
-static void __init ar71xx_clocks_init(void __iomem *pll_base)
+static int __init ar71xx_clocks_init(void __iomem *pll_base)
 {
 	unsigned long ref_rate;
 	unsigned long cpu_rate;
@@ -107,18 +125,14 @@ static void __init ar71xx_clocks_init(void __iomem *pll_base)
 	div = (FIELD_GET(AR71XX_AHB_DIV, pll) + 1) * 2;
 	ahb_rate = cpu_rate / div;
 
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
+	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init ar724x_clocks_init(void __iomem *pll_base)
+static int __init ar724x_clocks_init(void __iomem *pll_base)
 {
 	u32 mult, div, ddr_div, ahb_div;
 	u32 pll;
 
-	ath79_get_ref_rate();
-
 	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
 
 	mult = FIELD_GET(AR724X_PLL_FB, pll);
@@ -127,12 +141,10 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	ddr_div = FIELD_GET(AR724X_DDR_DIV, pll) + 1;
 	ahb_div = (FIELD_GET(AR724X_AHB_DIV, pll) + 1) * 2;
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, mult, div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, mult, div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, mult, div * ahb_div);
+	return ath79_set_ff_clks(mult, div, div * ddr_div, div * ahb_div);
 }
 
-static void __init ar933x_clocks_init(void __iomem *pll_base)
+static int __init ar933x_clocks_init(void __iomem *pll_base)
 {
 	u32 clock_ctrl;
 	u32 ref_div;
@@ -143,8 +155,6 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 	u32 ddr_div;
 	u32 ahb_div;
 
-	ath79_get_ref_rate();
-
 	clock_ctrl = __raw_readl(pll_base + AR933X_PLL_CLOCK_CTRL_REG);
 	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
 		ref_div = 1;
@@ -174,12 +184,9 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 		ahb_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_AHB_DIV, clock_ctrl) + 1;
 	}
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, ninit_mul,
-			 ref_div * out_div * cpu_div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, ninit_mul,
-			 ref_div * out_div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, ninit_mul,
-			 ref_div * out_div * ahb_div);
+	return ath79_set_ff_clks(ninit_mul, ref_div * out_div * cpu_div,
+				 ref_div * out_div * ddr_div,
+				 ref_div * out_div * ahb_div);
 }
 
 static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
@@ -202,7 +209,7 @@ static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
 	return ret;
 }
 
-static void __init ar934x_clocks_init(void __iomem *pll_base)
+static int __init ar934x_clocks_init(void __iomem *pll_base)
 {
 	unsigned long ref_rate;
 	unsigned long cpu_rate;
@@ -211,8 +218,11 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	u32 pll, out_div, ref_div, nint, nfrac, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
 	void __iomem *dpll_base;
+	int ret;
 
 	dpll_base = ioremap(AR934X_SRIF_BASE, AR934X_SRIF_SIZE);
+	if (!dpll_base)
+		return -ENOMEM;
 
 	ref_rate = ath79_get_ref_rate();
 
@@ -256,6 +266,8 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	ddr_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
 				      nfrac, frac, out_div);
 
+	iounmap(dpll_base);
+
 	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_CPU_DDR_CLK_CTRL_REG);
 
 	postdiv = FIELD_GET(AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV, clk_ctrl);
@@ -285,18 +297,18 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	else
 		ahb_rate = cpu_pll / (postdiv + 1);
 
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
+	ret = ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
+	if (ret)
+		return ret;
 
 	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_SWITCH_CLOCK_CONTROL_REG);
 	if (clk_ctrl & AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL)
-		ath79_set_clk(ATH79_CLK_MDIO, 100 * 1000 * 1000);
+		return ath79_set_clk(ATH79_CLK_MDIO, 100 * 1000 * 1000);
 
-	iounmap(dpll_base);
+	return 0;
 }
 
-static void __init qca953x_clocks_init(void __iomem *pll_base)
+static int __init qca953x_clocks_init(void __iomem *pll_base)
 {
 	unsigned long ref_rate;
 	unsigned long cpu_rate;
@@ -356,12 +368,10 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	else
 		ahb_rate = cpu_pll / (postdiv + 1);
 
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
+	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init qca955x_clocks_init(void __iomem *pll_base)
+static int __init qca955x_clocks_init(void __iomem *pll_base)
 {
 	unsigned long ref_rate;
 	unsigned long cpu_rate;
@@ -421,12 +431,10 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	else
 		ahb_rate = cpu_pll / (postdiv + 1);
 
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
+	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init qca956x_clocks_init(void __iomem *pll_base)
+static int __init qca956x_clocks_init(void __iomem *pll_base)
 {
 	unsigned long ref_rate;
 	unsigned long cpu_rate;
@@ -493,19 +501,18 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	else
 		ahb_rate = cpu_pll / (postdiv + 1);
 
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
+	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
 static void __init ath79_clocks_init_dt(struct device_node *np)
 {
 	struct clk *ref_clk;
 	void __iomem *pll_base;
+	int ret = -ENODEV;
 
 	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
 	if (!clk_data)
-		panic("ath79: can't allocate the clock data");
+		return;
 	clk_data->num = ATH79_CLK_END;
 
 	/*
@@ -515,8 +522,11 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	ref_clk = of_clk_get(np, 0);
 	if (IS_ERR(ref_clk))
 		ref_clk = clk_get_sys(NULL, "ref");
-	if (!IS_ERR(ref_clk))
-		clk_data->hws[ATH79_CLK_REF] = __clk_get_hw(ref_clk);
+	if (IS_ERR(ref_clk)) {
+		pr_err("%pOF: no reference clock\n", np);
+		goto err_free;
+	}
+	clk_data->hws[ATH79_CLK_REF] = __clk_get_hw(ref_clk);
 
 	pll_base = of_iomap(np, 0);
 	if (!pll_base) {
@@ -525,36 +535,47 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	}
 
 	if (of_device_is_compatible(np, "qca,ar7100-pll"))
-		ar71xx_clocks_init(pll_base);
+		ret = ar71xx_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
 		 of_device_is_compatible(np, "qca,ar9130-pll"))
-		ar724x_clocks_init(pll_base);
+		ret = ar724x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
-		ar933x_clocks_init(pll_base);
+		ret = ar933x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
-		ar934x_clocks_init(pll_base);
+		ret = ar934x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
-		qca953x_clocks_init(pll_base);
+		ret = qca953x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
-		qca955x_clocks_init(pll_base);
+		ret = qca955x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
-		qca956x_clocks_init(pll_base);
+		ret = qca956x_clocks_init(pll_base);
+
+	/* the rates are fixed, so the registers aren't needed any more */
+	iounmap(pll_base);
+
+	if (ret) {
+		pr_err("%pOF: failed to register the clocks: %pe\n", np,
+		       ERR_PTR(ret));
+		goto err_clk;
+	}
 
 	if (!clk_data->hws[ATH79_CLK_MDIO])
 		clk_data->hws[ATH79_CLK_MDIO] = clk_data->hws[ATH79_CLK_REF];
 
-	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data)) {
-		pr_err("%pOF: could not register clk provider\n", np);
-		goto err_iounmap;
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		pr_err("%pOF: could not register clk provider: %pe\n", np,
+		       ERR_PTR(ret));
+		goto err_clk;
 	}
 
 	return;
 
-err_iounmap:
-	iounmap(pll_base);
-
 err_clk:
 	clk_put(ref_clk);
+err_free:
+	kfree(clk_data);
+	clk_data = NULL;
 }
 
 CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
-- 
2.56.0

