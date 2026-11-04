Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771948;
	b=lbWUydhBEbPjOU6sl5t8R/SuybQXMWKKuFBdxFnUEimVo2ORumYnA9f41nDC2q3g5n4n
	 15ON394K6jxooN8CFTKHAiHEAqoQd+jUuOMQmV5A+xytLFbmnJAhuKAqTax9bKfk1hkGl
	 lHMpGc4yeNEovOhJvASyrmlPdTJeXhwoBBl1WeI2Xrs6JtZSNlGpSTJjct5Em5zvghjJ4
	 l9O/UQmZwqlrWYIfjeoVtojy4rgyqvhYppf9pV9jc6d9PXsYRQLCvUOcDMLUkUnyaJP14
	 SBaCMB23sXP6o6wIRqi0Wf/c5mxU5C8NrxyRn5Z+etvKUDFAiTT/3vyU5EHfre0JbJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
	b=ZjYzJEVejmPfDwwgifmDNPHyQ/auurFBiKI/3D4DE+McsyQZr9DgiWxwvuCvB7IlV8kh
	 L6aYDOHjR1Kc0N82RtfMi+9vnwiGwp8T+LUcNEQj1/0f/WSuGv5ksQoPkTUGIzb7c+tfx
	 cWtS4F9mTsIoksx0IR2HX/5JAK+RbGeSHhgbZahE3rO8NHDGv357gpXkP7O3awj4zPp0B
	 QQNwig+YD7Dpcqg/6uXfM2/8+/jrcrhIvbx/8lYsARc4PtIBsCfFOVJLC2mSQZENhLMId
	 m8JSzo2X5uy1v3qlhxSdBB64FD6wqJpYSBOcRnQYFz8BTVVwr+wrp2roiXVjch2sXjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQyqnqA3;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B9B606A33B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B9B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQyqnqA3
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso227488a91.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771947; x=1794376747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
        b=RQyqnqA323GdSXTNNSSZ/xZ3K5TQwCzL5RgcVHfFdyzLb1ZFGAiIF0HXmzRwsq+imI
         FFCfZomhVZVCkzKYYVmVgHs/d3Sx4t4jPoIPKkn4xXMvILrRVc59mtjMx3+y2ZxCLfe1
         YAurjNgVZbwp8opPTwOzjp/0S1oR3Gb27pc+BsHW0/3GyTDswDDC1bJ4C7/MGzt+OJTV
         rjTDThLzl3ChKJcGWlZDilc2Nc02UCMyGPW6mpYCf4TGLvvcebV9fXMoeT6FfjDtkqak
         sjWYNbkdMlWbxPaWS0Bj9qeyzizqFxcFxE79aHH2jBn+gWTRjYfawW7YEvd4R+5kmk5z
         G9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771947; x=1794376747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
        b=PiMoIDccqlo1TcX+R3yCr1WPc0eOScAN1tRkcw1kIGOJIoQXyHbgAnd0m+j7GZtJKp
         rzOYmnY4Hl5jN0LlhnUh/pBHmYJ6vtc1DamAxcJZE9bqnxda4A4CcsUSuyWX4SOafIEQ
         sKfBypmpJnY8xWoZ19KEgpBcLcpiWQhDZYX7W542UqwxeabDYIKdAS9+ONozjawIiWBp
         7SfvoxnMhg1edSE5RImKRa+kLbeT8uFOjsZi1QQWRqnMnQDLjsOWnsxGihwp//p19158
         sK30SDLXVl/QKpTPKx7AlapuTPdch5i+f2tuAI7XabgnqvsEdn9sFmzSyLqUXp+XKUUg
         kSAQ==
X-Forwarded-Encrypted: i=1; AKwUvByruy8VWC8nXi6tuE+WCiuEZg3bwQKmDQbUDpGD8oukZWEPqjvTc45YJ9OnREQ1wZ4z5kBdZl6mCRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZRzGEhdeAmCEciUCsCpwjWMJ9lmzhyA8ZtIwp9V84xara+fF6
	soKsooM/5Q3x/Eb21yE1l/NhtWYSEpPtO7FGGycqmKcJ46IEFyEmWxgt
X-Gm-Gg: AYBFou1fMiDw6pk70fwM7qxSN1YVJM9rDR3bUpaO0Rwq0c28TZF8Ni3BezT++a+vyvC
	zHFI9jwptZGDReQCtlmCZyow8Z+h9LYaSnURsFH533X/uvCnhSfn/zn5fYRA4mnct6Isl2GsDNM
	bbNPR7o3SzIqEVUyYg44A6l6ZIX1hkNbg4gqyyW5GYbDh+TiuasZ2zal3dr3Pqx7yD4vwnrFO/N
	0bho3HZW6cxZ4ozgkFBuP7FOL1K4O3C+nrdIencQe9RN07jfWRffpIL1vYlMUVaR3a6rmDaUEBA
	ggW0E4q+V+pz1ZnbEUgtq54Mo8IkTaP/kiCiBRT1aCVuSL2dgmD0AqTINb6qrU4U3u20Ra9UmS6
	xlGskZxyNnMdWzqQ9pdQJ440e//NjEPHaEWOVeEuzXzZXIKSBskmWmpRaqLZ9eyadWXtwQIwg6z
	+RGxhYEbeXU0VFsIPiDUcHSjEuUDMfdWBPGxgude9wRfkFhZSYoQQSn2CrhBWpEXrxR2JIbb7Yq
	6gc51vujInZAQwPJq2cQhtJNP+rP0r+R9vfgCryeG8L8Z9w9UIInieNXe+YeqvI0bpc/Ag1RDbk
	9D3mE9zIRhOi60WP/f2JwwmRdMg6HTCX9mMlPiG9+sF5aPc7fnDKDAgy55Kica0ckP1/p3/yJmM
	TLNOu4PbPs+wmw01l75Op/WfpHa8kS88UuWDop1TX3uEEZ7SMLbj+cE/oaqFushCm9wypB6GAwG
	ROuNqndjZUu11Dv2t5iRrsh1Y=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr13520420a91.10.1793771947282;
        Tue, 03 Nov 2026 21:59:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:05 -0800 (PST)
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
Subject: [PATCH 8/8] clk: ath79: share the fractional PLL calculation
Date: Tue,  3 Nov 2026 21:58:52 -0800
Message-ID: <20261104055852.152340-9-rosenp@gmail.com>
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

AR934x, QCA953x and QCA955x compute their CPU and DDR PLL rates with the
same formula, ref / ref_div * (nint + nfrac / frac) / 2^out_div, written
three different ways. Use one helper for all of them, with 64-bit
intermediates.

That fixes the QCA955x DDR PLL rate, whose nfrac * ref product could
overflow 32 bits: with a 40 MHz reference clock it did for any nfrac
above 107, and with 25 MHz for any above 171. The other rates are
unchanged, as checked against the old code with random register values.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 47 +++++++++++++----------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 8086b4f6378c..f9a8c9b9aa24 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/err.h>
@@ -21,7 +22,6 @@
 #include <linux/slab.h>
 #include <dt-bindings/clock/ath79-clk.h>
 
-#include <asm/div64.h>
 
 #include "clk-ath79.h"
 
@@ -189,24 +189,17 @@ static int __init ar933x_clocks_init(void __iomem *pll_base)
 				 ref_div * out_div * ahb_div);
 }
 
-static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
-				      u32 frac, u32 out_div)
+/* a fractional PLL: ref / ref_div * (nint + nfrac / frac) / 2^out_div */
+static unsigned long __init ath79_pll_rate(unsigned long ref, u32 ref_div,
+					   u32 nint, u32 nfrac, u32 frac,
+					   u32 out_div)
 {
-	u64 t;
-	u32 ret;
+	unsigned long rate;
 
-	t = ref;
-	t *= nint;
-	do_div(t, ref_div);
-	ret = t;
+	rate = div_u64((u64)ref * nint, ref_div);
+	rate += div_u64((u64)ref * nfrac, ref_div * frac);
 
-	t = ref;
-	t *= nfrac;
-	do_div(t, ref_div * frac);
-	ret += t;
-
-	ret /= (1 << out_div);
-	return ret;
+	return rate >> out_div;
 }
 
 static int __init ar934x_clocks_init(void __iomem *pll_base)
@@ -243,8 +236,7 @@ static int __init ar934x_clocks_init(void __iomem *pll_base)
 		frac = 1 << 6;
 	}
 
-	cpu_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, nfrac, frac, out_div);
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
@@ -263,8 +255,7 @@ static int __init ar934x_clocks_init(void __iomem *pll_base)
 		frac = 1 << 10;
 	}
 
-	ddr_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, nfrac, frac, out_div);
 
 	iounmap(dpll_base);
 
@@ -325,9 +316,7 @@ static int __init qca953x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NFRAC, pll);
 
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * (ref_rate >> 6) / ref_div;
-	cpu_pll /= (1 << out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 6, out_div);
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_DDR_CONFIG_REG);
 	out_div = FIELD_GET(QCA953X_PLL_DDR_CONFIG_OUTDIV, pll);
@@ -335,9 +324,7 @@ static int __init qca953x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NFRAC, pll);
 
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * (ref_rate >> 6) / (ref_div << 4);
-	ddr_pll /= (1 << out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 10, out_div);
 
 	clk_ctrl = __raw_readl(pll_base + QCA953X_PLL_CLK_CTRL_REG);
 
@@ -388,9 +375,7 @@ static int __init qca955x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NFRAC, pll);
 
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * ref_rate / (ref_div * (1 << 6));
-	cpu_pll /= (1 << out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 6, out_div);
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_DDR_CONFIG_REG);
 	out_div = FIELD_GET(QCA955X_PLL_DDR_CONFIG_OUTDIV, pll);
@@ -398,9 +383,7 @@ static int __init qca955x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NFRAC, pll);
 
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * ref_rate / (ref_div * (1 << 10));
-	ddr_pll /= (1 << out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 10, out_div);
 
 	clk_ctrl = __raw_readl(pll_base + QCA955X_PLL_CLK_CTRL_REG);
 
-- 
2.56.0

