Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC228A1D7
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472117; cv=none; b=ek9uYfOLePIm8p7Lp3NDwOMccgckWua6lL5UQx9syQ9flEfrjmVexbillpi2XeRSHx7yogA9g0r8/w4keeYu7MX0xt86Qd4ZYtPtQM2+cjuX5nt2VNnj/8YXTE4oFOBu1h0pk5Y2G8IGn9pVF42ZIep6h058qKesMhcA2fiSM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472117; c=relaxed/simple;
	bh=ahyQI2qcD5lkMjiLgEnAoOsK/OubeAfqZDxEeKCSVto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uE/stHRQLTcmlMy9IhjH/K7qALimZJSl3IOzM+zRIWe/MB9k3NMw3VQXi9sC0RMQYREc2mdtJouWp83PJQ0hWWDs3TRLpFS14ScD2BUi21iIaIRVbRZKnW120zxnUEiBqXgw0H2OqxfcvGy04rrX0yb1/0nGPPP2drMWjfOEHE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Kf8Xll6R; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Kf8Xll6R"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so33002075e9.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472113; x=1755076913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvJiuyia4fn4UQXL1iH7HgBEs0hgCmf79kw9eKxGkW0=;
        b=Kf8Xll6RgvwW68XzxW1RX3Ttdb6FXIHQ7jH1WCN77Sb5q7OIHOk/TcaO8GVg2Kp2qK
         I+0qJ71NPCubS9jOcZoZ0HveVXBNvVrQUMX6FQvUvZTLidckgFsDek+h2G2eK4nGmJK1
         avqiPbuvbzh+i6TkEqpphRuciIY76qzCCYqJ341vca7CWv4pVYdfbKd9YzXQbGCXjsSt
         K+HCLJB1OnWcExW/Q6g5qeeOGED/rCQ9HNL1YuPxbVfyHQSxK7cn7XExoV+LB7lKgHgp
         fc5o6Ru880otY+pK1LuvlL09DE65u3w2a913DhHqWbx7KSS29NUbnQfi+oZv8jKWpLiL
         y3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472113; x=1755076913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvJiuyia4fn4UQXL1iH7HgBEs0hgCmf79kw9eKxGkW0=;
        b=CmHsq11Jeo7ZhVSaDUVGOBfIBkZ44AgcogXgUgbNhloXB8VW6/cjhu/h2uaj4BQkSz
         WP5IBPhtxc8FL3afHln+jqmpzBxwu8yclBL8AFFYO1PH3MYHlxXyhDbbtKJ5KZ9s0+sl
         CaA9lc6H76730Nd4kUkvwzD6CHg6rukBmmmQvo6ndacJHjCofC5ZwhiR6VnZXkLP+iMG
         nvYdihjpBFbsQFiD5zXri++PpJuxugiqk7rbDybRhu9o1WlD160HxDmCG9OIMgomaskQ
         B6DHUdcUP7QDHPQ88jS7ghDS2Dv98kFIzLulncMxQa95RcKJ/s1NFmSccMKI6US+/Jj+
         ZcIg==
X-Forwarded-Encrypted: i=1; AJvYcCXVdMphY9UvJ3v3QR8G8+52DY+erpcLaVIWdX1clbYQ6Rxm95+O1fpksRpD1CN/9OzLZ9IgXVyWbLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNssGohFN8WLD6KFo4dNl/sDfZuA5BT1lmHOqf2TduRDGyPeR
	Ww7IIIxd7hXjDekpasy25MkOjE4qpCgD99oK+ThojSQlnfhXoCY+hNZH5OHrdbpiCl0=
X-Gm-Gg: ASbGnctvSK2jnjzUxqdP1jV0DfT42+YveX4OeWPwBIy0fCXjHjYOZMlk5G4tKAotUyl
	64rPmC1t9seTBJTXQAx0kuADX+4xRVeKXs7wzBuJT8EPy5KbM2jDRt74V8yPce/B2e2epI/5PHS
	4EC8E6a5swUjz16DcmpqhBm3D+adaijNI9vxq/VtKo2Ac60ALqT/QXvLjyi1YNLImMQHHlKzG5p
	LMdQo7JPES1kYmByWN8GbgukozKvxUT673bfeNdEnI8u0s09LYxQcYnt5+aaEQx+9TqEcmQYlYu
	1GiTBSWsrvN810x5K0cNL8haywI8c9tkGVYuuglGoHhgBhSfCyDyjybcPRyQK+TZJn2iF30ROGm
	zZJQnDanfiHJe30l1LYls8jUQQJvl3qOMnt466kgZa64v0+48ymb7
X-Google-Smtp-Source: AGHT+IHBVy+7ifJovbNtkvDbrEpCDkMYjLpQycIEeGAPhFLGlaF3WnbQXIsaKp34nfKweM+JnqXrtw==
X-Received: by 2002:a05:600c:1c22:b0:456:1d93:4365 with SMTP id 5b1f17b1804b1-459e95af9b4mr11147555e9.5.1754472112969;
        Wed, 06 Aug 2025 02:21:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 4/4] clk: renesas: r9a07g04[34]: Use tabs instead of spaces
Date: Wed,  6 Aug 2025 12:21:29 +0300
Message-ID: <20250806092129.621194-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in the CRU clock descriptions to match the
formatting used in the rest of the clock definitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 8 ++++----
 drivers/clk/renesas/r9a07g044-cpg.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index f050f8565916..33e9a1223c72 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -213,13 +213,13 @@ static const struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 	DEF_MOD("sdhi1_aclk",	R9A07G043_SDHI1_ACLK, R9A07G043_CLK_P1,
 				0x554, 7, MSTOP(BUS_PERI_COM, BIT(1))),
 #ifdef CONFIG_ARM64
-	DEF_MOD("cru_sysclk",   R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
+	DEF_MOD("cru_sysclk",	R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
 				0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-	DEF_MOD("cru_vclk",     R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
+	DEF_MOD("cru_vclk",	R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
 				0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-	DEF_MOD("cru_pclk",     R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
+	DEF_MOD("cru_pclk",	R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
 				0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
+	DEF_MOD("cru_aclk",	R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
 				0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_COUPLED("lcdc_clk_a", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
 				0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index fdbc0635a869..0dd264877b9a 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -303,13 +303,13 @@ static const struct {
 					0x558, 1, 0),
 		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
 					0x558, 2, 0),
-		DEF_MOD("cru_sysclk",   R9A07G044_CRU_SYSCLK, CLK_M2_DIV2,
+		DEF_MOD("cru_sysclk",	R9A07G044_CRU_SYSCLK, CLK_M2_DIV2,
 					0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-		DEF_MOD("cru_vclk",     R9A07G044_CRU_VCLK, R9A07G044_CLK_M2,
+		DEF_MOD("cru_vclk",	R9A07G044_CRU_VCLK, R9A07G044_CLK_M2,
 					0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-		DEF_MOD("cru_pclk",     R9A07G044_CRU_PCLK, R9A07G044_CLK_ZT,
+		DEF_MOD("cru_pclk",	R9A07G044_CRU_PCLK, R9A07G044_CLK_ZT,
 					0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
-		DEF_MOD("cru_aclk",     R9A07G044_CRU_ACLK, R9A07G044_CLK_M0,
+		DEF_MOD("cru_aclk",	R9A07G044_CRU_ACLK, R9A07G044_CLK_M0,
 					0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("dsi_pll_clk",	R9A07G044_MIPI_DSI_PLLCLK, R9A07G044_CLK_M1,
 					0x568, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
-- 
2.43.0

