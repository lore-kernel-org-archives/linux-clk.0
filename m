Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF683E7BB5
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097239; cv=none; b=jyVTAi25k0vonOylzMDcwUywWcE+i4P6Kl68Zfdr2+0+jUcmDjTiXnxH/l3wDYbkzSYHiYF4TVVzychVSkAbjIQOL3NTXyBzB1Uk0/orGy+My+/ozboTUG3OUkjJSLzm3PtthoJa0B4LyZNgh9uri8iIznbxrwnVqWm/ia4JVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097239; c=relaxed/simple;
	bh=PSZvLruQWF9KVcxGgzFEq6toAggI29FIiDOylO9wsB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2GQV5Xmj+MJuzDAtywCUSmAGpHQHyVJf9+7Trivj8RESgOxCb6cICptjS+/kO+jajx+bT1U6jP8Kjfu8jg3w+WEqAAxqkHNAZcsiAmIVs8TH5L774/amAXDAjyPOrVUBCcXT+XZ0jCvYsJDAcRdxLExV2Uy+mouYFmo8JvMlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVzixRLY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVzixRLY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so18085485e9.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097234; x=1779702034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/38OFBmgQJL/SrbqQX032t4prIcTBJUh9cxQa+r5c8=;
        b=rVzixRLYxsVjOfUnvWqy35E/Q//MDsTbqGdeF6vWdy9lyOR0X5xlJNoF5+r9IHzl3l
         5s/2fjP11wGKYrr84V4p2syU2e7YQmsZI9mbIgWoP+xlyx51EcZ82lnPtJUB1K4NO7qO
         HkTxHdAOKJ9L36SLqzWWouPgEcn/iWVCHsICMU2bm8NXmjvqrYjs6Q0dms6sg4BpXVTd
         SoqdIlWu6FlroRYS5UANz2zgBjzoW+f6qa1xlFn52azhsFcsTzA031kGaDuCLemwsrEz
         VtgQN81HhxD5lmsiCVnxbqDCqdOYaKpDKxAEdyaqSwR5sSNgfa67ZB3DQpXuiPVqxCJr
         EeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097234; x=1779702034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/38OFBmgQJL/SrbqQX032t4prIcTBJUh9cxQa+r5c8=;
        b=fsUT8Z1KgbjO+6mbR/UvBO5FaT/BN27DLkSQbnIfv0m/4TiaOL475Z1kfI1n6REr6j
         kCj8WQAwERNTuAV5trEftf5ozmSIegBPsFQhnLcMghD6rGc4tzXBJ01HAd30BnuKT4bu
         d7gq8MqhW2/gef4gxzUTKq3Hxx0PINP4LjuCcoyukjCrNOpRT5jdIe5VSGvUiCCxLp3a
         h5481nDBmQRt21O8oIPcL3R0os1x8yibtjA+dE+8HfF/T9gQkkvDTkW02xjG6nnvGoGz
         Wjb6zczXOkuugC4TEhpBz5fVNaOifWUCVGKxlGYIvprCqj2HsnsScM6AT9+qqUZ5k0Y1
         GJ5A==
X-Forwarded-Encrypted: i=1; AFNElJ9lq7t4M+I92FErMXqLBhMxrPcRxyUZ/DG/rlpdodbmxkS4I8DxOato7bEccXAAg7x3yJVZztZx2T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziSBCrWyyxhQtKjdzbOcbb9Cn2xtwqS3YAjWS8IjGj7bEJLT2x
	pbwMcOT/9ntGVRNlLV9J+ORoBfnfJcIT1vtGxGFg0tGUnUw6M1Sx4Ksl
X-Gm-Gg: Acq92OEWNkLbpOcsaBu49WJOxxqyGQoNpLXAL7nWIvuHC2pAdVgNz0w5IsnS99ouwCW
	+eG95o6pQQvs8HffDn8rvaE/ksldcc2l8s1HiW1z6SK7QbnFUJAPPeiioU2J40yhF2aGV+tkat4
	XhvSWviY3x7mLQ8PrVlKOxZS+33nLLKvAO+jcYqTVCjS7rF5fDOtjiXplcCsmTaIDvGwhtkHjyr
	2nbE0LZcFCFBN7XQumE6OaJ2N1ShQg1eBrPwvX5uyj+TIHJtV68Y/U7SU+Ul58JlP9/MqOLTaSq
	tNdEvXCcdtI5T0X1nibf4q5P4qAbtJuvDL/uFq92kgLwiDZbjQMRfKm0sClh54bDT7csJe/5tgk
	qmVEjvBbOp+DPN6k84NUVM1dKtrzw8uJ3e/Eit9qWW9NbE0IgJ7pkYpk0Cl26exMmmmujFaR+Pz
	aNBTjD1EnzRnTlUThbyd6T1SWizdvN8ob8k50z+X7oRrjFZKGrMYZHlZ1Ndl4=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr202326865e9.26.1779097233874;
        Mon, 18 May 2026 02:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:33 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Mon, 18 May 2026 10:40:16 +0100
Message-ID: <20260518094027.95700-4-biju.das.jz@bp.renesas.com>
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

Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
these macros are not RZG3L-specific and are shared across SoCs.

Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
CPG_PLL_*_OFFSET() helpers introduced in previous patches.

No functional changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved CPG_PLL_STBY_{RESETB_WEN,RESETB} near to CPG_PLL_STBY_OFFSET.
 * Reorderd the above macros
 * Moved CPG_PLL_MON_{LOCK,RESETB} near to CPG_PLL_MON_OFFSET.
 * Reorderd the above macros
 * Dropped a blank line.
 * Retained the tag as it is trivial changes.
---
 drivers/clk/renesas/rzg2l-cpg.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 096901e25317..0abe00e2960b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -60,15 +60,13 @@
 
 #define CPG_PLL1_SETTING_OFFSET(conf)	FIELD_GET(GENMASK(11, 0), (conf))
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
+#define CPG_PLL_STBY_RESETB_WEN		BIT(16)
+#define CPG_PLL_STBY_RESETB		BIT(0)
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
-
-#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL_STBY_OFFSET(x))
-#define RZG3L_PLL_STBY_RESETB		BIT(0)
-#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
-#define RZG3L_PLL_MON_RESETB		BIT(0)
-#define RZG3L_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
+#define CPG_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_MON_RESETB		BIT(0)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -1188,8 +1186,8 @@ static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
-	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	u32 val = readl(priv->base + CPG_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
 
 	/* Ensure both RESETB and LOCK bits are set */
 	return (mon_val == (val & mon_val));
@@ -1199,17 +1197,17 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 mon_mask = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
-	u32 val = RZG3L_PLL_STBY_RESETB_WEN;
+	u32 mon_mask = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
+	u32 val = CPG_PLL_STBY_RESETB_WEN;
 	u32 stby_offset, mon_offset;
 	u32 mon_val = 0;
 	int ret;
 
-	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
-	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
+	stby_offset = CPG_PLL_STBY_OFFSET(pll_clk->conf);
+	mon_offset = CPG_PLL_MON_OFFSET(pll_clk->conf);
 
 	if (enable) {
-		val |= RZG3L_PLL_STBY_RESETB;
+		val |= CPG_PLL_STBY_RESETB;
 		mon_val = mon_mask;
 	}
 
-- 
2.43.0

