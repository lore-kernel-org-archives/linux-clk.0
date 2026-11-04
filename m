Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771943;
	b=gbauouUxaZMSO3hD3Zf3CstQfeqFQReX3j5yba3+V4l3vstsyonEIkTbrQ9jA0hy0679
	 vpMegms188cBTHsp7gu8swxHwL0Waj/3qNwRy1ThYEMthZEBblE9EEzcCO7HaCtWVrFsZ
	 o5nOkSmo0PM2DFGkBB6DwN8hkOxtba+AuHNT4X7J+nwJ48GVAVXJtdZl8GtNtVCxRe3NZ
	 cPIlYA5PVpYtpBqzzCYxKh8wK+rG4f27ClUcCC3rNuSy268CrP/2yBlePGh+09LVTLlYh
	 eZikiB6wxXqx2jhvuUfiFK1xGRu3R55dWrzY0VK0LW9dxfOhMBltl2BN5Vi6ZOw3dPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
	b=bXxwZZ/PqZAHOfkbRAAaPV166tbYdbMtWjOHNRY6tREwTuORYqAPuxrgjtQRxMIkC5XK
	 CSKPWoLGpouDzozWylnitRwCLEoafuD1NApGR5fHpHersJlDkjMp7SXaU2dwB91zpEC2a
	 2d8hC3pWSL5s7oIz9oTMFCBbRaH7e6M3iuGh2gs3ZijDIdU3mbBknQs7cslnY59GPX1/9
	 uAFhmNl3vLoalJySnoOHQZJXpk1PknEdoZJ17K8PjqZO+uwL8NPo/6r+jyLwdqC3oc3fV
	 rLnKHXQHEalxO3r3gHbu+2Pai2xNlljzzx4k61f6PwlMUoVaQsqFBGB0G/Qgcopfccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nY/jG0of";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8766606D810
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8766606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nY/jG0of
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso151597a12.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771942; x=1794376742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=nY/jG0ofkyCD+1il5wmdQz3flThCqp/1PJ9uoPnm+rrNhFaGuhZ7VMKKmRVI7H5CNu
         SToDkLAoBW6x3uQ48wd7NW2wfA2gymuDb4xb/NZh4BcLWfk66vHVDEJuK2v3eAdcYlp9
         slWP0FigYoU4hYQ33xrSs0Po8YA3v1hBitEBzNLYUIpQOOWO5l3KWdLGQIHWtrUWxMAu
         pcMiQA2VcLNFutvpvJRuEx9qMhQgPKM3M06JNYyl/O5H+HqvSObBqEqvLAE1uj/ytQoK
         uNtkXjUc64nO5ArQ3ZgdMc5+XB/ON1wx0h21oWWV8Vz5VbTbQ0FBbRZaaaX8DqpEpaGk
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771942; x=1794376742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=wUuHDxzha39YNWNbfvnEn9k4wl8ylv1yxOIf3Vef/ZFIoK1Gsp+FwqMb2bQ8h0v5qI
         ZBYThHH6jz6AJTmFbfDyC6zYwo+WGB4FDc3ml/ktRyeEfI61d9GsJB0OwHHl+pSKY3Jy
         U6klBm1PqideY2Y+W4eaPvg4YhMWZ1S/5dwxLaL4SeKCyk5Of20w80AucvPwu/bvnb65
         Q9xkK6y2yiuxbDUWSYdVyDRJZG+Iq9B3rORMqgMHsCFxSSRg6/lzVoQaicQ9Fg9ldvbA
         23EVe1r++nY1ZVddqi7yLK2bqf/xY0LiQpNe349Gm4vS/I1EwYan+nQRXAGKUToTwvfH
         sXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIhJtQpurv/lPG80km0gNMdJwxqsKPU0s/IAJGxsqIn5a3qXoQYnOY7PrvHEiejqSSRsARmfY5OkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gOROjtNRBvRz7ov8NPmnsf2V3Jn7l5/XJcVot6QdHKakLonAL
	T71olOq/Y9gunUjCanhcEUcHukt29nkR7Jrd+KJtQaLNf63kRTqQeCSu
X-Gm-Gg: AYBFou1ja6zpv4ciqj2NRx+c5TKF+ejop6j1nRbJwF78d6xllsjG02Pt/Hd3tmhFofx
	Q1Cp8K06yrNa+nt+3npKfDPiOBvcleesr4uVNIxzuvcsyaCC3E8AmxrmXpmgVWQavI8rOXhZAyJ
	+Qf3P/lN6AXTnmyM0WACkXy0AIQ5OABlFGGSuhnGt9WR2Unmtfgc3yPLmlP9audPT5A0aRTIsGm
	4Xdriw1KjqmU54R8q7FhX9HhJrIQFxhIrFztK9TTlCFyPH65BsEaNwq0Pgofi2+m7qLOIFv4oyj
	FJv3MeSEYqIA7szRMKir3Fb+CZyZsIJnKJHCeyykJ1dTbmrSIn/+LFCCd8hlosnYS5u8Vh3mcH1
	r4/fgU1zbu6X6lj8KKe8poHMgA0xAIxiCi/DBkjTBlKe+DI/YZSFQKPZIOfGRfPj9wjdoGmRm25
	3BaX10P0PMtrE1ziWOO4aFTGRCJyUGruIW/LTdkBJ5OAA7JIvqorujGqzTcuUAFsjWeMco6Ky6x
	WXs3BbnoTW4xQd/+61RbHB3JoR+QC0+pStoJtry0x2/75PFv/c0ungLZZZkvh5dxppb9N9ZCUmk
	TXIaoG5b9FdneyzTrMKvRbTX94Enae1eI2J5iUVKcQgU7wUpbswpsK743V3Rypux8npSJke0R4K
	IjBndGjVk8lUbKuDMqJJGjxurGMxlhennH2tAhNWe+1tYAUo1KHVuSqLvTJBO9+k7a+WU7wC0o1
	gtLh8=
X-Received: by 2002:a17:90b:184c:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ae897d439bmr11767124a91.58.1793771942089;
        Tue, 03 Nov 2026 21:59:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:01 -0800 (PST)
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
Subject: [PATCH 5/8] clk: ath79: convert to clk_hw based registration
Date: Tue,  3 Nov 2026 21:58:49 -0800
Message-ID: <20261104055852.152340-6-rosenp@gmail.com>
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

Register the clocks with the clk_hw API and provide them with
of_clk_add_hw_provider() and of_clk_hw_onecell_get(), instead of the
struct clk based clk_register_*() and of_clk_src_onecell_get().

The AR724x and AR933x CPU, DDR and AHB clocks are fixed factors of the
reference clock, but named their parent "ref". That only works when the
reference clock is registered under that name, as the fallback from the
bootstrap pins is, or a device tree fixed clock whose node happens to be
called "ref". With any other node name, the clocks were orphans and ran
at 0 Hz. Give them the reference clock's clk_hw as the parent instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 68 ++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 8279d58be318..3afda29377b5 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -18,17 +18,14 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/ath79-clk.h>
 
 #include <asm/div64.h>
 
 #include "clk-ath79.h"
 
-static struct clk *clks[ATH79_CLK_END];
-static struct clk_onecell_data clk_data = {
-	.clks = clks,
-	.clk_num = ARRAY_SIZE(clks),
-};
+static struct clk_hw_onecell_data *clk_data;
 
 static const char * const clk_names[ATH79_CLK_END] = {
 	[ATH79_CLK_CPU] = "cpu",
@@ -44,42 +41,44 @@ static const char * __init ath79_clk_name(int type)
 	return clk_names[type];
 }
 
-static void __init __ath79_set_clk(int type, const char *name, struct clk *clk)
+static void __init __ath79_set_clk(int type, const char *name,
+				   struct clk_hw *hw)
 {
-	if (IS_ERR(clk))
+	if (IS_ERR(hw))
 		panic("failed to allocate %s clock structure", clk_names[type]);
 
-	clks[type] = clk;
-	clk_register_clkdev(clk, name, NULL);
+	clk_data->hws[type] = hw;
+	clk_hw_register_clkdev(hw, name, NULL);
 }
 
-static struct clk * __init ath79_set_clk(int type, unsigned long rate)
+static void __init ath79_set_clk(int type, unsigned long rate)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_rate(NULL, name, NULL, 0, rate);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	__ath79_set_clk(type, name, hw);
 }
 
-static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
-					    unsigned int mult, unsigned int div)
+/* a clock derived from the reference clock by a fixed factor */
+static void __init ath79_set_ff_clk(int type, unsigned int mult,
+				    unsigned int div)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_factor(NULL, name, parent, 0, mult, div);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_factor_parent_hw(NULL, name,
+						    clk_data->hws[ATH79_CLK_REF],
+						    0, mult, div);
+	__ath79_set_clk(type, name, hw);
 }
 
 static unsigned long __init ath79_get_ref_rate(void)
 {
-	if (!clks[ATH79_CLK_REF])
+	if (!clk_data->hws[ATH79_CLK_REF])
 		panic("ath79: no reference clock");
 
-	return clk_get_rate(clks[ATH79_CLK_REF]);
+	return clk_hw_get_rate(clk_data->hws[ATH79_CLK_REF]);
 }
 
 static void __init ar71xx_clocks_init(void __iomem *pll_base)
@@ -128,9 +127,9 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	ddr_div = FIELD_GET(AR724X_DDR_DIV, pll) + 1;
 	ahb_div = (FIELD_GET(AR724X_AHB_DIV, pll) + 1) * 2;
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", mult, div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", mult, div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", mult, div * ahb_div);
+	ath79_set_ff_clk(ATH79_CLK_CPU, mult, div);
+	ath79_set_ff_clk(ATH79_CLK_DDR, mult, div * ddr_div);
+	ath79_set_ff_clk(ATH79_CLK_AHB, mult, div * ahb_div);
 }
 
 static void __init ar933x_clocks_init(void __iomem *pll_base)
@@ -175,11 +174,11 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 		ahb_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_AHB_DIV, clock_ctrl) + 1;
 	}
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_CPU, ninit_mul,
 			 ref_div * out_div * cpu_div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_DDR, ninit_mul,
 			 ref_div * out_div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_AHB, ninit_mul,
 			 ref_div * out_div * ahb_div);
 }
 
@@ -504,6 +503,11 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	struct clk *ref_clk;
 	void __iomem *pll_base;
 
+	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
+	if (!clk_data)
+		panic("ath79: can't allocate the clock data");
+	clk_data->num = ATH79_CLK_END;
+
 	/*
 	 * The board's crystal. Without a rate in the device tree, the arch
 	 * code registers it from the bootstrap pins.
@@ -512,7 +516,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	if (IS_ERR(ref_clk))
 		ref_clk = clk_get_sys(NULL, "ref");
 	if (!IS_ERR(ref_clk))
-		clks[ATH79_CLK_REF] = ref_clk;
+		clk_data->hws[ATH79_CLK_REF] = __clk_get_hw(ref_clk);
 
 	pll_base = of_iomap(np, 0);
 	if (!pll_base) {
@@ -536,10 +540,10 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
 		qca956x_clocks_init(pll_base);
 
-	if (!clks[ATH79_CLK_MDIO])
-		clks[ATH79_CLK_MDIO] = clks[ATH79_CLK_REF];
+	if (!clk_data->hws[ATH79_CLK_MDIO])
+		clk_data->hws[ATH79_CLK_MDIO] = clk_data->hws[ATH79_CLK_REF];
 
-	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data)) {
 		pr_err("%pOF: could not register clk provider\n", np);
 		goto err_iounmap;
 	}
-- 
2.56.0

