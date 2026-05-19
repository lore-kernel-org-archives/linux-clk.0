Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259DE35201A
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200126; cv=none; b=t8VQeQgCr6ciathZ3M7536XeOu88+b9GXBSnuySAu4Bg/oJpCwsFEPzek1nbqqjXOdKkiN5NHPghqG//mJz/kCilmmqbBoYgiBqYArTgkc0Bk+mbDaFYzRqWt9zHzZeqUjWVuSrGMpRtinnm3y+F/yHQFxR9sg/5vmF/NnCYOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200126; c=relaxed/simple;
	bh=pxo7F/tChpy81PH8CXvEavW4XJAGjkb2GYq5cMW9O70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3PlVwhtGRO160XofxzhrB1edyIXDOv+uoQ35eYazrhn3h20FMw/CZOqJvS/ZnrTLjPsKCdpl1gdQbg9qcnFJBmDm5U2eOyV5EnqF9SaXRbsGorCDD5D1KSBVkfIrmCL1q8XPVFdKaEUseSNf1diAdxuOXMz1lW4v52IwUuXp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+04coke; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+04coke"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso44361635e9.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200122; x=1779804922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQpJR4lnY8iF+dc/T45GTK0kwfTJMPwYvTImeEo4ULw=;
        b=r+04coke2Fyly1xesVt63TrjEHRxw8LXp/vil3Si/Y/C2tLleU2rBX0V4et1O55hBY
         cRuHUKX/O5ByiB5q6SV78Cji2E2OTRPeflNoZ27Bg6sraPcsxlBH+WpVLvN1B7Ig2Wuc
         y1Df/bahNTAkMNEiaDBUeWJ1PoWNKKxfl/2PxQMMkFf8pXreTNtHfWxpD40Q1EuGtjCx
         JweodHBjsYMLdUQbtrHqMELVB+bW9Bmxr7mrJz4TEFETaiKx0k7IYD5X8OPuUneVN5yR
         mBHvb6hc+dCfci0pauPmSntpEf+3MjcDqPFGQMMnAjvDqKM1E0FUow3POvQJ6mVboj9k
         RiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200122; x=1779804922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQpJR4lnY8iF+dc/T45GTK0kwfTJMPwYvTImeEo4ULw=;
        b=Sao1IWw3S9UtLzNCW8o4HXnQHGLgyKJMXXTNwnVnzmfEA8+SB7BZUkXCNeco8vno8Y
         EznIuXBcFtoEi8YEG3NNJ6TzSNJoEOiRkMdOyKmAbyFqlV0OPES+TKf+EiAVnF6Fk/2E
         /ikZskTnBGBcm9IkefY/Sc5Z88LgUY3L+TUz6mpFEG70RzYXBdIl6fVgAMHjpVTHOsXP
         JfjKHQ5A2ARnv6jdpZddoeYV9kY9o2md9ceCDBqFyL17GgjtiKTyWtZn1X3UCqAd83uO
         F0jKmejTFx8saWKr3ewx46sVSDoq1uKIy/TlBZStX0apTHdDV5vmcvL3Ivh+ojm+D6rm
         MePQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lBw07B9L3VJW/O0wxoYomyB1gZMddjuR5Y0DvNKgWGr0d9VOw0h5Bh20VSBd1p6r/+sCttNa1Jx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn7w23ZUIQqfncMohaK46rMBnympBHg61RpTgRrA9oHBe4jvZ
	DuKzMiuPMCK3yxl8GBL7pgD3PIHQJQG7OtjakaUObk8poGitYrlZjrXw
X-Gm-Gg: Acq92OFPfMeXpUyzlK15ffh63Et7ep+eE/Wq49Hy9HfRiDRvh0XywYwPiF8IH+NQD3X
	tf0sMa07CiS/3GwXRYLw1QwHlo4QeEFP5FMs27c8nR0M5YraLJB3D7+hl0tmTKgG7noJxlTyaeu
	iagRE8Rjob3uGH3HDMO9pURuIZLg0bYX8FVVS1wOqIxeJegKs1+wamost9oi/LM4VXWnIKa1IQd
	sqfniayVIcKEz20UberPtnXsn/ruyP+NH4W0u7PwhqMT/gl2rWxZ0sKZwDsEcOObbmGhfnA1AAl
	mW7KY+S5oOHlLvbVVgh40RA14+q8KMY1qwtlrrb5PU64htrm01uiksqKjys5+zY9MNhmmCDVSN9
	iot7wtq89EMeIe84v0bbu3Rwm2sDVpOEEsuQxJmljuT7MaZ7gvLX4qatfVsgyLxuv2o1RUOIIMn
	GrwQpfTsfDFEzeY+Q7y2+adzPXPogu3HRPlr3+I6TTU4nDkv+W
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr252146205e9.15.1779200122174;
        Tue, 19 May 2026 07:15:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
Date: Tue, 19 May 2026 15:15:13 +0100
Message-ID: <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
standby register offset directly.

This removes the implicit coupling between PLL index n and register layout
and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
PLL4 definition is also updated to use the new macro with its explicit
standby offset (0x100), removing the local PLL4_CONF define.

No functional changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Rebased to renesas-clk.
v1->v2:
 * Collected the tag.
---
 drivers/clk/renesas/r9a07g043-cpg.c | 2 +-
 drivers/clk/renesas/r9a07g044-cpg.c | 2 +-
 drivers/clk/renesas/r9a09g011-cpg.c | 7 +------
 drivers/clk/renesas/rzg2l-cpg.c     | 9 ++++++---
 drivers/clk/renesas/rzg2l-cpg.h     | 6 +-----
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 70944ef8c5b8..59d6ee2e888f 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -103,7 +103,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc", R9A07G043_OSCCLK, CLK_EXTAL, 1, 1),
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_SAM_PLL_CONF(0)),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 2d3487203bf5..913cca6dd46f 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -159,7 +159,7 @@ static const struct {
 		/* Internal Core Clocks */
 		DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
 		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_SAM_PLL_CONF(0)),
 		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 		DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
 		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index ba25429c244d..a99ab1375f07 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -16,11 +16,6 @@
 
 #include "rzg2l-cpg.h"
 
-#define RZV2M_SAMPLL4_CLK1	0x104
-#define RZV2M_SAMPLL4_CLK2	0x108
-
-#define PLL4_CONF	(RZV2M_SAMPLL4_CLK1 << 22 | RZV2M_SAMPLL4_CLK2 << 12)
-
 #define DIV_A		DDIV_PACK(0x200, 0, 3)
 #define DIV_B		DDIV_PACK(0x204, 0, 2)
 #define DIV_D		DDIV_PACK(0x204, 4, 2)
@@ -131,7 +126,7 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_400",	CLK_PLL2_400,	CLK_PLL2_800,	1,	2),
 	DEF_FIXED(".pll2_200",	CLK_PLL2_200,	CLK_PLL2_800,	1,	4),
 	DEF_FIXED(".pll2_100",	CLK_PLL2_100,	CLK_PLL2_800,	1,	8),
-	DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	PLL4_CONF),
+	DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	CPG_SAM_PLL_CONF(0x100)),
 
 	DEF_DIV_RO(".diva",	CLK_DIV_A,	CLK_PLL1,	DIV_A,	dtable_diva),
 	DEF_DIV_RO(".divb",	CLK_DIV_B,	CLK_PLL2_400,	DIV_B,	dtable_divb),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 426e93dc7a98..ad9aab2ecc62 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,6 +58,10 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
+#define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
+#define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
+
 #define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
 #define RZG3L_PLL_STBY_RESETB		BIT(0)
 #define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
@@ -72,7 +76,6 @@
 
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
-#define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
 #define GET_REG_SAMPLL_SETTING(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
@@ -1093,8 +1096,8 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	if (pll_clk->type != CLK_TYPE_SAM_PLL)
 		return parent_rate;
 
-	val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
-	val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
+	val1 = readl(priv->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
+	val2 = readl(priv->base + CPG_PLL_CLK2_OFFSET(pll_clk->conf));
 
 	rate = mul_u64_u32_shr(parent_rate, (MDIV(val1) << 16) + KDIV(val1),
 			       16 + SDIV(val2));
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 33f54ba0e64e..17ec6f285c21 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -58,11 +58,7 @@
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
-/* n = 0/1/2 for PLL1/4/6 */
-#define CPG_SAMPLL_CLK1(n)	(0x04 + (16 * n))
-#define CPG_SAMPLL_CLK2(n)	(0x08 + (16 * n))
-
-#define PLL146_CONF(n)	(CPG_SAMPLL_CLK1(n) << 22 | CPG_SAMPLL_CLK2(n) << 12)
+#define CPG_SAM_PLL_CONF(stby)		((stby) << 12)
 
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
-- 
2.43.0

