Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4533A0E8F
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377418; cv=none; b=NyAao/JvzCYgz5T4m9ZwZuGLroO9apRjwhMr1NybCSckD1SUszj+639BaUenrdZnRkNtzkEEb4myyJXWFQi7Q6b6eUkaMG/bcr7pwGeJ4LPWlGjt8Pnfz3U0tTAbv62rXdmislk9GWjSHiRAjxxiLwkprlnw/wCslWBScEZta1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377418; c=relaxed/simple;
	bh=fRFREbmT01jfYpBr1PG4D6aL8uCT6THD5/lfmNdbvqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2n1WLnTzgkNoniOi/BotPcQhvEpDogqhJCbpHFho74S7zi8QoIdeh2OPgxxsZsGS2BRxEZznZcB2AZmco5tyPvNpn4vXPmKRb9EKLYRCppT9DA0aAeefu8YTQ/6WGq4CCeXFw3oWne4gZxMqCNtaPS2E20Z25fTpOpuc6kIpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI8GE800; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI8GE800"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359108fd24so1326233f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 03:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377417; x=1770982217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqVtpir5i9HPxHrDDRZAtkC+rLB9QDEYhWMhLfdT6MI=;
        b=kI8GE800udyyAVcr3/pEBU8vRslgklbE7kWGw54SoE1qZHbW1rxsiUR14XiJgIaWtJ
         DN5qpcXiIUKkdfMzNTc+vynK6YebEFMVmHQCeM+e/0YKdi2LAMyVs2fTkwYpq+Dj3m5X
         my39bG50tE+reKpi322jv2CKNlOWTQHSxlFBQvVo/Y4khRvlA6IVchS1CkqmVKPDLNsQ
         0ZHmZj3DTORjCOjb1Q/nMzDiHS1ON/U4LbW1J8awNbSMIoQvOjPO2tTo2nY5PwKmuQkg
         iFmluzHJEsyhWy/SxvAUchfNtX7gYDxac02r7x55iU9A97wgn1GQ63T+RygvbQ0Zs9BM
         TphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377417; x=1770982217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqVtpir5i9HPxHrDDRZAtkC+rLB9QDEYhWMhLfdT6MI=;
        b=CVgkXKYnfoa8TpPW7udmFQGIwq2dn7c136OyoSMD/YDuahJy0x15cQZ9cPk/g2EXue
         nMzUtliW6t+3HNP1uMPl6sR7ebaR8P33KSG0YlIEWaEaVgZWt3G4qR+nSUb3E8v50pLd
         mt7fzy26/zLF+/v8Jl2WCQV5QH9jc3rXc5a6L8H6/ikr61ahlyxuCm6kAyKaotzCQb7i
         WldOZHqIIGmD3+1z4tgWJL1AT87p7Ex82dIJk7jDG9r4cvt5DSIzHjaPAsg+aRL/M62K
         pTEHyVbl6KSKAXf/srmB2bEg8ca4Tk+Tj0mNDcTTFR8UEbBntKRORAIWGnhYrDZAKlu4
         RXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW83aJskGus7sBOS2nxNr0YXFJqyxd7MKA0IYkoG/6CgGNevPUHh99gDJQk6AtOzHcHW5y5VhSfKL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKu2v5Y24VgelhYfhJvCHrJrlDQkZVk4n8DGC+cjvwvpQtPzkv
	OjDWBc71ZL3hCH89Fvw7fyCsq0lXJOIRrg/v0WNy3udJkEmsi/7rj3O6
X-Gm-Gg: AZuq6aJr7BHwdxCWE5PMr9yTc4ZXPui1RrWFX3xrIOKo+61kvMpvGJ73Imwhxl3pE+F
	ZuLpJqJpdcgK41ciBbiKn1i8TXpVNovk8/bQIY1rs+Qo1R2DnTUyqPpsTCpdUcBlthqFlZ+vlSi
	woKtZgHv1P93ZDjPX0HjpHDks9hnvGkq7Q96T7YgeOuMM9Wu5ivaJWGT8sgRpWifRtSkUJTe0ee
	wNSDi+o7V5whDvJEDL0BLX4YAfK0l5t3P3eAEHKB/E4bs6p28sLub/78ApRMdXE4NVcRx607mXW
	FFGUiViSf4diXhfUEbA5blIZix+og/zolK8hMOnyVsCiRPvh3D2s8Qb2WVXm2B1DSEj3by/OPFE
	eNSaOKJIriR3haQlL9ZwGfL/Ce2gdRbz/8ypVzeilvwrdRn9yChvX/MKGV1QAAlK0ChjH7e5xID
	ShL88R1ZN9cRsemZiY8Q==
X-Received: by 2002:a5d:584e:0:b0:435:8f88:7235 with SMTP id ffacd0b85a97d-4362967dc28mr3473624f8f.33.1770377416936;
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
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
Subject: [PATCH 1/2] clk: renesas: r9a08g046: Add CA55 core clocks
Date: Fri,  6 Feb 2026 11:30:07 +0000
Message-ID: <20260206113013.233432-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
References: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add CA55 core clock entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index b7753a331772..6cb3991cfeb6 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -17,6 +17,7 @@
 /* RZ/G3L Specific registers. */
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
+#define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_ETH_SDIV		(0x434)
@@ -25,15 +26,24 @@
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
+#define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
+#define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
+#define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
 #define G3L_SDIV_ETH_D		DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
 
 /* RZ/G3L Clock status configuration. */
+#define G3L_DIVPL1_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+#define G3L_DIV_CA55_CORE0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
+#define G3L_DIV_CA55_CORE1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
+#define G3L_DIV_CA55_CORE2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
+#define G3L_DIV_CA55_CORE3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 15, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
@@ -62,6 +72,7 @@ enum clk_ids {
 	CLK_ETH1_RXC_RX_CLK_IN,
 
 	/* Internal Core Clocks */
+	CLK_PLL1,
 	CLK_PLL2,
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
@@ -84,6 +95,16 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_32[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 2, 4 },
+	{ 3, 8 },
+	{ 4, 16 },
+	{ 5, 32 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_2_20[] = {
 	{ 0, 2 },
 	{ 1, 20 },
@@ -134,6 +155,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
 
 	/* Internal Core Clocks */
+	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3L_PLL1467_CONF(0x4, 0x8, 0x100),
+		    1200000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
@@ -153,6 +176,14 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
 
 	/* Core output clk */
+	DEF_G3S_DIV("IC0", R9A08G046_CLK_IC0, CLK_PLL1, G3L_DIV_CA55_CORE0, G3L_DIV_CA55_CORE0_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC1", R9A08G046_CLK_IC1, CLK_PLL1, G3L_DIV_CA55_CORE1, G3L_DIV_CA55_CORE1_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC2", R9A08G046_CLK_IC2, CLK_PLL1, G3L_DIV_CA55_CORE2, G3L_DIV_CA55_CORE2_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC3", R9A08G046_CLK_IC3, CLK_PLL1, G3L_DIV_CA55_CORE3, G3L_DIV_CA55_CORE3_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
-- 
2.43.0

