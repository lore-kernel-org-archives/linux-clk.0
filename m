Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473813E0C5A
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905933; cv=none; b=QoN57fAEvy4C3BJbSq2OmiQDblE5DnuNSP3r1m1TT0A7wMDpVdwGPC+j7mdtsRWPJ9LF8vDnFyh6YtrIbhtmbnErkdfdo9EyxEQO1D96CbGsZTVWlEEcsan5MfxxtZNeTvnRIaAA2zZrqOvP5qYdugLA/IJkhqzOf2m2OjHGB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905933; c=relaxed/simple;
	bh=DvSb/KRNVV3hvhkSLVMtHE11LLpVX9uZOzPUpgHDgA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlf0txrUeGCHW26b5hxKej/HjPWIt8Mn48wD2c/uIwHwGGSxwWh3OwjDov11sigBujafMPkhj70PCkUpl2pF5xeJESM4utw3ujsWpahcl4pXLe+kTuVzH1l8P1mIpN1WMTl2OmUCooHy6klzV5jEVuAYEbjBfb4s5T9yWRI5Nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7CFAv+7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7CFAv+7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d75312379so2915715f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905930; x=1778510730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuEh6EHtxHCxSq+G/rcSFvtM5yky+sac6bh6RW7yjz0=;
        b=C7CFAv+7lNgu5wMmZO94TyRa6Rd3QI7huAJUY9KE+lZ/uLUECkyq7deSfH9O/IDpmj
         WRY9FoTNT7u/LOh2Dlz5At4x2+Nmu74BC10NpZz4PSAoF9Kiqp2Tx9v6vFqs6/zFbDBS
         xLmvUV+/yc8sBugphH9KCIz4dy5dKvomzEtBxAzAFeocqmlECGygo6qk/u9Zc+odJjxm
         oo+7H32b6H9/Qxu5QwlaUPrlGmy5RYREYhoGCLuXJDY2Y/IkSb7TygSC4YP+LZHSN96w
         ZHwyQ1CPyt3nFjWuCa8bPz3wdOeCNhBZ079xeSla1qXIENo0sqZi2aDJR0fZ0rZ9w2ni
         A24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905930; x=1778510730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XuEh6EHtxHCxSq+G/rcSFvtM5yky+sac6bh6RW7yjz0=;
        b=QSE6tiMWuq7EuyH0dINS1vX9yZjyaQg0WiqEK1VXKLgfmq1K+jUjEJOS3oTRaLfOl+
         8T+PMTWIVEiEUto9wf5sRRd1HyjfSATGBwnyLTpXGRCyNKwz/y3PcXEhtaWstGoZRz61
         mZEwJjLJy76YGom8iFosXw72xeA7z7MMWzjfcNtidHtYRfPvsZ+6kikjPlFXRMQNRm05
         XdLsnUWh0nTGEgdks1GTw5NezcxJSkJq17qwTpC6LA+x3b1el7RCDrp6ly+g7sYt3jHL
         tQd2LaI7IRTJlkYrZ5PsSD8zFESh34hjZiCL7F1xI3nqFgAdzLVJlp9c4KAIK6j1sm5D
         Fvwg==
X-Forwarded-Encrypted: i=1; AFNElJ85GHkZHfGedzRU6iQf/kKSBRsiOperg1WYBnthUuUq3sX6bW1J/knnbL4+1juXE/kRpCjgr5GOl9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Jr291HWQGMpYXzrSmU3nUTOjOMvcnbiwpSzCAJE+TzLQMYak
	XraRNTCBC3qexTDgxaM4Xqg4vLRLZ/SZElYMZwzpUhY5J9Q8/nlv9tUz
X-Gm-Gg: AeBDievMrBR1Qje0Oa3YKYRWTtmDsPOZJECIqCSymT5WIx8JMatK1Xp1z+Ug6yDl+Zi
	njOWG2DwFgQ+pURmvvYjQtyVdkGWLP6guDhhGq4pbSTpbn7ObeCh/E6enlkeNs/l0QYwAjzYd+V
	2vc9GhorpQyoQE4NPXkAlWTb+xqKEvCZhvDIYtq5cOhl94mxokbaQdZelEuxvIZD7iqh3JObA7B
	vMub5f2kWlgaIvL3m1Jr+QYER4Al3jk5oLvjPbfl6aHKlOOc/+FpqFu403vLA7ny1/1/zwN0i1t
	t3+WK10K9Jxi9zYI/zeBA/IOJW2enoTS8PV8g6aLXyo+FjYGH6sbRdZQLopZvI/sG/Ti0KXbgDO
	tKZIfRQboDtITLMPw9+nZFISOOq9mfwmZJCDWc5j01bmtHuAeVVRagyhiWwJohpfgosWpSrDF2b
	8CToNt8QbdrqlxKor07HAHSEG8NQkgkvdYdoiWWj+Kt7ED7srOjRBvrcUp6FU=
X-Received: by 2002:a5d:648d:0:b0:43f:e571:184d with SMTP id ffacd0b85a97d-44951508317mr19130124f8f.28.1777905928444;
        Mon, 04 May 2026 07:45:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:28 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Mon,  4 May 2026 15:45:19 +0100
Message-ID: <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7e5173a37f3a..498f2f1030cc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -62,13 +62,12 @@
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
+#define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 
-#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL1_SETTING_OFFSET(x))
-#define RZG3L_PLL_STBY_RESETB		BIT(0)
-#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
-#define RZG3L_PLL_MON_RESETB		BIT(0)
-#define RZG3L_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_STBY_RESETB		BIT(0)
+#define CPG_PLL_STBY_RESETB_WEN		BIT(16)
+#define CPG_PLL_MON_RESETB		BIT(0)
+#define CPG_PLL_MON_LOCK		BIT(4)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -1218,8 +1217,8 @@ static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
-	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	u32 val = readl(priv->base + CPG_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
 
 	/* Ensure both RESETB and LOCK bits are set */
 	return (mon_val == (val & mon_val));
@@ -1229,17 +1228,17 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
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

