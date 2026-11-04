Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771942;
	b=Z+aoGufAlLukvgHE4UrYXKhQA3euknU3kL3T/S8yClvqqrh2nS57j57A+ZZecYOXKzTt
	 eOMwKKVxQ9W6CNvPiQTBIE7LLivCBvzAmkKUPYn0ctRBd8xacRMYIQei34ONlY4Aj+va2
	 OC4dE8EgB7/Ej62JXrGj+E150tcfwADOph53QxlHWAK7Rw7/RuEiKkKfXOY3umvEBZzex
	 tz4QV5EaraEMvM/Kx6FLjRnRJfJCMXahhJKKdQ+e5L3lhzdu6Y92hd3urIUjtlSxS7Ber
	 ybCGT+znAhsz67nlJX9TYd7P5LlNlmul3sNyFypZ5UhygUfSoso0W/atziKn3cclkDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UooKln+VYt9xp7DGBgoCbzQTslARYprBini5tTVMjUY=;
	b=r+mqJYELNbT2YOefdKibkMTdzm9eikeh6gfOajTOMt7xjW0yQFYrax3nz/TyiuQDuTzr
	 8icG82Vg6rOWWJhGVOnNY09IA9HTU6AzJBe9aRK1VLPDAMKzo+JuHJRArb7ybb+nIAqCN
	 +WteFEoYP4upmh0G3l/7qis3KLuIwaTSk/ETrAjIHXAlgIqpXeeZ4clAvs8B6+qDopstc
	 vZYBE5AUAAk01nuRTfEYwIgQxDbmfSwAJnVm5TQnVLDpmgEED3Nux+fuiYST+r8Og79Ph
	 Ui3+CEkfa7zX6chyVg++OHZoi7U9pp6GN8k5tnzVeebhpsZR65tAuSH74CCwH6Wik6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFSw1Ed+;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B2606D809
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7B2606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFSw1Ed+
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0960fdde9so190170a91.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771940; x=1794376740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UooKln+VYt9xp7DGBgoCbzQTslARYprBini5tTVMjUY=;
        b=nFSw1Ed+vBzy3DpQPJvr2506dSy1NN3pVaVK3NZ+jCIzWWRPTt7PnUnX17ySjPuB+N
         1r9lQ+FLMXe2DsD9VEY+jqjr6B3nY5uJUCwYc5uQ4RGZYSgENPLE9ca800kksHFfajfN
         EABcyhzIqUbyiVyIGlD3y4J8NM0XV/RUfQb5QXbLJnW7Y+muJ35oxo3mbjVGxJ8N2A1r
         DNwWVMzaJBo5hdIAxKjZYTc+dc5+jh89+u3di3mWtqJeoFE5V/cQMQ8gwTd2aFT8/vSS
         Keni+LDMqpogXJ80yM0SX63znRGF9F88dIXTCQ2wKO8Tn+g+loSN956M/zKWXnCUZK2r
         P6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771940; x=1794376740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UooKln+VYt9xp7DGBgoCbzQTslARYprBini5tTVMjUY=;
        b=lRXJB1F4KUhfGRA3MxYV9cn3DouJI8qTihJ6Jomt4xoH1uLLgG9V3XBXhGu2a+PO0P
         YZjmmDwJfYSb1JMjmPvnExKHVnn16rXtVEPjtbsrzWwWsKrmc9Gk7psSx1J14y9uqCIO
         VLSEBeIkrV3w0xubjZTamWZ8uK3ShZc1RXg2xDMyJFLXz6a+D9w9PCYC/1DqKpA+DS4f
         K7Etue5lY85C/oNtp/WaGyn2Wn/XJzlSNfhSq1cV+ayhiUvY+v0nH5tbcxrKevwMH4hP
         ryru5ZtjjmFzsOLCiPoK20iOMnjzAHddN2I7WJmPbFiB68Bk1LrKd4A01MoKLJ/Lnb4l
         rBmA==
X-Forwarded-Encrypted: i=1; AKwUvBx2fUJEljdMvDJSHFZSGcRvL6Jsp9l1JjeZQaygYswSwyEsqBTmiHyn1fIjIvPkiLd8MWMAv1Kmgeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85/BZf7T4O7pDiCSj8DeUZimliROukxmt01Oea46jeepqS2n3w
	VS0phK2eobGiXb2tAoi/VPvhjrvx5jaj6c3iw/3ZmAZMgaFhqbOXUNyVDwEE4A==
X-Gm-Gg: AYBFou3dCRtU/UfdICsHlWjyekwwXmNpXm2o2KhVFWr2CxFOD3sl6HFLzboT87lEGDF
	1mo4ZbkGHf86q9ScYYOHRc8oz9Dszw3Ajw8DF5YzbeOXKexs3DuSAAJmMfB8SH5+KqNh3dT29Gx
	zIMYtxSfmaxDH59uwcRWWbeGfpLVPT8pb9XnCrGDQWFe+m1EGe4FurgKKNEEDZxjcmhNJDpyDnC
	t4b1qCQRmByawhu/Q+nMqtW0dgqriAXm357LAMPxXA3lMAR8Qt52mn0DV0MYJY8zfbT91Oe0l/e
	t2zJSgG2LvsfX36HhWCZCiwsdwLntTzKuK7SsoMyhlOuwnvuoOfAENZqN8hL5343O1MBmzBj3N1
	W23WFOUSpWFgZxkOKqLipKA/8Hix4F7kLXnFlGdViwvfW7bGkumReTyN63Yzn6mSj80AZzhIgkF
	QQFw4h5csdHBGlw/U1iYPlEhf4dI8xZCD0bvQ/8Zz1oNdQzsQKc2LGoYMEFceLCobtQpQlZJnxZ
	oBaBmv9Mhippd9IuHq5Sat5o1UJFDVWGgUcgBQ3ixz+7G52z2cvmxjOwjHPsZ5KtAywUNgsXykM
	int4IVwGEAUrzZS0wejPhjhieIE/26xus/77+XkNcM2wG8MIQUkYUxCMjuUOoQeP8krge/O/ROT
	vI3eXv95lqWBReXpkLhHn7u8VRQ0HtXJc3s01Odns0n57VQOmT5D2URLiIW/jb4r15qj5etG635
	vXWA==
X-Received: by 2002:a17:90b:528d:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3ae897baff7mr11262852a91.28.1793771940400;
        Tue, 03 Nov 2026 21:59:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:59 -0800 (PST)
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
Subject: [PATCH 4/8] clk: ath79: use FIELD_GET() for the PLL register fields
Date: Tue,  3 Nov 2026 21:58:48 -0800
Message-ID: <20261104055852.152340-5-rosenp@gmail.com>
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

Describe the PLL and SRIF register fields with GENMASK() instead of
separate _SHIFT and _MASK pairs, and extract them with FIELD_GET()
instead of open-coded shifts and masks.

No functional change: the generated code is the same, apart from a
register allocation swap in ar933x_clocks_init().

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 199 +++++++++++---------------------
 drivers/clk/clk-ath79.h | 246 ++++++++++++++++------------------------
 2 files changed, 165 insertions(+), 280 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index c5da404c9c48..8279d58be318 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -8,6 +8,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -95,16 +96,16 @@ static void __init ar71xx_clocks_init(void __iomem *pll_base)
 
 	pll = __raw_readl(pll_base + AR71XX_PLL_REG_CPU_CONFIG);
 
-	div = ((pll >> AR71XX_PLL_FB_SHIFT) & AR71XX_PLL_FB_MASK) + 1;
+	div = FIELD_GET(AR71XX_PLL_FB, pll) + 1;
 	freq = div * ref_rate;
 
-	div = ((pll >> AR71XX_CPU_DIV_SHIFT) & AR71XX_CPU_DIV_MASK) + 1;
+	div = FIELD_GET(AR71XX_CPU_DIV, pll) + 1;
 	cpu_rate = freq / div;
 
-	div = ((pll >> AR71XX_DDR_DIV_SHIFT) & AR71XX_DDR_DIV_MASK) + 1;
+	div = FIELD_GET(AR71XX_DDR_DIV, pll) + 1;
 	ddr_rate = freq / div;
 
-	div = (((pll >> AR71XX_AHB_DIV_SHIFT) & AR71XX_AHB_DIV_MASK) + 1) * 2;
+	div = (FIELD_GET(AR71XX_AHB_DIV, pll) + 1) * 2;
 	ahb_rate = cpu_rate / div;
 
 	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
@@ -121,11 +122,11 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 
 	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
 
-	mult = ((pll >> AR724X_PLL_FB_SHIFT) & AR724X_PLL_FB_MASK);
-	div = ((pll >> AR724X_PLL_REF_DIV_SHIFT) & AR724X_PLL_REF_DIV_MASK) * 2;
+	mult = FIELD_GET(AR724X_PLL_FB, pll);
+	div = FIELD_GET(AR724X_PLL_REF_DIV, pll) * 2;
 
-	ddr_div = ((pll >> AR724X_DDR_DIV_SHIFT) & AR724X_DDR_DIV_MASK) + 1;
-	ahb_div = (((pll >> AR724X_AHB_DIV_SHIFT) & AR724X_AHB_DIV_MASK) + 1) * 2;
+	ddr_div = FIELD_GET(AR724X_DDR_DIV, pll) + 1;
+	ahb_div = (FIELD_GET(AR724X_AHB_DIV, pll) + 1) * 2;
 
 	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", mult, div);
 	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", mult, div * ddr_div);
@@ -160,28 +161,18 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 
 		cpu_config = __raw_readl(pll_base + AR933X_PLL_CPU_CONFIG_REG);
 
-		t = (cpu_config >> AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_REFDIV_MASK;
-		ref_div = t;
+		ref_div = FIELD_GET(AR933X_PLL_CPU_CONFIG_REFDIV, cpu_config);
+		ninit_mul = FIELD_GET(AR933X_PLL_CPU_CONFIG_NINT, cpu_config);
 
-		ninit_mul = (cpu_config >> AR933X_PLL_CPU_CONFIG_NINT_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_NINT_MASK;
-
-		t = (cpu_config >> AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_OUTDIV_MASK;
+		t = FIELD_GET(AR933X_PLL_CPU_CONFIG_OUTDIV, cpu_config);
 		if (t == 0)
 			t = 1;
 
 		out_div = (1 << t);
 
-		cpu_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT) &
-		     AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK) + 1;
-
-		ddr_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT) &
-		      AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK) + 1;
-
-		ahb_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT) &
-		     AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK) + 1;
+		cpu_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_CPU_DIV, clock_ctrl) + 1;
+		ddr_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_DDR_DIV, clock_ctrl) + 1;
+		ahb_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_AHB_DIV, clock_ctrl) + 1;
 	}
 
 	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", ninit_mul,
@@ -228,25 +219,18 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
-		out_div = (pll >> AR934X_SRIF_DPLL2_OUTDIV_SHIFT) &
-			  AR934X_SRIF_DPLL2_OUTDIV_MASK;
+		out_div = FIELD_GET(AR934X_SRIF_DPLL2_OUTDIV, pll);
 		pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL1_REG);
-		nint = (pll >> AR934X_SRIF_DPLL1_NINT_SHIFT) &
-		       AR934X_SRIF_DPLL1_NINT_MASK;
-		nfrac = pll & AR934X_SRIF_DPLL1_NFRAC_MASK;
-		ref_div = (pll >> AR934X_SRIF_DPLL1_REFDIV_SHIFT) &
-			  AR934X_SRIF_DPLL1_REFDIV_MASK;
+		nint = FIELD_GET(AR934X_SRIF_DPLL1_NINT, pll);
+		nfrac = FIELD_GET(AR934X_SRIF_DPLL1_NFRAC, pll);
+		ref_div = FIELD_GET(AR934X_SRIF_DPLL1_REFDIV, pll);
 		frac = 1 << 18;
 	} else {
 		pll = __raw_readl(pll_base + AR934X_PLL_CPU_CONFIG_REG);
-		out_div = (pll >> AR934X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-			AR934X_PLL_CPU_CONFIG_OUTDIV_MASK;
-		ref_div = (pll >> AR934X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-			  AR934X_PLL_CPU_CONFIG_REFDIV_MASK;
-		nint = (pll >> AR934X_PLL_CPU_CONFIG_NINT_SHIFT) &
-		       AR934X_PLL_CPU_CONFIG_NINT_MASK;
-		nfrac = (pll >> AR934X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-			AR934X_PLL_CPU_CONFIG_NFRAC_MASK;
+		out_div = FIELD_GET(AR934X_PLL_CPU_CONFIG_OUTDIV, pll);
+		ref_div = FIELD_GET(AR934X_PLL_CPU_CONFIG_REFDIV, pll);
+		nint = FIELD_GET(AR934X_PLL_CPU_CONFIG_NINT, pll);
+		nfrac = FIELD_GET(AR934X_PLL_CPU_CONFIG_NFRAC, pll);
 		frac = 1 << 6;
 	}
 
@@ -255,25 +239,18 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
-		out_div = (pll >> AR934X_SRIF_DPLL2_OUTDIV_SHIFT) &
-			  AR934X_SRIF_DPLL2_OUTDIV_MASK;
+		out_div = FIELD_GET(AR934X_SRIF_DPLL2_OUTDIV, pll);
 		pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL1_REG);
-		nint = (pll >> AR934X_SRIF_DPLL1_NINT_SHIFT) &
-		       AR934X_SRIF_DPLL1_NINT_MASK;
-		nfrac = pll & AR934X_SRIF_DPLL1_NFRAC_MASK;
-		ref_div = (pll >> AR934X_SRIF_DPLL1_REFDIV_SHIFT) &
-			  AR934X_SRIF_DPLL1_REFDIV_MASK;
+		nint = FIELD_GET(AR934X_SRIF_DPLL1_NINT, pll);
+		nfrac = FIELD_GET(AR934X_SRIF_DPLL1_NFRAC, pll);
+		ref_div = FIELD_GET(AR934X_SRIF_DPLL1_REFDIV, pll);
 		frac = 1 << 18;
 	} else {
 		pll = __raw_readl(pll_base + AR934X_PLL_DDR_CONFIG_REG);
-		out_div = (pll >> AR934X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-			  AR934X_PLL_DDR_CONFIG_OUTDIV_MASK;
-		ref_div = (pll >> AR934X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-			   AR934X_PLL_DDR_CONFIG_REFDIV_MASK;
-		nint = (pll >> AR934X_PLL_DDR_CONFIG_NINT_SHIFT) &
-		       AR934X_PLL_DDR_CONFIG_NINT_MASK;
-		nfrac = (pll >> AR934X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-			AR934X_PLL_DDR_CONFIG_NFRAC_MASK;
+		out_div = FIELD_GET(AR934X_PLL_DDR_CONFIG_OUTDIV, pll);
+		ref_div = FIELD_GET(AR934X_PLL_DDR_CONFIG_REFDIV, pll);
+		nint = FIELD_GET(AR934X_PLL_DDR_CONFIG_NINT, pll);
+		nfrac = FIELD_GET(AR934X_PLL_DDR_CONFIG_NFRAC, pll);
 		frac = 1 << 10;
 	}
 
@@ -282,8 +259,7 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 
 	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_CPU_DDR_CLK_CTRL_REG);
 
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_MASK;
+	postdiv = FIELD_GET(AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_PLL_BYPASS)
 		cpu_rate = ref_rate;
@@ -292,8 +268,7 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	else
 		cpu_rate = ddr_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_MASK;
+	postdiv = FIELD_GET(AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_PLL_BYPASS)
 		ddr_rate = ref_rate;
@@ -302,8 +277,7 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	else
 		ddr_rate = cpu_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_MASK;
+	postdiv = FIELD_GET(AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_PLL_BYPASS)
 		ahb_rate = ref_rate;
@@ -335,28 +309,20 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA953X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA953X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA953X_PLL_CPU_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA953X_PLL_CPU_CONFIG_NINT_SHIFT) &
-	       QCA953X_PLL_CPU_CONFIG_NINT_MASK;
-	frac = (pll >> QCA953X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-	       QCA953X_PLL_CPU_CONFIG_NFRAC_MASK;
+	out_div = FIELD_GET(QCA953X_PLL_CPU_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA953X_PLL_CPU_CONFIG_REFDIV, pll);
+	nint = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NINT, pll);
+	frac = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NFRAC, pll);
 
 	cpu_pll = nint * ref_rate / ref_div;
 	cpu_pll += frac * (ref_rate >> 6) / ref_div;
 	cpu_pll /= (1 << out_div);
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA953X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA953X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA953X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA953X_PLL_DDR_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA953X_PLL_DDR_CONFIG_NINT_SHIFT) &
-	       QCA953X_PLL_DDR_CONFIG_NINT_MASK;
-	frac = (pll >> QCA953X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-	       QCA953X_PLL_DDR_CONFIG_NFRAC_MASK;
+	out_div = FIELD_GET(QCA953X_PLL_DDR_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA953X_PLL_DDR_CONFIG_REFDIV, pll);
+	nint = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NINT, pll);
+	frac = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NFRAC, pll);
 
 	ddr_pll = nint * ref_rate / ref_div;
 	ddr_pll += frac * (ref_rate >> 6) / (ref_div << 4);
@@ -364,8 +330,7 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 
 	clk_ctrl = __raw_readl(pll_base + QCA953X_PLL_CLK_CTRL_REG);
 
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA953X_PLL_CLK_CTRL_CPU_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
 		cpu_rate = ref_rate;
@@ -374,8 +339,7 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	else
 		cpu_rate = ddr_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA953X_PLL_CLK_CTRL_DDR_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
 		ddr_rate = ref_rate;
@@ -384,8 +348,7 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	else
 		ddr_rate = cpu_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA953X_PLL_CLK_CTRL_AHB_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
 		ahb_rate = ref_rate;
@@ -411,28 +374,20 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA955X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA955X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA955X_PLL_CPU_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA955X_PLL_CPU_CONFIG_NINT_SHIFT) &
-	       QCA955X_PLL_CPU_CONFIG_NINT_MASK;
-	frac = (pll >> QCA955X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-	       QCA955X_PLL_CPU_CONFIG_NFRAC_MASK;
+	out_div = FIELD_GET(QCA955X_PLL_CPU_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA955X_PLL_CPU_CONFIG_REFDIV, pll);
+	nint = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NINT, pll);
+	frac = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NFRAC, pll);
 
 	cpu_pll = nint * ref_rate / ref_div;
 	cpu_pll += frac * ref_rate / (ref_div * (1 << 6));
 	cpu_pll /= (1 << out_div);
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA955X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA955X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA955X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA955X_PLL_DDR_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA955X_PLL_DDR_CONFIG_NINT_SHIFT) &
-	       QCA955X_PLL_DDR_CONFIG_NINT_MASK;
-	frac = (pll >> QCA955X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-	       QCA955X_PLL_DDR_CONFIG_NFRAC_MASK;
+	out_div = FIELD_GET(QCA955X_PLL_DDR_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA955X_PLL_DDR_CONFIG_REFDIV, pll);
+	nint = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NINT, pll);
+	frac = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NFRAC, pll);
 
 	ddr_pll = nint * ref_rate / ref_div;
 	ddr_pll += frac * ref_rate / (ref_div * (1 << 10));
@@ -440,8 +395,7 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 
 	clk_ctrl = __raw_readl(pll_base + QCA955X_PLL_CLK_CTRL_REG);
 
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA955X_PLL_CLK_CTRL_CPU_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
 		cpu_rate = ref_rate;
@@ -450,8 +404,7 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	else
 		cpu_rate = cpu_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA955X_PLL_CLK_CTRL_DDR_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
 		ddr_rate = ref_rate;
@@ -460,8 +413,7 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	else
 		ddr_rate = ddr_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA955X_PLL_CLK_CTRL_AHB_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
 		ahb_rate = ref_rate;
@@ -487,18 +439,13 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA956X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA956X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA956X_PLL_CPU_CONFIG_REFDIV_MASK;
+	out_div = FIELD_GET(QCA956X_PLL_CPU_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA956X_PLL_CPU_CONFIG_REFDIV, pll);
 
 	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG1_REG);
-	nint = (pll >> QCA956X_PLL_CPU_CONFIG1_NINT_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NINT_MASK;
-	hfrac = (pll >> QCA956X_PLL_CPU_CONFIG1_NFRAC_H_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NFRAC_H_MASK;
-	lfrac = (pll >> QCA956X_PLL_CPU_CONFIG1_NFRAC_L_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NFRAC_L_MASK;
+	nint = FIELD_GET(QCA956X_PLL_CPU_CONFIG1_NINT, pll);
+	hfrac = FIELD_GET(QCA956X_PLL_CPU_CONFIG1_NFRAC_H, pll);
+	lfrac = FIELD_GET(QCA956X_PLL_CPU_CONFIG1_NFRAC_L, pll);
 
 	cpu_pll = nint * ref_rate / ref_div;
 	cpu_pll += (lfrac * ref_rate) / ((ref_div * 25) << 13);
@@ -506,17 +453,12 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	cpu_pll /= (1 << out_div);
 
 	pll = __raw_readl(pll_base + QCA956X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA956X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA956X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA956X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA956X_PLL_DDR_CONFIG_REFDIV_MASK;
+	out_div = FIELD_GET(QCA956X_PLL_DDR_CONFIG_OUTDIV, pll);
+	ref_div = FIELD_GET(QCA956X_PLL_DDR_CONFIG_REFDIV, pll);
 	pll = __raw_readl(pll_base + QCA956X_PLL_DDR_CONFIG1_REG);
-	nint = (pll >> QCA956X_PLL_DDR_CONFIG1_NINT_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NINT_MASK;
-	hfrac = (pll >> QCA956X_PLL_DDR_CONFIG1_NFRAC_H_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NFRAC_H_MASK;
-	lfrac = (pll >> QCA956X_PLL_DDR_CONFIG1_NFRAC_L_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NFRAC_L_MASK;
+	nint = FIELD_GET(QCA956X_PLL_DDR_CONFIG1_NINT, pll);
+	hfrac = FIELD_GET(QCA956X_PLL_DDR_CONFIG1_NFRAC_H, pll);
+	lfrac = FIELD_GET(QCA956X_PLL_DDR_CONFIG1_NFRAC_L, pll);
 
 	ddr_pll = nint * ref_rate / ref_div;
 	ddr_pll += (lfrac * ref_rate) / ((ref_div * 25) << 13);
@@ -525,8 +467,7 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 
 	clk_ctrl = __raw_readl(pll_base + QCA956X_PLL_CLK_CTRL_REG);
 
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA956X_PLL_CLK_CTRL_CPU_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
 		cpu_rate = ref_rate;
@@ -535,8 +476,7 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	else
 		cpu_rate = cpu_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA956X_PLL_CLK_CTRL_DDR_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
 		ddr_rate = ref_rate;
@@ -545,8 +485,7 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	else
 		ddr_rate = ddr_pll / (postdiv + 1);
 
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
+	postdiv = FIELD_GET(QCA956X_PLL_CLK_CTRL_AHB_POST_DIV, clk_ctrl);
 
 	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
 		ahb_rate = ref_rate;
diff --git a/drivers/clk/clk-ath79.h b/drivers/clk/clk-ath79.h
index 12d7488eb5d2..dbff1b813562 100644
--- a/drivers/clk/clk-ath79.h
+++ b/drivers/clk/clk-ath79.h
@@ -9,186 +9,132 @@
 
 #include <linux/bits.h>
 
-#define AR71XX_APB_BASE		0x18000000
-#define AR934X_SRIF_BASE	(AR71XX_APB_BASE + 0x00116000)
-#define AR934X_SRIF_SIZE	0x1000
-#define AR71XX_PLL_REG_CPU_CONFIG	0x00
-#define AR71XX_PLL_FB_SHIFT		3
-#define AR71XX_PLL_FB_MASK		0x1f
-#define AR71XX_CPU_DIV_SHIFT		16
-#define AR71XX_CPU_DIV_MASK		0x3
-#define AR71XX_DDR_DIV_SHIFT		18
-#define AR71XX_DDR_DIV_MASK		0x3
-#define AR71XX_AHB_DIV_SHIFT		20
-#define AR71XX_AHB_DIV_MASK		0x7
-#define AR724X_PLL_REG_CPU_CONFIG	0x00
-#define AR724X_PLL_FB_SHIFT		0
-#define AR724X_PLL_FB_MASK		0x3ff
-#define AR724X_PLL_REF_DIV_SHIFT	10
-#define AR724X_PLL_REF_DIV_MASK		0xf
-#define AR724X_AHB_DIV_SHIFT		19
-#define AR724X_AHB_DIV_MASK		0x1
-#define AR724X_DDR_DIV_SHIFT		22
-#define AR724X_DDR_DIV_MASK		0x3
-#define AR933X_PLL_CPU_CONFIG_REG	0x00
-#define AR933X_PLL_CLOCK_CTRL_REG	0x08
-#define AR933X_PLL_CPU_CONFIG_NINT_SHIFT	10
-#define AR933X_PLL_CPU_CONFIG_NINT_MASK		0x3f
-#define AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT	16
-#define AR933X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
-#define AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT	23
-#define AR933X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
-#define AR933X_PLL_CLOCK_CTRL_BYPASS		BIT(2)
-#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT	5
-#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK	0x3
-#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT	10
-#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK	0x3
-#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT	15
-#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK	0x7
-#define AR934X_PLL_CPU_CONFIG_REG		0x00
-#define AR934X_PLL_DDR_CONFIG_REG		0x04
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_REG		0x08
-#define AR934X_PLL_SWITCH_CLOCK_CONTROL_REG	0x24
-#define AR934X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
-#define AR934X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
-#define AR934X_PLL_CPU_CONFIG_NINT_SHIFT	6
-#define AR934X_PLL_CPU_CONFIG_NINT_MASK		0x3f
-#define AR934X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
-#define AR934X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
-#define AR934X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
-#define AR934X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
-#define AR934X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
-#define AR934X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
-#define AR934X_PLL_DDR_CONFIG_NINT_SHIFT	10
-#define AR934X_PLL_DDR_CONFIG_NINT_MASK		0x3f
-#define AR934X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
-#define AR934X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
-#define AR934X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
-#define AR934X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define AR71XX_APB_BASE					0x18000000
+
+#define AR934X_SRIF_BASE				(AR71XX_APB_BASE + 0x00116000)
+#define AR934X_SRIF_SIZE				0x1000
+
+#define AR71XX_PLL_REG_CPU_CONFIG			0x00
+#define AR71XX_PLL_FB					GENMASK(7, 3)
+#define AR71XX_CPU_DIV					GENMASK(17, 16)
+#define AR71XX_DDR_DIV					GENMASK(19, 18)
+#define AR71XX_AHB_DIV					GENMASK(22, 20)
+
+#define AR724X_PLL_REG_CPU_CONFIG			0x00
+#define AR724X_PLL_FB					GENMASK(9, 0)
+#define AR724X_PLL_REF_DIV				GENMASK(13, 10)
+#define AR724X_AHB_DIV					GENMASK(19, 19)
+#define AR724X_DDR_DIV					GENMASK(23, 22)
+
+#define AR933X_PLL_CPU_CONFIG_REG			0x00
+#define AR933X_PLL_CLOCK_CTRL_REG			0x08
+#define AR933X_PLL_CPU_CONFIG_NINT			GENMASK(15, 10)
+#define AR933X_PLL_CPU_CONFIG_REFDIV			GENMASK(20, 16)
+#define AR933X_PLL_CPU_CONFIG_OUTDIV			GENMASK(25, 23)
+#define AR933X_PLL_CLOCK_CTRL_BYPASS			BIT(2)
+#define AR933X_PLL_CLOCK_CTRL_CPU_DIV			GENMASK(6, 5)
+#define AR933X_PLL_CLOCK_CTRL_DDR_DIV			GENMASK(11, 10)
+#define AR933X_PLL_CLOCK_CTRL_AHB_DIV			GENMASK(17, 15)
+
+#define AR934X_PLL_CPU_CONFIG_REG			0x00
+#define AR934X_PLL_DDR_CONFIG_REG			0x04
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_REG			0x08
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_REG		0x24
+#define AR934X_PLL_CPU_CONFIG_NFRAC			GENMASK(5, 0)
+#define AR934X_PLL_CPU_CONFIG_NINT			GENMASK(11, 6)
+#define AR934X_PLL_CPU_CONFIG_REFDIV			GENMASK(16, 12)
+#define AR934X_PLL_CPU_CONFIG_OUTDIV			GENMASK(20, 19)
+#define AR934X_PLL_DDR_CONFIG_NFRAC			GENMASK(9, 0)
+#define AR934X_PLL_DDR_CONFIG_NINT			GENMASK(15, 10)
+#define AR934X_PLL_DDR_CONFIG_REFDIV			GENMASK(20, 16)
+#define AR934X_PLL_DDR_CONFIG_OUTDIV			GENMASK(25, 23)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_PLL_BYPASS	BIT(2)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_PLL_BYPASS	BIT(3)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_PLL_BYPASS	BIT(4)
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_SHIFT	5
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_MASK	0x1f
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_SHIFT	10
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_MASK	0x1f
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_SHIFT	15
-#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV	GENMASK(9, 5)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV	GENMASK(14, 10)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV	GENMASK(19, 15)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_CPUCLK_FROM_CPUPLL	BIT(20)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_DDRCLK_FROM_DDRPLL	BIT(21)
 #define AR934X_PLL_CPU_DDR_CLK_CTRL_AHBCLK_FROM_DDRPLL	BIT(24)
 #define AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL	BIT(6)
 #define AR934X_PLL_SWITCH_CLOCK_CONTROL_UART1_CLK_SEL	BIT(7)
-#define QCA953X_PLL_CPU_CONFIG_REG		0x00
-#define QCA953X_PLL_DDR_CONFIG_REG		0x04
-#define QCA953X_PLL_CLK_CTRL_REG		0x08
-#define QCA953X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
-#define QCA953X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
-#define QCA953X_PLL_CPU_CONFIG_NINT_SHIFT	6
-#define QCA953X_PLL_CPU_CONFIG_NINT_MASK	0x3f
-#define QCA953X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
-#define QCA953X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
-#define QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
-#define QCA953X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
-#define QCA953X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
-#define QCA953X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
-#define QCA953X_PLL_DDR_CONFIG_NINT_SHIFT	10
-#define QCA953X_PLL_DDR_CONFIG_NINT_MASK	0x3f
-#define QCA953X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
-#define QCA953X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
-#define QCA953X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
-#define QCA953X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+
+#define QCA953X_PLL_CPU_CONFIG_REG			0x00
+#define QCA953X_PLL_DDR_CONFIG_REG			0x04
+#define QCA953X_PLL_CLK_CTRL_REG			0x08
+#define QCA953X_PLL_CPU_CONFIG_NFRAC			GENMASK(5, 0)
+#define QCA953X_PLL_CPU_CONFIG_NINT			GENMASK(11, 6)
+#define QCA953X_PLL_CPU_CONFIG_REFDIV			GENMASK(16, 12)
+#define QCA953X_PLL_CPU_CONFIG_OUTDIV			GENMASK(21, 19)
+#define QCA953X_PLL_DDR_CONFIG_NFRAC			GENMASK(9, 0)
+#define QCA953X_PLL_DDR_CONFIG_NINT			GENMASK(15, 10)
+#define QCA953X_PLL_DDR_CONFIG_REFDIV			GENMASK(20, 16)
+#define QCA953X_PLL_DDR_CONFIG_OUTDIV			GENMASK(25, 23)
 #define QCA953X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
 #define QCA953X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
 #define QCA953X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
-#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
-#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
-#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
-#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
-#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
-#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV		GENMASK(9, 5)
+#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV		GENMASK(14, 10)
+#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV		GENMASK(19, 15)
 #define QCA953X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
 #define QCA953X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
 #define QCA953X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
-#define QCA955X_PLL_CPU_CONFIG_REG		0x00
-#define QCA955X_PLL_DDR_CONFIG_REG		0x04
-#define QCA955X_PLL_CLK_CTRL_REG		0x08
-#define QCA955X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
-#define QCA955X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
-#define QCA955X_PLL_CPU_CONFIG_NINT_SHIFT	6
-#define QCA955X_PLL_CPU_CONFIG_NINT_MASK	0x3f
-#define QCA955X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
-#define QCA955X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
-#define QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
-#define QCA955X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
-#define QCA955X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
-#define QCA955X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
-#define QCA955X_PLL_DDR_CONFIG_NINT_SHIFT	10
-#define QCA955X_PLL_DDR_CONFIG_NINT_MASK	0x3f
-#define QCA955X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
-#define QCA955X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
-#define QCA955X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
-#define QCA955X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+
+#define QCA955X_PLL_CPU_CONFIG_REG			0x00
+#define QCA955X_PLL_DDR_CONFIG_REG			0x04
+#define QCA955X_PLL_CLK_CTRL_REG			0x08
+#define QCA955X_PLL_CPU_CONFIG_NFRAC			GENMASK(5, 0)
+#define QCA955X_PLL_CPU_CONFIG_NINT			GENMASK(11, 6)
+#define QCA955X_PLL_CPU_CONFIG_REFDIV			GENMASK(16, 12)
+#define QCA955X_PLL_CPU_CONFIG_OUTDIV			GENMASK(20, 19)
+#define QCA955X_PLL_DDR_CONFIG_NFRAC			GENMASK(9, 0)
+#define QCA955X_PLL_DDR_CONFIG_NINT			GENMASK(15, 10)
+#define QCA955X_PLL_DDR_CONFIG_REFDIV			GENMASK(20, 16)
+#define QCA955X_PLL_DDR_CONFIG_OUTDIV			GENMASK(25, 23)
 #define QCA955X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
 #define QCA955X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
 #define QCA955X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
-#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
-#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
-#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
-#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
-#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
-#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV		GENMASK(9, 5)
+#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV		GENMASK(14, 10)
+#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV		GENMASK(19, 15)
 #define QCA955X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
 #define QCA955X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
 #define QCA955X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+
 #define QCA956X_PLL_CPU_CONFIG_REG			0x00
 #define QCA956X_PLL_CPU_CONFIG1_REG			0x04
 #define QCA956X_PLL_DDR_CONFIG_REG			0x08
 #define QCA956X_PLL_DDR_CONFIG1_REG			0x0c
 #define QCA956X_PLL_CLK_CTRL_REG			0x10
-#define QCA956X_PLL_CPU_CONFIG_REFDIV_SHIFT		12
-#define QCA956X_PLL_CPU_CONFIG_REFDIV_MASK		0x1f
-#define QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT		19
-#define QCA956X_PLL_CPU_CONFIG_OUTDIV_MASK		0x7
-#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_SHIFT		0
-#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_MASK		0x1f
-#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_SHIFT		5
-#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_MASK		0x1fff
-#define QCA956X_PLL_CPU_CONFIG1_NINT_SHIFT		18
-#define QCA956X_PLL_CPU_CONFIG1_NINT_MASK		0x1ff
-#define QCA956X_PLL_DDR_CONFIG_REFDIV_SHIFT		16
-#define QCA956X_PLL_DDR_CONFIG_REFDIV_MASK		0x1f
-#define QCA956X_PLL_DDR_CONFIG_OUTDIV_SHIFT		23
-#define QCA956X_PLL_DDR_CONFIG_OUTDIV_MASK		0x7
-#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_SHIFT		0
-#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_MASK		0x1f
-#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_SHIFT		5
-#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_MASK		0x1fff
-#define QCA956X_PLL_DDR_CONFIG1_NINT_SHIFT		18
-#define QCA956X_PLL_DDR_CONFIG1_NINT_MASK		0x1ff
+#define QCA956X_PLL_CPU_CONFIG_REFDIV			GENMASK(16, 12)
+#define QCA956X_PLL_CPU_CONFIG_OUTDIV			GENMASK(21, 19)
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L			GENMASK(4, 0)
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H			GENMASK(17, 5)
+#define QCA956X_PLL_CPU_CONFIG1_NINT			GENMASK(26, 18)
+#define QCA956X_PLL_DDR_CONFIG_REFDIV			GENMASK(20, 16)
+#define QCA956X_PLL_DDR_CONFIG_OUTDIV			GENMASK(25, 23)
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L			GENMASK(4, 0)
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H			GENMASK(17, 5)
+#define QCA956X_PLL_DDR_CONFIG1_NINT			GENMASK(26, 18)
 #define QCA956X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
 #define QCA956X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
 #define QCA956X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
-#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
-#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
-#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
-#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
-#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
-#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV		GENMASK(9, 5)
+#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV		GENMASK(14, 10)
+#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV		GENMASK(19, 15)
 #define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_DDRPLL	BIT(20)
 #define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_CPUPLL	BIT(21)
 #define QCA956X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
-#define AR934X_SRIF_CPU_DPLL1_REG	0x1c0
-#define AR934X_SRIF_CPU_DPLL2_REG	0x1c4
-#define AR934X_SRIF_DDR_DPLL1_REG	0x240
-#define AR934X_SRIF_DDR_DPLL2_REG	0x244
-#define AR934X_SRIF_DPLL1_REFDIV_SHIFT	27
-#define AR934X_SRIF_DPLL1_REFDIV_MASK	0x1f
-#define AR934X_SRIF_DPLL1_NINT_SHIFT	18
-#define AR934X_SRIF_DPLL1_NINT_MASK	0x1ff
-#define AR934X_SRIF_DPLL1_NFRAC_MASK	0x0003ffff
-#define AR934X_SRIF_DPLL2_LOCAL_PLL	BIT(30)
-#define AR934X_SRIF_DPLL2_OUTDIV_SHIFT	13
-#define AR934X_SRIF_DPLL2_OUTDIV_MASK	0x7
+
+#define AR934X_SRIF_CPU_DPLL1_REG			0x1c0
+#define AR934X_SRIF_CPU_DPLL2_REG			0x1c4
+#define AR934X_SRIF_DDR_DPLL1_REG			0x240
+#define AR934X_SRIF_DDR_DPLL2_REG			0x244
+#define AR934X_SRIF_DPLL1_REFDIV			GENMASK(31, 27)
+#define AR934X_SRIF_DPLL1_NINT				GENMASK(26, 18)
+#define AR934X_SRIF_DPLL1_NFRAC				GENMASK(17, 0)
+#define AR934X_SRIF_DPLL2_LOCAL_PLL			BIT(30)
+#define AR934X_SRIF_DPLL2_OUTDIV			GENMASK(15, 13)
 
 #endif /* __CLK_ATH79_H */
-- 
2.56.0

