Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDF31716A
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097236; cv=none; b=D3eKJDLlEZgdk0azbSs5JkD50RV4gLqrzMj/PpE5kq5QdiKqlr+yvbzqlegwpZuGPFgJdmWq/uHfUQoFplLpY3775KEs/azJ1G7sLZ5nYdtc/PEArQfkZJvtLx8MGv2WNTDjbulnlmNGYg2867Zd6fTMaP2s+LZlvvv9am4jNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097236; c=relaxed/simple;
	bh=vFnnStHDXR8ewaWHn4g4+Xi5ZJmWAMSw7S7Lo5Rskho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lilFlL/2Exp7c0iefgb9dNiUPL/aMi9/gOX6PFmJx/9kX84TSgMS+iAJQxDJ4INjOyJRnNksjG+1fhepiRkcdHfTyzGUJ2UT2MjtKWLL0bzVp/fXCADamB++1f5uV/lhTrpNR6hS9M4K/k0T+y4gS+lJa31vvraeApexvQkju5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN9AI7+R; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN9AI7+R"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so11204325e9.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097232; x=1779702032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmDVl5NDDpXc8T5NYdMw3tjaV+BZGsR3SiZ89rjc2Rw=;
        b=dN9AI7+RwiO0pcQdm1HdX+Yt5f0a4rZgRCHRiRa1Yg+mQOycdVpfL7r6hrnCsnqWyl
         4X36rkHQ4DAhqbk+o36iXraSIbnfFbDf9kX/vyVUOtPjUQB7u9AkUQX8iRXhgRPw79i4
         /RjaHRA/nxI8hVw5yoUDTPyhNPJU6ji/Pu7q7YqIcWYZs92huJbQlY9A1jNhhNSwJO3Z
         J+LNPvEyc9r1eeg+LoYWpVIItejyRiHLmRiu7PmREZBlxUIJnrayjwJ+vNS93JF/QhKA
         ZhAtFhee7d76gKftOEP67i2Yjld1Gu/Uwz3TdyqheFdIpPl/PF7J4W0QXff6462aQ9zP
         4bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097232; x=1779702032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmDVl5NDDpXc8T5NYdMw3tjaV+BZGsR3SiZ89rjc2Rw=;
        b=WFVK8ngvshVJtGONJZK6LdGOIK5AbbStqClwd6jfOZoPaXPGZcfUlk8zwi3qKwZCil
         p1KcECA8IPRcq5SAFYn8DJRtNTQygBGr8rAGb2pE6Xi7mwfd6cd2hLXjmWl+wVNrT0cN
         BIdM7FieHvR3uKUfe20DLrtNSfPM0HkMqhDEO6M/7i9gZvjACBIAb/kuttkKN1L5CwrI
         D/czoFwUz35/NBnO5d825ApA7xVRNqRCX5gNwq/RACWMCj00oV7UMjNJ0Y7l/SygFXQA
         OmjQJg1xORozs9YQmVNFRHDSnoSasfkju3G/HZJNSWsXiRtV8rlFBLlbt4nyYRgiTKXU
         lmAA==
X-Forwarded-Encrypted: i=1; AFNElJ+nLxIs/oTbUqjhLkovAf5aR1lzWmkWWXII/TuO2GTvzWukFBruUNAsmWab066O9y0IIsijOnA5dOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkfAtCK0NdHKMpQ6IY4Tkn+7NqkgXQ8mJtYEpZjnUE/jrr6mL
	z+C1fu/eW9EXKamjxD/VtSU1W0gjO6K8iqUqN9rDjHplZjqV+6vH73Lc
X-Gm-Gg: Acq92OGxa3u+EM6d8F+YOiQHUbzJgqXRCZ8PAa0TLupbQWfZMk4UX5xZkNWNOabTnSZ
	Y7J3zRzY2Y0oUlpNW9ke98s4+vfq3D+b+wx9hDfS4uevxo8Ye+rPEzdXOV2jk4HRcNkfSRC41t7
	EIo8xoSqaj9Dae8/+o2ZK70WHanHrCfe0pFHZZ+9Ymsf7wUGHeNj69vB3N3V5uJZK60HjKOuz0y
	SWbA+KfUD8VYDNIAXH7gfo6E6JM7fAz5uQL5Km5ubZXO+LtL4znMGi071lLBhayyUxPCZx4giuY
	Z+C1eEz+covRVYG0S9OmDldzuM9yWZID4mkZfxJ0YW5g2WiH3EfPToY8cHGcqDCWGPZMrSeHnni
	KslsGeH+vswOCLzwPOu8oJNgbkAjpe0EsopJoNRLU+OEatDI7qJI29F3+OB7PQ6VOj3FdAQ05W3
	fqqcPQw1OcTyPQPBLOsmCZQAAa4zkSIa3YkJEeqwMcrp2h31Z1c4IAxN9V74E=
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr191916225e9.10.1779097231774;
        Mon, 18 May 2026 02:40:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
Date: Mon, 18 May 2026 10:40:14 +0100
Message-ID: <20260518094027.95700-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
References: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
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

