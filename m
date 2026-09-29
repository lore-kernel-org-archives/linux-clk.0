Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA86515998
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681973; cv=none; b=ld4teUzAgvrqUAAGUqdr7+CJywZu9laiGMY2PJgmfoJudG+E3irNFcWa7y9SaNc3tCs1sVDZ8tZgDSHfFlrbWuYXfm9Mc1s1R9nknu1vPiBNkFNevn3u7lCB2YUEJVTHSB5Kh3yHgqefyT+lzbuGoeRQQx/rz0PfUsr5918fHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681973; c=relaxed/simple;
	bh=2Mu45L5BARy+ps5xY5B43FwHSGdIF2xZMGNAyYhbb/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RF5SocLc51ULYn6Rrrl4URAcUIbau1hyStKFnbwCQ0CCdemNfro12or3P6CGmDJ1Ku7gap5No+8pdD5wKkoaetUWrWU07OsBFbyL0B/+kon5pnvQe/J6gvTAMWCbLQ8ghvrVBK9rTRtxtCFKL1d7HaVCc66QV0YM9vt4OGcuqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOgBeKBe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOgBeKBe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so11525475e9.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681970; x=1791286770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YS0haltmyIBpZtM2yu+Y4ol89PxPMhiw1pJAIKA+MII=;
        b=NOgBeKBetcHSFoCk1MFIRmA4KH5hdDFWwH83JgI8EFRLsR+UvieRqN/ncW2YeOLntW
         /7w4qOuW81sN56Z8F3HYVe5Tt9owqeGOhG0IU6sj/scLAXRAnF6KclbQql8xjfsYa2E9
         A61rJVScah3znPUG6jq0x3EOaHXa3J2iIks+NwDTgkiJIOrYf/BBxSyMfqauMutP8VY6
         4fBWJyglkSJYDwErUzWJL42gAVV0ApgJFadbYZfQ63/qhdd6CZMXQE1ScEUcKoOg6srE
         m00u5VdMIEVNSZ3VFV3fJywIu4s8EZCNNKYkQgILMSlK3T+NNEH8y5NS6Jb9MKQQ2z8k
         jnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681970; x=1791286770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS0haltmyIBpZtM2yu+Y4ol89PxPMhiw1pJAIKA+MII=;
        b=plFH7fyK0XMTQ24OCSLgn9kIJMO6gS80Xl7vB2mxN7UhmJvvlnbuN+tRTBGPUtnRaA
         aBZuLEn0yYcNtbLRcHVrT6OjjJLmaMXQ5DYyNuqY+sy8fm74ztMtiaPpOacHGLXLGuEK
         dDGq6e5xicnUF8E7QJkv712mZ830ZyCCNLgjeB8FPcro2l1T5z51J31V/4bRAEj43I2Z
         xkzsUKqidRBpZDpsASeHgnQ+EIAIn6+GZS4sXmaqYhrysy97oaQgKSn+DEDZk5LPLdvY
         SY1MfWMpo7A3K4eVhXoGLJFxuQxDR1NZt85177vYlzcj64N/0BGN67Tc3bp5IhDYL2Q2
         XJww==
X-Forwarded-Encrypted: i=1; AKwUvBxktxGd7XpqNDc6pZjH3eVk7na9LkenDx0P/aVmnE6M8pq89WXRpw5ZimUHSFPsjIakcZmDC8w/2S4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXUUwDYvjx57C2DNHhYgjUnndT8lXvKHEAJ/IPAF/ppvGW9De1
	gaH+eJDvAtweP3HaFDjVhfPg2XGOTluWRNnsfb39Eo6VPyWvnQ1dt5G3
X-Gm-Gg: AYBFou1Bt73EGCNgLI73NwgSvOLqAl+6JIJaWJYL4QGsoevwhv/PbD2DDlZO/AMlt1c
	BpgmYSuAg6oCO/SQWNlnOSmAysrhTqz7TPYmy+PH25B8nNNJqlXTzJHj2f+Vdmev7O282FGiUCC
	gTlzVscpKNTRyNOeLLdNZbwfS4bx8wjbLJ9litKRrWSf8QY///Shk6DxDhQRHdMetThkH5EBuHf
	CsBdhuTWn/YUFLRVak1npASHnhCyTMbudnW+H4+fG50dEgv1i9FxMO3guh66bOTliSUUXoT95C2
	yUApqXodWl1bXCeyIWZiUC7C9gb3dp5eSMSzWYxvi4Ys78DeJquk3Pt+9vT1cdk3vD5P+yM4gKv
	WlcHI98R6NaqyA4MiWVeocTA7EjT/NH2g92N00hK1nJajzyq49pBQMNPfo7eV6TP179j5et4xV7
	eu7//Xfxc2R4GcMr5/8YPPkm7W8qwu84R0a/tQkdOKjZZmC/SXHhUipxaMmnfbolY6ff+ON78at
	31MgOjBNhSfv1VwyVrziHUG9Po4EYz5F5Qz2zSQWeUgIXHjI56qpusqOgPZQGl5kNLvia12LduY
	YiANtfYLXgjhAgGLMw==
X-Received: by 2002:a05:600c:1d1c:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49ff06bcd5fmr208937585e9.8.1790681969910;
        Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
Date: Tue, 29 Sep 2026 12:39:21 +0100
Message-ID: <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the ADC controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 51c1e322826a..6bf8f9ca16e6 100644
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
+	DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,
+		  CSDIV1_DIVCTL0, dtable_8_10),
+	DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
+		  CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
+	DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,
+		  CSDIV1_DIVCTL1, dtable_2_16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
 						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("adc_0_pclk",			CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
+						BUS_MSTOP(3, BIT(9))),
+	DEF_MOD("adc_0_adclk",			CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
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
2.55.0

