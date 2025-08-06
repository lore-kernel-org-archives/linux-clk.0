Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B028A406
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472117; cv=none; b=gpIzZvcb6ZxYi8hq5EEhPaVB0h1lUsdwQhItGU8HHXQ/SOFXxKttudwChgbPL0aqVYN+muvmbIVdJZr8Y2EK1cmFICsKqX7ptpsBl9o7TIfUXOnW1X5DfVAS8Ex5rA6ncXOFGdscmQ5P4pRolfWVh0qE7eEAwbTCiKw6pk4ZWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472117; c=relaxed/simple;
	bh=FvsDePP3fJ8EnXsTaHB2zKjwS5y7ccDyLqxsGUuhUU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Soi77m9VqExx68bmmBsi6Z8QVGiy4rnipHg3csuW87EpgOMs12EanGEZCq+9pr/ccz9eSEQdtCQq6Ib7CIGjJmBfh6Y4VwKJh+kJTvHPGhmza6wCIYLIvu4ulISLDBMgqbIcfCPSajICU3HaZygoAmkxJSppzsb4DBrU6oL6TOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OD+190km; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OD+190km"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459e794b331so2576425e9.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472112; x=1755076912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKQyoWCO7mubo2aDtJoh8EFswrG5a75521U7GEm4FR4=;
        b=OD+190kmjhWsuB5mdCjrRCV0fD857ZkuNl9wBOTjNF8CP83rwElDvPuwl1WtPQiPpK
         /Y5ZkiPLdrLB4yvsjU15SeBMkCPhihR25eMTRMWHBRY8iohOz5E1CqP3QIqEALzh9YLe
         H+emOByJv1G4Qt6/UHEDrj7Uji2A9y+SbDlHiujGCMx9EE2kkSYxJPbZa2YnnzTh1SZ5
         a8hKO/fdUtr+SSQIwbyrLO2cZw1VQDusort3NyVoxx+B89SqDuIcsHSKLATpd0Dj5Rrg
         pWTuL0+BoOeaG7wZ2w6S0NvQPCGb/sFGiR99GomkDkWzYeuqYf1ziXXhRavMdeSMlvAr
         VOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472112; x=1755076912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKQyoWCO7mubo2aDtJoh8EFswrG5a75521U7GEm4FR4=;
        b=DUIQ7ujVwSuXMu1eMFPA6Fraty1HFhtS+/+xnyCDogeU12VTlAnXHJrmy7z5ERZq8f
         Og+IXwcfMfw/OWacxrEPxKstOZ9r1ke4DwjZ8qraWgLd0QrAe92w/z+bBvJIJ92mk7lf
         bnCEffwMj+D/OLDUYp3FpXfp1nwXDvAa0fv2xpcOObX9qavt+vtFx6M5Le2OUFPbS2uA
         NVgMfM2qNF21qQIVxtRVqtzeF4qYGrjD/+L2kkKInnthKH+y1vXBEC45fR5FEOuCrHna
         bbMHiMY8Rk7EQ8nq3+E1oH1zDgPuzqI4WRqfzQ23zPFc0UGyhk4Mr+1pyGrTDOO3/ezO
         ysJA==
X-Forwarded-Encrypted: i=1; AJvYcCVrzD1cNKMpAgU7Y1jgyx+M11JMoZDDGNZHoUKjygmZpQubiRGcMjfdsYJBZBvHh5DLEU/83nPlaSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZB8eQpPpT47yYvJRo5jm7exIu+jV2c1PM1i7UnTvdijTVo2L
	BXgbDP0k3iVvNqXYf8paT52N47BCGhEHraPPrPR9yjx2Fa0KQIs1f6Jeo2ZY7JCSUoI=
X-Gm-Gg: ASbGncvUl2+iJeoJYVhRtg+xESpWTAtz1QBNsEbpLaUhHlFQACYYqsINJQIuOoaw2s8
	y1Df2csB73A/y05k2K2s5U+0qe6gO0amuRXNGnz+nbsqk+5bzQnZ4yLrb5AWKfiobplCq20C1Yq
	49VAllOkRMwCuwKeU/BTtoQ2UjbOaKakOpIHW5wAAJukLwM6/pJXZk8H++A3cDXOrmA4n5EZ8Lc
	qYYSQqmnjPEmGaReYIhICiw15qehw0LsBt/bf04kjSemGyUnYfQC2pPkGHSkCpYSwF1iova09vU
	uZRRRlI+uGsnEgKPOrBPIhZ6QaIIIJuEke/4GjKKOp76pZvcS5PCLPxuMS/Xl/iTNPxK8Sv8r32
	ErjQeo7cA645qIfeq1TCLqCfNevzgKj7aa/27pQlKi6GcjAYl7OPN
X-Google-Smtp-Source: AGHT+IGrVpS0FdOU7jR6Fkd3RowHJzBk1u1teEPttAgQwseuMpo8f4PNGs1YlTBjXeQIXKacUhZcXw==
X-Received: by 2002:a05:600c:b86:b0:458:be44:357b with SMTP id 5b1f17b1804b1-459e745e8f1mr19318105e9.15.1754472111726;
        Wed, 06 Aug 2025 02:21:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:51 -0700 (PDT)
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
Subject: [PATCH v2 3/4] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
Date: Wed,  6 Aug 2025 12:21:28 +0300
Message-ID: <20250806092129.621194-4-claudiu.beznea.uj@bp.renesas.com>
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

Add MSTOP configuration for all the module clocks on the RZ/G2UL
based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added MSTOP for GPIO

 drivers/clk/renesas/r9a07g043-cpg.c | 132 ++++++++++++++--------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 02dc5cecfd8d..f050f8565916 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -164,143 +164,143 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 static const struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 #ifdef CONFIG_ARM64
 	DEF_MOD("gic",		R9A07G043_GIC600_GICCLK, R9A07G043_CLK_P1,
-				0x514, 0, 0),
+				0x514, 0, MSTOP(BUS_REG1, BIT(7))),
 	DEF_MOD("ia55_pclk",	R9A07G043_IA55_PCLK, R9A07G043_CLK_P2,
-				0x518, 0, 0),
+				0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 	DEF_MOD("ia55_clk",	R9A07G043_IA55_CLK, R9A07G043_CLK_P1,
-				0x518, 1, 0),
+				0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 #endif
 #ifdef CONFIG_RISCV
 	DEF_MOD("iax45_pclk",	R9A07G043_IAX45_PCLK, R9A07G043_CLK_P2,
-				0x518, 0, 0),
+				0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 	DEF_MOD("iax45_clk",	R9A07G043_IAX45_CLK, R9A07G043_CLK_P1,
-				0x518, 1, 0),
+				0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 #endif
 	DEF_MOD("dmac_aclk",	R9A07G043_DMAC_ACLK, R9A07G043_CLK_P1,
-				0x52c, 0, 0),
+				0x52c, 0, MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",	R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
-				0x52c, 1, 0),
+				0x52c, 1, MSTOP(BUS_REG1, BIT(3))),
 	DEF_MOD("ostm0_pclk",	R9A07G043_OSTM0_PCLK, R9A07G043_CLK_P0,
-				0x534, 0, 0),
+				0x534, 0, MSTOP(BUS_REG0, BIT(4))),
 	DEF_MOD("ostm1_pclk",	R9A07G043_OSTM1_PCLK, R9A07G043_CLK_P0,
-				0x534, 1, 0),
+				0x534, 1, MSTOP(BUS_REG0, BIT(5))),
 	DEF_MOD("ostm2_pclk",	R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
-				0x534, 2, 0),
+				0x534, 2, MSTOP(BUS_REG0, BIT(6))),
 	DEF_MOD("mtu_x_mck",	R9A07G043_MTU_X_MCK_MTU3, R9A07G043_CLK_P0,
-				0x538, 0, 0),
+				0x538, 0, MSTOP(BUS_MCPU1, BIT(2))),
 	DEF_MOD("wdt0_pclk",	R9A07G043_WDT0_PCLK, R9A07G043_CLK_P0,
-				0x548, 0, 0),
+				0x548, 0, MSTOP(BUS_REG0, BIT(2))),
 	DEF_MOD("wdt0_clk",	R9A07G043_WDT0_CLK, R9A07G043_OSCCLK,
-				0x548, 1, 0),
+				0x548, 1, MSTOP(BUS_REG0, BIT(2))),
 	DEF_MOD("spi_clk2",	R9A07G043_SPI_CLK2, R9A07G043_CLK_SPI1,
-				0x550, 0, 0),
+				0x550, 0, MSTOP(BUS_MCPU1, BIT(1))),
 	DEF_MOD("spi_clk",	R9A07G043_SPI_CLK, R9A07G043_CLK_SPI0,
-				0x550, 1, 0),
+				0x550, 1, MSTOP(BUS_MCPU1, BIT(1))),
 	DEF_MOD("sdhi0_imclk",	R9A07G043_SDHI0_IMCLK, CLK_SD0_DIV4,
-				0x554, 0, 0),
+				0x554, 0, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_imclk2",	R9A07G043_SDHI0_IMCLK2, CLK_SD0_DIV4,
-				0x554, 1, 0),
+				0x554, 1, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_clk_hs",	R9A07G043_SDHI0_CLK_HS, R9A07G043_CLK_SD0,
-				0x554, 2, 0),
+				0x554, 2, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi0_aclk",	R9A07G043_SDHI0_ACLK, R9A07G043_CLK_P1,
-				0x554, 3, 0),
+				0x554, 3, MSTOP(BUS_PERI_COM, BIT(0))),
 	DEF_MOD("sdhi1_imclk",	R9A07G043_SDHI1_IMCLK, CLK_SD1_DIV4,
-				0x554, 4, 0),
+				0x554, 4, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_imclk2",	R9A07G043_SDHI1_IMCLK2, CLK_SD1_DIV4,
-				0x554, 5, 0),
+				0x554, 5, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_clk_hs",	R9A07G043_SDHI1_CLK_HS, R9A07G043_CLK_SD1,
-				0x554, 6, 0),
+				0x554, 6, MSTOP(BUS_PERI_COM, BIT(1))),
 	DEF_MOD("sdhi1_aclk",	R9A07G043_SDHI1_ACLK, R9A07G043_CLK_P1,
-				0x554, 7, 0),
+				0x554, 7, MSTOP(BUS_PERI_COM, BIT(1))),
 #ifdef CONFIG_ARM64
 	DEF_MOD("cru_sysclk",   R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
-				0x564, 0, 0),
+				0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_vclk",     R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
-				0x564, 1, 0),
+				0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_pclk",     R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
-				0x564, 2, 0),
+				0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
-				0x564, 3, 0),
+				0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 	DEF_COUPLED("lcdc_clk_a", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
-				0x56c, 0, 0),
+				0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 	DEF_COUPLED("lcdc_clk_p", R9A07G043_LCDC_CLK_P, R9A07G043_CLK_ZT,
-				0x56c, 0, 0),
+				0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 	DEF_MOD("lcdc_clk_d",	R9A07G043_LCDC_CLK_D, R9A07G043_CLK_M3,
-				0x56c, 1, 0),
+				0x56c, 1, MSTOP(BUS_PERI_VIDEO, BIT(9))),
 #endif
 	DEF_MOD("ssi0_pclk",	R9A07G043_SSI0_PCLK2, R9A07G043_CLK_P0,
-				0x570, 0, 0),
+				0x570, 0, MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_sfr",	R9A07G043_SSI0_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 1, 0),
+				0x570, 1, MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi1_pclk",	R9A07G043_SSI1_PCLK2, R9A07G043_CLK_P0,
-				0x570, 2, 0),
+				0x570, 2, MSTOP(BUS_MCPU1, BIT(11))),
 	DEF_MOD("ssi1_sfr",	R9A07G043_SSI1_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 3, 0),
+				0x570, 3, MSTOP(BUS_MCPU1, BIT(11))),
 	DEF_MOD("ssi2_pclk",	R9A07G043_SSI2_PCLK2, R9A07G043_CLK_P0,
-				0x570, 4, 0),
+				0x570, 4, MSTOP(BUS_MCPU1, BIT(12))),
 	DEF_MOD("ssi2_sfr",	R9A07G043_SSI2_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 5, 0),
+				0x570, 5, MSTOP(BUS_MCPU1, BIT(12))),
 	DEF_MOD("ssi3_pclk",	R9A07G043_SSI3_PCLK2, R9A07G043_CLK_P0,
-				0x570, 6, 0),
+				0x570, 6, MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_sfr",	R9A07G043_SSI3_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 7, 0),
+				0x570, 7, MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("usb0_host",	R9A07G043_USB_U2H0_HCLK, R9A07G043_CLK_P1,
-				0x578, 0, 0),
+				0x578, 0, MSTOP(BUS_PERI_COM, BIT(5))),
 	DEF_MOD("usb1_host",	R9A07G043_USB_U2H1_HCLK, R9A07G043_CLK_P1,
-				0x578, 1, 0),
+				0x578, 1, MSTOP(BUS_PERI_COM, BIT(7))),
 	DEF_MOD("usb0_func",	R9A07G043_USB_U2P_EXR_CPUCLK, R9A07G043_CLK_P1,
-				0x578, 2, 0),
+				0x578, 2, MSTOP(BUS_PERI_COM, BIT(6))),
 	DEF_MOD("usb_pclk",	R9A07G043_USB_PCLK, R9A07G043_CLK_P1,
-				0x578, 3, 0),
+				0x578, 3, MSTOP(BUS_PERI_COM, BIT(4))),
 	DEF_COUPLED("eth0_axi",	R9A07G043_ETH0_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 0, 0),
+				0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_COUPLED("eth0_chi",	R9A07G043_ETH0_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 0, 0),
+				0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_COUPLED("eth1_axi",	R9A07G043_ETH1_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 1, 0),
+				0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_COUPLED("eth1_chi",	R9A07G043_ETH1_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 1, 0),
+				0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("i2c0",		R9A07G043_I2C0_PCLK, R9A07G043_CLK_P0,
-				0x580, 0, 0),
+				0x580, 0, MSTOP(BUS_MCPU2, BIT(10))),
 	DEF_MOD("i2c1",		R9A07G043_I2C1_PCLK, R9A07G043_CLK_P0,
-				0x580, 1, 0),
+				0x580, 1, MSTOP(BUS_MCPU2, BIT(11))),
 	DEF_MOD("i2c2",		R9A07G043_I2C2_PCLK, R9A07G043_CLK_P0,
-				0x580, 2, 0),
+				0x580, 2, MSTOP(BUS_MCPU2, BIT(12))),
 	DEF_MOD("i2c3",		R9A07G043_I2C3_PCLK, R9A07G043_CLK_P0,
-				0x580, 3, 0),
+				0x580, 3, MSTOP(BUS_MCPU2, BIT(13))),
 	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 0, 0),
+				0x584, 0, MSTOP(BUS_MCPU2, BIT(1))),
 	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 1, 0),
+				0x584, 1, MSTOP(BUS_MCPU2, BIT(2))),
 	DEF_MOD("scif2",	R9A07G043_SCIF2_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 2, 0),
+				0x584, 2, MSTOP(BUS_MCPU2, BIT(3))),
 	DEF_MOD("scif3",	R9A07G043_SCIF3_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 3, 0),
+				0x584, 3, MSTOP(BUS_MCPU2, BIT(4))),
 	DEF_MOD("scif4",	R9A07G043_SCIF4_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 4, 0),
+				0x584, 4, MSTOP(BUS_MCPU2, BIT(5))),
 	DEF_MOD("sci0",		R9A07G043_SCI0_CLKP, R9A07G043_CLK_P0,
-				0x588, 0, 0),
+				0x588, 0, MSTOP(BUS_MCPU2, BIT(7))),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
-				0x588, 1, 0),
+				0x588, 1, MSTOP(BUS_MCPU2, BIT(8))),
 	DEF_MOD("rspi0",	R9A07G043_RSPI0_CLKB, R9A07G043_CLK_P0,
-				0x590, 0, 0),
+				0x590, 0, MSTOP(BUS_MCPU1, BIT(14))),
 	DEF_MOD("rspi1",	R9A07G043_RSPI1_CLKB, R9A07G043_CLK_P0,
-				0x590, 1, 0),
+				0x590, 1, MSTOP(BUS_MCPU1, BIT(15))),
 	DEF_MOD("rspi2",	R9A07G043_RSPI2_CLKB, R9A07G043_CLK_P0,
-				0x590, 2, 0),
+				0x590, 2, MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("canfd",	R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
-				0x594, 0, 0),
+				0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
-				0x598, 0, 0),
+				0x598, 0, MSTOP(BUS_PERI_CPU, BIT(6))),
 	DEF_MOD("adc_adclk",	R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
-				0x5a8, 0, 0),
+				0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("adc_pclk",	R9A07G043_ADC_PCLK, R9A07G043_CLK_P0,
-				0x5a8, 1, 0),
+				0x5a8, 1, MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("tsu_pclk",	R9A07G043_TSU_PCLK, R9A07G043_CLK_TSU,
-				0x5ac, 0, 0),
+				0x5ac, 0, MSTOP(BUS_MCPU2, BIT(15))),
 #ifdef CONFIG_RISCV
 	DEF_MOD("nceplic_aclk",	R9A07G043_NCEPLIC_ACLK, R9A07G043_CLK_P1,
-				0x608, 0, 0),
+				0x608, 0, MSTOP(BUS_REG1, BIT(7))),
 #endif
 };
 
-- 
2.43.0

