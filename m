Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0137AA98
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469370; cv=none; b=GorxzuK8tpoGlyVW54NOWc4IL3EcsnyZ0iva+61VL8LnJe5/lkQoq2DLN/9WOW03NsZ6KuUpV5RwLyAYFUcFkQWfF9+A4dWgqhNcDnH0UAf30tsUot3mA0XnhyXew3IulLkR0AAl1hqAiEJsStpXKJ6tSQ8gJV22oeS5hlCg2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469370; c=relaxed/simple;
	bh=QJD0kJuNVCBbkbyw6b+8pYpv8PU8c4zZlSaVQMB0qms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQpR5Z0QDX/9PB77xedonDy/5D0MJuLke+MGH7a7wEmy+aaTZsDKUZ50mO5Yt1ZGzaHwgl8wNDePAVZaGd1CYLujuB/fI6uui/bfmOVl2EARWtzIbHn9rnrAOjGePRedbh3Q42ly96OQvFCqO7/KNAt8T2whhVU+WW5uIen7LJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHJz0XSO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHJz0XSO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so23064095ad.3
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 20:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469368; x=1779074168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=;
        b=jHJz0XSOuLaDL1vMMcrUjfN/JR7UCxUGjiJrnx5E64QoHwqMNsaCDJPC9bE8Chl0p9
         58f1VrLieGV+jlq1gLg3aTtRgqlvSvvlALGRgo+Po5djldLd1IW6HV80MGj8P4/9m1xc
         UTlZ/FTTPTh9s+2V7vRbqpsi93rHGRTFaPkIFt+IpieN463RFiGO+1F+sPVTFuqJ2Jfs
         jCIBC6aj3VXwy2HW8vOIOTABg+i1Cbw3iuZIWFToj6tKZ8RpHbJEr7ZIVR62LnHB6Pxx
         ScjZ0+/KBgrTu/ML9icgukamQFWA/epXbsSSbYiJyvzX07iF/OBF3HBlVGUjowm+KVw1
         GUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469368; x=1779074168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=;
        b=sgWHVaoayBSKb/zuUu5/QHBlTbJxeKB1hJBGOvWO2DpvbRGC86uSyDCjtlXNV9LRON
         n2CjHpFZVdMbii+EgZAw3HMvxJon1gbtekopXOqxz31+OrGVwHXcrJ32hEOAPd6WxyVu
         PY8UTQSIsMKR3jKSBMUb5GJHRusH142GPSvY2hI9Shjk4Eh61NCsHuQzEFlxnNqMEjiN
         W+W9qAmqzD8qZz9XBhKqV9KEV1KEgjSi3zNNnQSTyvyzeiGf7Db+niuIZPo99ulu4Yrb
         NAhqNWFSXgt0kbvn3uAhtqy74FA8B8CRK9Hqvzj4DD3FANyibYX6cE/z2vicziiPsN5S
         UOQA==
X-Forwarded-Encrypted: i=1; AFNElJ+J/WBL3mo5lX/ii8+rDxwAlqDPIH27V/ky61uIL9K7BHXLVE3g426t6lI0DvgvilhFJcZ0rgoxyjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPQPOatYP43FyU+kIgcIklG3ioIaYp+o7UuqToyaLh4ZkopUR
	RyBtPLcrsXE7Df8JDDT3GCVTIVisSNDRsZA194zkdODTZpizdnfC04/m
X-Gm-Gg: Acq92OG2SvcqwEok+W6NRl7BveUqyuUh+oBEmItSvhsaczkDXMcqYSGyVLLRj0dGwFe
	XFq7T4SvYy9u3hQtdvZlBhpm+NX/MJubfEHU21h22ZtnNEfzpRgUpsebpTcE9CogUfww3817FRf
	qQa4lSLAdMopheVyIVQEJ3Mo7kUMeVp0pF+A5B5D5woi3N1Fnx7+3JlQnXVSbi7kO0yBTKEITAk
	F39evNaI/tBqXt7v8iaPpxqrbrqJnUFoSCCViZ1sSF6lG1K4yed8PubpparI9o/qtxxmEhrQpHy
	85UljYRuqklnNjfxR2mpapslsAXfsLLsmyCBlX8nJUOqvA3gdBfp3CV6BCkb8RwdrdWfGFkhSrw
	yLKf5icEl6ywi1LXoehHWPXbyIqu4mGm+Phd+kETTm9Nm8tfNbz4R9wK8Sy9VoIRaICtf0Zx0Sw
	7fUn4Kt2dvLYWKRFlCAC54Q/sCuelDUqXqlEVPKpoOCwYMZzmcGjIpwlMJzah0DlFiCoT5JWDPW
	+l9AGIRytjC5KhE9r3OPXY=
X-Received: by 2002:a17:903:1d2:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2ba78f63e3fmr250069855ad.16.1778469368094;
        Sun, 10 May 2026 20:16:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26944sm81585935ad.10.2026.05.10.20.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:16:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Mon, 11 May 2026 11:15:59 +0800
Message-ID: <20260511031600.31929-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511031600.31929-1-a0987203069@gmail.com>
References: <20260511031600.31929-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix four bugs in the MA35D1 PLL driver:

1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
   hardware fractional field spans bits [31:8] (24 bits). This caused
   wrong frequency calculation in fractional and spread-spectrum modes.

2. div_u64() does not modify its argument in-place; the quotient must
   be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
   and ma35d1_calc_pll_freq() discarded the return value, leaving
   pll_freq undivided and orders of magnitude too high.

3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
   to get 2 decimal digits. After correcting the mask to 24 bits, update
   the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
   rounding.

4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
   unconditionally before the switch, but then overwrote its result by
   reading the current hardware registers for every PLL type. Move the
   find_closest() call inside the configurable-PLL branch (APLL, EPLL,
   VPLL). CAPLL and DDRPLL do not support runtime rate changes and
   correctly return the current hardware rate.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..314b81e7727c 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -48,7 +48,7 @@
 #define PLL_CTL1_PD		BIT(0)
 #define PLL_CTL1_BP		BIT(1)
 #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
-#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL1_FRAC		GENMASK(31, 8)
 #define PLL_CTL2_SLOPE		GENMASK(23, 0)
 
 #define INDIV_MIN		1
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
-		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
-		pll_freq = div_u64(parent_rate * n, 100 * m * p);
+		/* x is 24-bit fractional part, convert to 3 decimal digits */
+		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
@@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
 	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
-				      reg_ctl, &pll_freq);
-	if (ret < 0)
-		return ret;
-
 	switch (pll->id) {
 	case CAPLL:
+	case DDRPLL:
+		/* Read-only PLLs: return current rate */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		if (pll->id == CAPLL) {
+			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		} else {
+			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
+			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		}
 		req->rate = pll_freq;
-
 		return 0;
-	case DDRPLL:
 	case APLL:
 	case EPLL:
 	case VPLL:
-		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
-		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		/* Configurable PLLs: find closest achievable rate */
+		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+					      reg_ctl, &pll_freq);
+		if (ret < 0)
+			return ret;
 		req->rate = pll_freq;
-
 		return 0;
 	}
 
 	req->rate = 0;
-
 	return 0;
 }
 
-- 
2.49.0
