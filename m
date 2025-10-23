Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7893299A8A
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253676; cv=none; b=KMORaAzMGl9GDbsYLadwJENrjoSFA2G5M02lRvf2av9OxovQYptO7OkH3LIOlMJo6K1Vx25thdpENt4Dkanver7epu03DPGGnHj/1YPIraQH21GXbL93es52jThv+XVuehyxCF/vfPEE0GIF2OyJ/IA0V/0/sq+bzAdWDmymy/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253676; c=relaxed/simple;
	bh=QYDgl2j7bc6pmfYkk5gX57OH62MVyvBSNPyOxg7b3ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMrlVRD6nQUw7f81sQCRjXzsv0c9bvUy14yzY7DhuWeNeJrglnH5wBhtqKNMxPoEGH+2PIr4vaqX6Tq/8cSvE/wcf23d6l+xmIk6CDGK+F3w6qWeupDHBdbdG9sqFuW+AooGjHkB5B5BII7//aT/M/G5x3klQTRhmw/R2Bo/U7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxde3jjA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxde3jjA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a28226dd13so384124b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253674; x=1761858474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qqIMDXNh/NSYVNLTyGDSvrXx0MaOs7bS4EI9BBjCS8=;
        b=gxde3jjAIuq8t8jmDn7L/sjftzRQ35CCVd+zOPDiZC/zOFaY1ZoPdRb6A2REJJ/BxD
         zqWmtFkAAg0hBRU71cSCEdnciMP2yoR1PbdRRuX2L9o9xn7RO5wKVXAEo80BcpT2vDwI
         SoIPgXPuNAGkBvOLwjmdOS19EXQx40g7AYC2+6DbUzhTe/oZPGkfPD+vGQTcUmId37MU
         NrPsSDZrVdQ5ql96HAIt7nlnLEsNLwM6Wwn2eZPvlb0n6caxmzN0hpuAZ3D8QGan6EDv
         HmEWYGtb3SyxX6Y5X0gwANtf1i2Cj2x01XLC/ecnJ3iiqfWnBeGFQraDIGk+G8ouE2Cx
         eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253674; x=1761858474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qqIMDXNh/NSYVNLTyGDSvrXx0MaOs7bS4EI9BBjCS8=;
        b=qvolGhY5rCr0E8QxBdw12rBS5Ys8dSQw5TyQT/9Wr4UpFozMcAIXnlxHUgC/v6WIVr
         1LlK+SDHIQ43JITNCeSlxxgQI6wlwdfe/SfBYTiDEnFvkF4ueF46OLSoqySkJBzO3o0f
         ckQGntZP5hkvmGy0tmoMN4mGh8wcBwX90wDYFHDZpA1DWV2/Q2QAWYTH3VzGViDjGMRa
         dcX7zfs/iS+ugy18aK2nAFZ8yO2+tapVQoXLcYRh/zDZzaXd26e0wcvx/c2ptjgKNG0n
         cNX1kzACV9P55/dTPgoVCKLndSx3f3qmmDtaN1SKjcQTDVZFjV/kZQLCnVnfpcQVwgEB
         kesQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKBmVR7uNE4vyszHfUNCLhHFJfGtdI46aRvZ87ObrYzeQwGw2aUNaM/XFFMQVMeexr1uyHkwtZS4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3+asrXobAJOrvqtzWq4eUYALFTxkV13Ai8A+QZoDUsImxK3l
	y3FaxlXCL6boxzHuuxCQUEhPre+J5OiYW1sIiZ6nN+9wue5BEH/OCxCw0UuOVeN2
X-Gm-Gg: ASbGncs4eyxccLpfNcboPDJEFDl4VEiobUbqn8cvcaQSlpeBeRt2bcs0lguIwuWfqUo
	/qJIy64+/yNIUTHAMyxCXt3w6mZXpzobyT6VOG1v0h2A3M5E/2GhPdGDgft4+iJg0jMS6Qds969
	oZ3mlcpC+a+wA8jmKdh46c9qAveMuNwy7RFoeO5i1MwEs5ghIS4BQvs6OXtE3MLcCDEkx9+3oWw
	XSXJLG10RoEVGYj/aU0hxYkDdJwEjrbCA2Nn8rQMqp1uJXLhBD2qLE8KIW4gz+EBm5+/V50FHJ9
	FU/D8qjrN7WEKboCdNsXpIfZ5bzSKAmjh07p0mwssGRlTTdxaezzCCw9hLzo1GGAubrjQ5+oezX
	5aeJunQ4lepCZjXG/XCftDGcQAKL3NUEknhn5wvPYMUzgQQv84BuCkQnrgDWVNXZZ5TxTzfXO93
	QeGfIopCkhBPqFbG7bIp0G3pMSDAPbnQ==
X-Google-Smtp-Source: AGHT+IFty1HjWFQSsWDlrjNLNPx4RPSpTg3TgZj2gtYr/uoLVj0tI0eAbLxeBYl4XyXB2V1pb2b8VA==
X-Received: by 2002:a05:6a20:72a3:b0:331:e662:c973 with SMTP id adf61e73a8af0-334a8607001mr34126671637.32.1761253674053;
        Thu, 23 Oct 2025 14:07:54 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] clk: renesas: r9a09g056: Add support for PLLVDO, CRU clocks, and resets
Date: Thu, 23 Oct 2025 22:07:23 +0100
Message-ID: <20251023210724.666476-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PLLVDO clock and its related CRU clocks and reset
entries in the R9A09G056 CPG driver. Introduce `CLK_PLLVDO` and associated
clocks like `CLK_PLLVDO_CRU0` and `CLK_PLLVDO_CRU1`, along with their
corresponding dividers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 70b73d410135..9c536f7706ff 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLCLN,
 	CLK_PLLDTY,
 	CLK_PLLCA55,
+	CLK_PLLVDO,
 	CLK_PLLETH,
 	CLK_PLLDSI,
 	CLK_PLLGPU,
@@ -50,6 +51,8 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_DIV16,
+	CLK_PLLVDO_CRU0,
+	CLK_PLLVDO_CRU1,
 	CLK_PLLETH_DIV_250_FIX,
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
@@ -75,6 +78,12 @@ static const struct clk_div_table dtable_1_8[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_4[] = {
+	{0, 2},
+	{1, 4},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_16[] = {
 	{0, 2},
 	{1, 4},
@@ -149,6 +158,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
+	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
@@ -174,6 +184,9 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
+	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
+	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
+
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
 	DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
@@ -334,6 +347,18 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("cru_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 5, 6, 21,
+						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD_NO_PM("cru_1_vclk",		CLK_PLLVDO_CRU1, 13, 6, 6, 22,
+						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23,
+						BUS_MSTOP(9, BIT(5))),
 	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
 						BUS_MSTOP(9, BIT(14) | BIT(15))),
 	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
@@ -396,6 +421,12 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
+	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
+	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(12, 8, 5, 25),		/* CRU_1_PRESETN */
+	DEF_RST(12, 9, 5, 26),		/* CRU_1_ARESETN */
+	DEF_RST(12, 10, 5, 27),		/* CRU_1_S_RESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
-- 
2.43.0

