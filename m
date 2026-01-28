Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6F352922
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605141; cv=none; b=iOrBHlSKtytdgQtOndUdUhTIbddeqt6LDUcruyfxpMGEXXV176fqIzpZ1Mn3hUG7P6yS7O1WDA7mZUpmxH/MCLIUDZfruNDH1pTSLflNJ3kTrp5HeIGWPvDhgJHNRVoU2Ii/n8l9KBkqymx1deBxYaDYRbXqfgeWskXRfe9PgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605141; c=relaxed/simple;
	bh=7YFUtgelMFOVKpyb9ypVosVyngqWrClp0du9dlcbdrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqyUiYC2eKVJyT+D51VVkNPH40QFuRmLvaNY+iGC9AZvfg2xoMbGfebD12PjTTN42oEdYCogZx4RSTAjl3I1CzFxAdf4MDcQndXj3hkKHrHvd3+yR3EPwwi0Xx0VRx+7oMIotYT64DCCQtWJ0SYRRJAAemwj2U1CUCw1ZMfXQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/tU4+Yf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/tU4+Yf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b885d8f4092so955362866b.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 04:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605137; x=1770209937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0g+MkC89noAM8Vt0NYxoywKe+JcvmhVaQUgnGdd6tI=;
        b=Z/tU4+Yf/6hMSM+v+WmPKp+jhNi+s6t7nDYi377Wl27ibFvUJndU15+5MEYigbr06Y
         mrHYmmb+8SzlEocbu4zyqHwMNqMVFrwCnydjwe0ZDqz1RBxwoB4tbZJmuJU9jnV+dq6F
         1kRBoaioQpQjWxpoKO8tCyzmohIaUcwCFWpSntHpPgTvMPen1Y3utwrPUz7/6wnIYIc4
         /r7FlxnORa3krDthL8qAcUqHQDVA2rmRve0DC130oKq1x2DndJFu286rDqhskgzy+sxi
         TbGjfMwRIqL31vxrBJ9H0HIZkx3clvux5e5WxbHbrH8SwBhMw6aT4fKVkXKj6TEpHZdH
         VAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605137; x=1770209937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0g+MkC89noAM8Vt0NYxoywKe+JcvmhVaQUgnGdd6tI=;
        b=BGXEsfcCKvnWFQE4Tp3n0I7VjxCsh4lBEnMS1RmgjBJsw+n0lC/Q/d1vqJjGcI+8AH
         O65/QV7qzZSqc/dmRWTNZrsAG1rWcArwbxBQPLtQSWmEeRGTWUWQU+DQmyXSZBo9tcvI
         2e/MTesszAhxxaQ+ne2oHP04UAt8ls2KL4JusKVVXONb3OgCHG2zMAeAB5IR9UHcjGNw
         pUbxMD95KHYIq4slYINMcpdT6jx41baL8oFFBYssApgGLcC9mLARgkAdCB8zkvE6BE7s
         MhoLmPALN8FXCex8SUv3smuP/sHTAVGsyVkC82678bu701jKWK23N539g6uBQsP7zFpH
         zMOw==
X-Forwarded-Encrypted: i=1; AJvYcCVt0Fx8CN4C4xpQxMyxhTBhQ/OexvMNmUWlME9iUlaEMsE5QfKjOUjKJLh5ifElZpdIkRnER6rfo8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/X607XS02e2AjHMJwL93pFymGnbnsyreKWqcw2NzxM6Z8nkJ0
	kdLvle7D8i9In8m55C4itVX/CkyjJzgAAJTETq6qGGF79OJRtNcfMUPO
X-Gm-Gg: AZuq6aJrbZFnMP8SknSplwXs8j3ccpceWAYBFEypdj5OMRiDZ8hWBQInaxqfxybxV+5
	qwAqIW9HaykIvPYGbDi64f7PUR2yzF17FMJfSep+HmYE3U1W/s6i25X1fekkJp/Pyn1mH++hGqE
	jtl+HWwDaelsCckDb5YkWlJLIYYMkAZTo897XFJmBB2K6xGe9IhejWkmve/cSoNSK1hV4L2fP6/
	fSb9Vksj6LicCE1aomAVaKHlNpw2hxtUaDm5LGhOoXF7nHa0fBCLoirUbNE6I7ud0+/0wGN2eyz
	Gb1Ijjh2TcLukFnLw9G0Sv9xxB6/irpF2kroG+IhwJurREuZt2S4Z3vrLTGDL4SV3g7UdTeYzai
	5asAvoIb/QvdkrtPNkJ31Ye8p7E8AKSbGD4xJrNFr1qFlHtceHODtJJl9voLCJ/xOlSY2KY+Xii
	W1acClKC4a5hHgEV9otwrrLUc+wnFrwl14HxDUgFc/qKU7kA==
X-Received: by 2002:a17:907:7245:b0:b88:5a44:fe27 with SMTP id a640c23a62f3a-b8dab33cee0mr379789366b.42.1769605137055;
        Wed, 28 Jan 2026 04:58:57 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 3/8] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Wed, 28 Jan 2026 12:58:40 +0000
Message-ID: <20260128125850.425264-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 16771a0101bd..ee92d07c6ff7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
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

