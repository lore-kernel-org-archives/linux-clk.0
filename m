Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E83D4119
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877036; cv=none; b=MNDb7dU+7X4k2WzmoT9sY+0quG8aV6w7pct+z7QlIt6vwOgkF9+NOF5gjjPAWrl/wNkzHnA141ME9ygQ8Snb7keQYbgPm0LTYZQUEP2ZDZMEuk8NjX3v2qKc6Q7wA6hy0eWjzvjfi6GmnRd0jdt9QSxcNyobOlNdrUjDpVMp3mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877036; c=relaxed/simple;
	bh=bRArHes47JWde1bC7egfGcbgnSM8Lx3eSPcdh05X4R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQbCfgphM5NMOoWjIVeEw596toaZBM7gKMk+dRwjZ9Z3fw7JnAciI2ZwejUgDHF88/nJUtr7aFRnwBJtyrJL/5d7Ij9PZR0571lH/ED6scra4r4SQ2ri4wRUTEbB2GRV3VVvv8r0dJoinah9BeiqpXDTVQUAJm/YOVsl/8KZ2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l14qBvGE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l14qBvGE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso2553112f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877033; x=1775481833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcvCEhkrttsFhRawb3q8Twe0Xk0/UhKtzUoezNsmPyw=;
        b=l14qBvGEPNPzP7FJKIpb+7ZBezdHPfvBt2/NIJk6Wb7CT4o3RLxF6wd2NlR/oJfnDY
         U7JAAA+Y58n148KFHmWVHovzDd1To129IviHQaNoKQ/X6d7H94AenmvCqhvx5Bwq92Je
         SpfL6XPaMSVPMDYzuCdZetvM8/jM0YSpt+u+ZErBxqbLddgyEtDz+oxw5Rknqfl315cs
         rmoY1P+ZmkoQc2amLuyKfPqgTFt+Uo2c7pAHabjRe4EBu/MJKoscPCd9Uzni4b2tFwTl
         PflgayuBn/pL6QWddqymL8qnZC/CUi9J5sTD6yBM602GLBhBuVwfNgIbrsHKMS9Ywc1C
         V9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877033; x=1775481833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcvCEhkrttsFhRawb3q8Twe0Xk0/UhKtzUoezNsmPyw=;
        b=nSAMjpIwGdBPFcS7RLDOOA5ah8j260zR379fuC/3c5U1I1Kj4/thypdKr9UQwkZCp4
         4DJxk2tucV9VNwQoes35wknn2xMRITxeoBMBu1u7ux7W+dC4VEdctMTwDWmx1qn6ZoQV
         zYPf3yExEtuDmtRkQGasiJK7YqZu/Ld8ATkyEPHnc7vxLvUSnu7ghutAswdNzAHCRwiw
         /6c2ggTV4Cnzj1oxN13mLmYGLVNCKNYzEYK0kqSEoSs2vbZxPBfT5DiJWCQNeYYlZhqb
         Dj/j/Cq1RaxbixWhPI/ywS2dLNQ9CLuv3YxfsVBKbql+1IvglghITPtAwMoZuRnHNEqp
         3nMg==
X-Forwarded-Encrypted: i=1; AJvYcCVmoPaU/py/3oVI6sjzd4friXY7jTkTjpXGJEvmMW9QOWTaAMnRe6KU4vhZH/paU9htp+CWabfYPHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YymTRQIP2dKQR7CSf7BPy/LmBMuVI6rAlVGf7D9WR+JLmz8WvoF
	DZxFJboECq/ALz3ZqZpCLQUPEil83eOkhQkQaGvpFdpF0Z58qYRL11nP
X-Gm-Gg: ATEYQzwUHdQD1gnpZvgUgVxCj4QT76BJGtFmyGwEhB9q/DmJxLAHmKxBWQZO6gn+1m/
	2H0tZADP/y54njXz/oDS3j173tphZL9jYNdXiW+5VyE5ctWZTmJMfxznszJupGQbqf+MRzic2H/
	D5MjWyYKWMqmg4wA9w+QbR88ZA+XNHppgBcIirVaQ79wrviWjxeH/ozc9mrirmLzkzgafMqt7DI
	0uF4Tw8WnxfKZJqwHBT6K83firjx/xUBxqqS63zNTqkiVLXuW1bcCo9ffLeqUjxBFNP5aEhbvwz
	MBH+g3Qjb8QAX8e8qZTKaNHD6JM1mo/xwyB/QtE2RJz4CoP29QQkPlIsW2l5aqrYuOHfnL/iuR2
	J9VcI8W7BcZuQAubuS+0o/+TyB0leyv/RfZq50StqKgzwR0TWKSfUo4m62vZVRWJCQlxsMn+vgL
	dYDh8OG972LciHS5C+BLM7+8z8fv0pIg==
X-Received: by 2002:a05:6000:1ac8:b0:43a:c70:6f0d with SMTP id ffacd0b85a97d-43b9e99039fmr23485564f8f.20.1774877033176;
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:52 -0700 (PDT)
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
Subject: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
Date: Mon, 30 Mar 2026 14:23:39 +0100
Message-ID: <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
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
index d31572a99f73..4618c4d1d503 100644
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

