Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963383;
	b=jV3mVCV9XNL+5iMqzXeOdSc0/ors7SmzkzWVPmSQbSN6rnfvImtxpVJMB/q/YwVuYV9T
	 72K7YZdHNLzf3/pf1+Y3e4afNLZOr8204AIEQpqmKownLVv17EAb+GwBy1dXvl8Vfk2pB
	 dVcACe8ylaECbE0bI6tHSfzVYAUccDpTF/cxAe8OmjjVCroU6AD2u4fciJ4vN20uJPIX+
	 d5C7aYxFn8lHcoMc4ecCesJn7a71U6UckLqNU4TOivZ0oUSnBpUPGz/34h0TYAoGAUDS8
	 isENWwsSF5mfqPLFHJ4OqMyQW5m+4Sqy3/KJ0+dhF7+wdFZ5YKQNh0bF3ZbVISJ518w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
	b=PwbxfpIK0GUF2X7M4d2QgOJjtXxJL6Wa5CrHe6C7NWerXizAXZSWR0TKFOErvCAB+RiY
	 bau4GXbHQD0bDhVbUbd+RNk7yOwDBKCpSOHW4cK4KA9lCMBOMAutWd/KSn9rshYKCht9O
	 232ZXUNHOxJXqclofudhFjNo9f7SzAU1Jl8T849v7kSRYLxYatsdxxBft3EqncCRKReH6
	 i7uksR+LChh4sFEUFKEBv1JqlcKRc0Lnk+QlFtRNXoggGho2EdSIJDn9nJdPnFihECXUu
	 UjGgB2tV/IMzrLeG/00c+jBrdBd4zQ03a5oNP/tBjQ1InzPI6h7LV/1ImMHlJTethxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTiuM0bR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49941606A33C
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49941606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTiuM0bR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so4078615e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963381; x=1794568181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
        b=NTiuM0bRFB1dOjn1ZKrp3AYl72iiEVSCnVtVnCHMCg+IUkoVB9jaFi/3lcuEZv9je3
         N16BCXHj5+AGuRY9mkKDiluZtiAj9Ffd20w7s+WCXIDtw7yHEXGOc/T6LR3tAKXbH6At
         mioZqPHfzMicFPLwq/jOM9nsKW4hW8wLFG1p8LZPKZs4NN0bNva+BFTm619drhu+lpuz
         nZ+csvW4UiPo640p3N7bybTSXHEcrpIE9GWqpmS0H/Hc+Nwxp3aCpfXg9n5yZpKVR7NW
         xKe28lJs69cn6rpAldEXdrEr/A4PceygQl1+v6erusPsk+6sN9Foq1WAMgzJcE4z/Gj4
         yNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963381; x=1794568181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
        b=OG97mlN2sxClPwHoTYdajkkG1ZCS1bP7BvdUKUflsDiC/WSNhPn50b52/IkeCXAxl2
         ertGyW5j9Oi/PH4gmLwevY94gOe48ydNYsN4SudOrbd1m4NFKzFJtVl3TCJo3s7Lh8LG
         Ng6T2KUs/KHuXzgP2TiG6+y0VdzRzEEgoO1UkO7V2B5dPMqSKs79C/2/zgHg7iMob4J6
         OdMXLyXPeW414M8qaCim+XTKLRmnbx9U4Rj6cofWsaIf9s5E1KN/lOeCEJnEuZZ4A0lI
         6mO69pVoy+ZvdIVOZZqoPKFr3H8N7N3uhKRM2g/aY4ptHRiobwz8NgpI3fBkVyPOoQ2B
         tt6w==
X-Forwarded-Encrypted: i=1; AKwUvBydPQv+/PKC3jgXxjkcDWzra0iDhJr4P8kcuEVhlObDlc8rtGckvmZMyQ5Ism3UPx/m9ofgZxFWPq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pZ6qS3GbpLNekPoLn2L0SI2kFMH7KtYL7J/YYih8zDSCWTNlc
	Jj8TZuxngOr/MRKmOoqbLBTvPa99XlP/WGzOs04IueSM0ZCundDtsSRk
X-Gm-Gg: AYBFou0mif1+1FvjjaL8ccdAz2syUENPP4KD7HMpyn0taghH5Ye6zb/R3hxNs8e44iy
	GXwbmFHl2NqouZDN0SiJcL/MW4inwDAflSaU2JiUYmZEbGAWLGlwGtiQY0YIH0ykNMm0ShXjDnc
	Oz7YJxCEdyahyfnFrkAen/sLugTNWc+SP3GZH2XiYcyp0lASoUwqWEF7J9GtOHyb/jyEZEmIdqy
	oggs9xZ6ae4lN6cnyqNLESlPqBXcWcbFDmaMRcM4UrbPcobsnwdPONLO8pvlf2+jkUVwH1TaI2p
	k6E14qU05Bk70md+MX9Gr0aYywBJ1+cG1GXXJ5WGAYoIUYLEEo6BnmO8WhZn5gB9IkU463YkWYm
	ksl1FxTa/qoPD21KyCyp8XlRpXFrS40gUs1a+TT4s/t3DLaLU2LrlA6GvRz17vLh3EqLHTJj59a
	w/We2TzilEfSr7oqrsQqYTVhPkrRAqu0L7KUYqGZsxExBDRQn7Ykwmnw/hhXsasyj/iibkxPWjv
	38Q7O8cgUlMpfGauUg5eYikNxnSMtba4H5cg0GzRhRX++Alald0ExmwwWb3xd0s6i1zZk3Fpuwr
	giOx9owAkmITMjDr+L/jYBqVteuZndjO7jPm1HrrWUiC8bOWfQY0VuC71RKD9UNGgYJmr06dfNj
	nn3/3qE+l/a43OXx8SySaVw9TJSM9RnohIfYsCNr1oh4W52QMT2KFpah2VkJ4jSxVBgyyVxAc8A
	==
X-Received: by 2002:a05:600c:3509:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4b6e0172854mr38401445e9.31.1793963380560;
        Fri, 06 Nov 2026 03:09:40 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:40 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
Date: Fri,  6 Nov 2026 11:09:23 +0000
Message-ID: <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the ADC controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
- Renamed adc_0_pclk to adc_0_pclk
- Renamed adc_0_adclk to adc_adclk
---
 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 51c1e322826a..9c611f12ad4e 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -35,11 +35,15 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV2,
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCM33_GEAR,
+	CLK_PLLCM33_ADC_PCLK_GEAR,
+	CLK_PLLCM33_ADC_PCLK_DIV2,
+	CLK_PLLCM33_ADC_ADCLK_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -135,6 +139,12 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_8_10[] = {
+	{0, 8},
+	{1, 10},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_16_128[] = {
 	{0, 16},
 	{1, 32},
@@ -171,11 +181,18 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+	DEF_CSDIV(".pllcm33_adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,
+		  CSDIV1_DIVCTL0, dtable_8_10),
+	DEF_FIXED(".pllcm33_adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
+		  CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
+	DEF_CSDIV(".pllcm33_adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,
+		  CSDIV1_DIVCTL1, dtable_2_16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
 						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("adc_pclk",			CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
+						BUS_MSTOP(3, BIT(9))),
+	DEF_MOD("adc_adclk",			CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
+						BUS_MSTOP(3, BIT(9))),
 	DEF_MOD("tsu_0_pclk",			CLK_QEXTAL, 16, 9, 8, 9,
 						BUS_MSTOP(5, BIT(2))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
@@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
+	DEF_RST(15, 6, 7, 7),		/* ADC_ADRST_N */
 	DEF_RST(15, 7, 7, 8),		/* TSU_0_PRESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
-- 
2.56.0

