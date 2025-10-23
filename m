Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92503286D56
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253681; cv=none; b=nlF388GtzMjr/zus+/xvMz3asZuMDdyWqu1NaAgqVOGHIxprT1iy35mKZUJiriuqFIf2lhQqHrigdbAhWUBH7C0+laOU3HxH/WCGgAS+LwpIeARfZAT/a+HGGVOmsUAE3oFP2CyOdi5bqGdjMQ7K2mT/7G+xlyD4o5H7L54/U0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253681; c=relaxed/simple;
	bh=fcyAIRG+dgZ03Oba/2dpM7V9lNNGOfWjo3IjttQjkpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6pNmtMOnUsw2p5vo+DL0J2xdKtyK03oVe1knvuMoSvg+iLsOKeGiKbya0ESYx4feIHIeJE92nrJXKH5j8qyNfVAfheTNHNn8AKcJhKZwD6TnPhzd+k0eG8UhaWcOUdJUvhvI/cTXbZbfToQxXuQ0uwYqkY0vO198ev/uNDkf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlcTtOgf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlcTtOgf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781206cce18so1373295b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253679; x=1761858479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzpeIbw6BSNHhoq4s0zh4pWGEO2OMapZHrQAySwDiLA=;
        b=TlcTtOgfnQuyqq6skO/2IHU4wwL6thzTxuvGMsILOxm36+y95LL5nBQtxGsxx2ChCR
         bUpL2sGmJvwOeFz7ll5Ehbs+0kRSbLJviqYlQRh83ZjfWw63t7P8T9NJyHwBlfauMq3u
         ZIWv3bCdX4GDJfadpDUvxvxLKlKddyPsbLhDJU5p8uqXXoEMAERSjrGa6p5K09vp8gUf
         TfGYJb7o2Sa9f48l80BDE/6n0jGbCsY8JQ/A1iu7//Fw1xVaGDVEqvM+iSWviFKgwJE6
         bZ4fJp74b70/cbO1SkKcDgqIew8bPH8c/PUEiqZ2mn3UI9gOvpBZhp96isqSBIMsfh3U
         pvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253679; x=1761858479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzpeIbw6BSNHhoq4s0zh4pWGEO2OMapZHrQAySwDiLA=;
        b=gERjSRo82IdmC/iJ1d/fT+WHA2EDpbm2KvQsyjQ1LbCMU1x3KZPEPMd2yw1tpwv+Gg
         Ws4TFAxfwm1B5OD4yo6kQKYv1jNWR7OXq9WMFwKKpDwYPfSxNV8sr99orayvwGqb98V0
         gzNgf6xFXQpsXI1zpMWRxjjLVrAkZ52ks6kFQ6VTxRW8WC5pprstFHQI3m5Flvb5SMa0
         ++dEWi9egDz+e7GF96res4aXjGfLC195HxIhAsjsb5f8gsB3TyV8HzBxpjR9CHiYnV8V
         oXGK1OlNQ32tdCm73n7W/Wm99ECZtGpkEYrI1ul032LTcuoy/AHUdxmO/EXUGnE3/65A
         +8hA==
X-Forwarded-Encrypted: i=1; AJvYcCWt/ONZEbesTXbcAmr+wJqt3xzl3TIgdvHDnz4OkofkrOnNywoMPcnxryyh3wjcqMe7H4mxZdchLHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKU4rOaJ9mW7NX4VxMZemNt6JNjFrht4s+822T6iHbNYEQuP2E
	zCqH0k6GhIK/DtnoBJYAbPW+hAbZUZvY16KgTtGFvZQGlDOSI5Ppic1I
X-Gm-Gg: ASbGncsoQthFZD65zTTcHsgPKcvhOe14ANJWUMyAhO0CKaSsv+YvywL1qhz1E+CCf9K
	us2M27o+tGKC3U23p+4qTW6y0oIU9V/hbLgfVIr2v55UVA1CtM0WJWhLeI9LZfPrlpTKgF2txvC
	Vlvz7pH9pu2Nyr6+7kiL/mAqZaN5A6wy9ogpLen7so8mc30GI07KMLyLURHb03YDs31JIxM1Bzf
	IYwNBl4eILa4zfal+LP1nfWtTDRAi+KQvqMa/uKzxwcICgzjtYeCe+FEflrQmSJxZoHftIveX9c
	SMjvFVSixRQvfqVaY9qYezDNjr8tZxWlyET5ZW8gSK1dzdy/gUpQrudKsv01rdeylTOdXTwwv1/
	UR6L15R/lutm1sx1b/j61h6Jj/R8NtbKQ1Y87EfkF802/gwSYyTehH8xiOHf4GFsGu8X3OdVIxs
	dlnpc0jSeG+1FfD9VH5Eg=
X-Google-Smtp-Source: AGHT+IGw5U9qHAm+G9+MHF38/9bWKPFLlpYC8MlAMkWqeOESX1Tzbl/n7rOnG89OOjPz5VAdF2WApg==
X-Received: by 2002:a05:6a21:32a4:b0:263:4717:559 with SMTP id adf61e73a8af0-33db40e0684mr365224637.20.1761253678756;
        Thu, 23 Oct 2025 14:07:58 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:57 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g056: Add clock and reset entries for ISP
Date: Thu, 23 Oct 2025 22:07:24 +0100
Message-ID: <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add entries detailing the clocks and resets for the ISP in the
RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 9c536f7706ff..e4a6dfd2bec9 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -53,6 +53,7 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_CRU1,
+	CLK_PLLVDO_ISP,
 	CLK_PLLETH_DIV_250_FIX,
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
@@ -186,6 +187,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
+	DEF_DDIV(".pllvdo_isp",  CLK_PLLVDO_ISP,  CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),
 
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
@@ -359,6 +361,14 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(5))),
 	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23,
 						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD("isp_0_reg_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_pclk",			CLK_PLLDTY_DIV16, 14, 3, 7, 3,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_vin_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
+						BUS_MSTOP(9, BIT(9))),
+	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP, 14, 5, 7, 5,
+						BUS_MSTOP(9, BIT(9))),
 	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
 						BUS_MSTOP(9, BIT(14) | BIT(15))),
 	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
@@ -427,6 +437,10 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(12, 8, 5, 25),		/* CRU_1_PRESETN */
 	DEF_RST(12, 9, 5, 26),		/* CRU_1_ARESETN */
 	DEF_RST(12, 10, 5, 27),		/* CRU_1_S_RESETN */
+	DEF_RST(13, 1, 6, 2),		/* ISP_0_VIN_ARESETN */
+	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
+	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
+	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
-- 
2.43.0

