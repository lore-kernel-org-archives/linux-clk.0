Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70564028DE
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200128; cv=none; b=LBWI5eX8m6Qn5Wu4eev7G2fwdt/S9FDR9AcZ5uOiAwVU0ChmTbJk35Lst/7Od3l5u6t8z0kPp0VpGlLC9NVPTUuCOU+lBoJpNJtJs7vjKPGg+of1ISyCX9aVW/tN+Mvww2EGp2HeIAxsHrjb2fqhlYoKg5g83Rgqn9gkd9hM+/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200128; c=relaxed/simple;
	bh=tDYG3+8XiKZlF3E3b3WpE4A3INkHP9bqPVrhIBkxUdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETTWo4iNnmAuzlttDKju/HhUeTyTGwfNX9v1Y/EHHALWAf0ceUUxOttPAQCt7h3S8PiA3lBpj1jcsZMkVNvG+pKAXBiuqsfIhvDgRAUjezyTMdarWu4Q+0Ni/wu+iE15OlOV+t8zWwA6u/0RypM2qm/WxAxjm6/cWPq0p3vZ30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o60kHnXg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o60kHnXg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so30054845e9.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200124; x=1779804924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYVmVWSUhwTTTImhIixvGMooyyhf3UJ+qaABfiENa7U=;
        b=o60kHnXgWb9eLA6ZdExRjr7HcrasXwQk9YGiQ8SsEevEvsRZL1k3PmrrhAzxWpkJBt
         OM+l+ydWAa5TWquoI0drf3KaWQ8zaYdA2sLjj7846/FDTMASO1UyRlMA7nz/rTgs80aw
         w/vMfYo5xY3ylco88TWQnMW69Bh9oyCYhvpJP+kh1keCaDaeIYKPFxWTATjkV0TQfIa7
         +sp0MWaYzlSWnqrymnnF9tEiY1MyIC1m5BKkXVHiO8Pr4D3g2cCTbNZh0UIEKOHFEC2w
         XtNr/8DVLPMoZCmtGZFvZVc3050gIcTCCyTbBv0TyAASkIKMojKONrt5UyTVNhoK0BNY
         2AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200124; x=1779804924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYVmVWSUhwTTTImhIixvGMooyyhf3UJ+qaABfiENa7U=;
        b=hn+bXFxcdVZ4sUOulPnLa/vs5F3uuRArDae37ttZSmHk5CzXp1cX3p9NI9rqmPhoyV
         5P7hCqIz0m7BMJMViQAKs1kK+5LK3ZD+RD0UbcZHUiQkkWmzAmkA2oIfOAtszJT8Ys1m
         4Cwx9hST72WuzvSOFPs7CIiDgLzrSgoBe1NmcB65wMPcRy/uPNcXJkZ+8671wvkm5K6d
         vklrMekPpB0GDv1sCcmrtqitemDKKBnUlsbxEBf1IWTy580w+gIPFItoAOBQWHKpy8+B
         XhSGTqqJ8XI4VHj9NJoMNai1+/qWKAh+sNHlKLzeS8neVPE9UlE9aRmA5PY9MsMLz5u4
         hPXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/TlOB2mlgVefktzjmVN9CiK08VhZSNQH3QcrGAR7PNuHCFwgm66BVPFGha/cy2WRepWlGLFWsvA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKlFVr8vdfGDiS521kFh/awuDopWrQWj0eiwVJelow6KNCsAF
	ZW9eCCFfrbS7lUfSvF2NJIOHc7HG/4CbiKSI+ySw9JBvduyHh/AFjDg3
X-Gm-Gg: Acq92OF9M0zN6RM9d7jKKAnesiQHTaWeXHo4P5K8b6oWtWQaLwTObgJ5hwN6dKYS8ug
	oW7Nwqbn2ETAmQlCMEyPi3ZZVGUyTsrAojgX0TeBDYXDr04i09/kA/8KPMpmZJxv7tcJAzQARcp
	6sefiYrhyrGQ3yVIGPsKZjIbEx09zhLoFaVAD54W1/cONGXMKIlLU9bU20RJE8a+HUhUiEoZRNt
	+HK8OjZDnFU1EDerl5MXGGZwBY6W5vamICxa/9t9Qa1+yHXNLEH3qpwFz6LKaf9MYT8r2c2ZL3R
	B9mY3uaLL0upJwXWw5w/cNH2osQjj8S9zuYtazLgf7tdBfoMjqwry7Mc/rVOKkH+LV2x1A0YfEf
	wSv0/AvQpaBBtmtxNRjh4HaJsa6J1zYZWwVWXjf1dLSOukptjXpTm4m8Q36UoYf6uoNtFNWK+fT
	j3j8fnOYMqZeTtiHfgyQzzVO5z1QysNqgpOanIZfYyBoAuJcbS
X-Received: by 2002:a05:600c:8592:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48fe60e5235mr228206945e9.3.1779200124022;
        Tue, 19 May 2026 07:15:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:23 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Tue, 19 May 2026 15:15:15 +0100
Message-ID: <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Rebased to renesas-clk.
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

