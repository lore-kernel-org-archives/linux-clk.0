Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E23F38F943
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375196; cv=none; b=TvkuVs8c/WwxvAX0mkgFs7cM+Rj3+uMZS+knC+X2XZLXLcKrLVTdSYrHYXmBTyC4aE3MJEK30T1N3tPq6U2kHEKMhgBnrIpwDlLHFWg0Y2ILmpcoLS2P0kY9iLUnzsIeszhz7hK2Du/BXfgR8prE7lY72fSWfQstr9FwdxR6d0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375196; c=relaxed/simple;
	bh=ADGZX1kaLQxBtMAwjetAO0IYz9qSFbFJW6C9e9h65Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ht6YLWK4n04oR3Woe8knFddqYXznGYOwvkWs2tdeDRGfJAhCgIkMIXcmZNvj6U4AUoN7H35AEZUyV0Hh71ecHL0Fv5dWaoclzXU8+9WbvBGTjtdIejLiAC9Z5zuu6zCcn2T9Av7ROpfeEdkbjDXW22kxNlVFJqrrI1CtXbowzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzNGpdV5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzNGpdV5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4362507f0feso817882f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375195; x=1770979995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs9Gkx1rz7xGBYd71ho1RwbM3cX0c0FSNNlweHUIWZY=;
        b=QzNGpdV5huY49t4L6JnLwQFu3GZ4JoLrLvNOFtRAKwTMeiJ0Y1IUwVDvRz79kbpLAi
         oNADqPQT/T1sumXkETtM1nQCxfsz3KP2k3u/nvM3dr1fIHOnlLTnZ1V/JegGUjE1vTHB
         GPFd6y2Hok4YxAZCVNoDs7aoA9frM8fZK5AesoqBKQXfw3poICZeDxoku51pIOHye+b0
         jBbji+cxf+kolHMx1ISeENYmgPxdxUR0MtBQPC0yV8xLzKR6NUOhZL+il24E5nPbrszL
         LKOyZRQIfiaL12stkQQQDsNyujJqR25Tk1LZk94HC5OaXNswjZC268MKKF324CAiL32P
         Nguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375195; x=1770979995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qs9Gkx1rz7xGBYd71ho1RwbM3cX0c0FSNNlweHUIWZY=;
        b=J8gpsfIptER7mkLVd8hWxjx0+1eMCB+rniza4/bR6C/ZJn/SZlTRgDhCnsOBLsrSEL
         uXM1tl277CerKSb8f5NVg4HfDC2TvVHbQmkGPtk+36zLga52yGiSUJuUm5oL9WQzK3o5
         K5UhMvFJAzFusjQM+CAirMo0N7M6kgdbdLAG0eLRjWvDFFS+mGC3n6gOCg+Y810n1bLc
         rrT97sCAwRHZYuh8E2agDPUGpeLmv6dx5O6cLCfe9OTCx41CXJBliE1mqnTPPxuxwW8R
         UMkeE2lo7GueNFRhNxKuoXxs1Xefkd4qVDbCF0Rk3mU0zguT7LF0o7hT9c7r5yu0sdJ5
         4Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCVpC7UgJxJntA7dDCtj+QSdyJF0VJLSqoqL4zgBohPaWau9jkj8tk7FZrVNXxzjB/kgoiwr1THvxNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14tOwVk1SWks2PktkF/tpGasZyQ7GzZWLFvCngS6PVpedAZJA
	tMTkEb19LW8FtVejnIkVa8sTdgd655VP33cWZvJJc9FR9pjmQyg3YxgL
X-Gm-Gg: AZuq6aJ4nWeuAqSgvBdBWYQwuYuTV7Ybr6CFBDLpDVF/GOlwZp4REILtG23yUFuITmr
	eFGDcgIjk876o5xIiorLJihJd6tVqcFJMjNzpG6fjwalTZWtMaGIRhlAf33HWC+EgL1gd1SEAEA
	Qv9uBIiexk9oVO9drexz+m2dU6+8W76GeKe8MQ+WH/rSxn65F0h6CIjWMlI5lZuFEbdBLGyN+5N
	8Q+3VTu/113E8jxkG6QSREY9IrML/QeRJESkO8h31MVHS++WVj1J8hTL+hQBPuF5goS/yYOrWrX
	UwzhAagMhyvo2blzcb4RghuEBEMbXN8/mI9VNsnlWHIsgV+caFmRERGhMIJ0+u4jzgOVpEhWavu
	4Q8LZFlWUFhgQQrR2pifibn5THVoRQSzQfQQDkfjHdxkYHZ5Nr+L0Y+9OfxSgdsfx269akBMm+m
	eLMPf5aIblO8E3ZBk3Qg==
X-Received: by 2002:a05:6000:4284:b0:430:fbe1:3822 with SMTP id ffacd0b85a97d-4362938d7cemr3657506f8f.54.1770375194552;
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Fri,  6 Feb 2026 10:53:01 +0000
Message-ID: <20260206105312.231015-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..945e31c8f161 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0

