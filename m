Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048237C902
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472863; cv=none; b=OQdlgQrGOJu3nFoqPDugLyFnzSCT3SRudrStoyifdi89pIu3CFj2C2paSIaxqjnJhKzuXrWnLY6IGmGDBZWywDxTGm/FFyzUikQr2rMJSPIR3bR3IEi/wsnvp0x3ShkNYjJLfC1eO9EQgayyxS+p6pRp/16j/6ZiUkp4wCUZAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472863; c=relaxed/simple;
	bh=y82V/y7wUGENbh+MTlJod7CIcKBdfucIx1cjreZViLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGdHwEEwNgd/10BCYv7pjuACMKOmvUlxHH7U1iKF5v5Lg7+JVrcu8CYw4Pb+wqMRlEqJiM/W5ztHu8NZEcqYz12SaTCbNknFZaVuxBgkQC3xWyWWwV58V4R7g++Vgt5y6ot9IyUq/7u7AOkNbTJOdhBJTM+4Kj79DXhMC/A4tdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1m7YLsJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1m7YLsJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso743965e9.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472859; x=1787077659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvgUchkimOkG9zLWcJshij/hNLupSa9WatTrjiEHw4g=;
        b=l1m7YLsJ46+JFQMgF+iTHndwP8kp4C6BIFjbYc0CT3xwzn0e1FEtynWwFn+bbI66Ie
         FX1gI3B2Ue9AB+IR54jBDgMIbkqBn+76kZI7AAsSR0EHaCz/dY8sE3akoDExhbjsdKto
         B43DsLRYiyTAdyQYg3J2fDVXOl4gnqSamiXUSESMbqmCOul7+oRCflasn2mdLBQPYKdd
         PJalx3DWQQ6hu8Zfc1ehPeFUZvDryEjGYCFFyVvTvpdgkOzZ6mXlPjVGKkCQ9UGfMqwy
         H95SLlzALtZguChtIOI6mmRYE6lu3gwfsudWfy0MUNnT17BLrlpbYRJ4KEroA0LyUiJD
         IEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472859; x=1787077659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvgUchkimOkG9zLWcJshij/hNLupSa9WatTrjiEHw4g=;
        b=ZAN1wHF9yyQUUMyVki6QGgUJiLd0FjNg9dCNgQII0EVf8U7r2uZZOjxILOEKzmLF7q
         mDoRlP976Y33w3dbL06NM5feDAeg6ehqSz9bkCpr2IWD81f33MfDh5CAC5WvQISQqjV3
         xapZ4UTLLz19nA9uFVE+dC96nK1RGcKXJI19z3zkp8YooeNFEHaKnp5akaJmnWmxa3Zb
         QwJ9rrDf9Iv2u9FAq9ikXdbKELbumX0muOe2Z8lABozouqtZiU3hmm4oEBmRpJv314Uz
         J6b34LeVLZANbzwGjBF6t/+KU8/pJ3XlSso9u6AFcYJX92+Btc/GvrQ5n4fcI5IpUDzk
         th4g==
X-Forwarded-Encrypted: i=1; AHgh+RomtJiK38mLzpBjEfwJ12MZVgHB/ua2KVYA3W/ed5F7ry/eo1PXh1dlNF8xjOWihF4b6ayOCc0gOE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2E9vMkTSuwJ5Se7m2z82gSigFh+aIbW8AXNB25+29srY9bzjJ
	LNSPi5QZya3hTSWnZQ7OE8GJKS4DWrxQ+5y19LJRiUPRhWRQQtFzsKc3
X-Gm-Gg: AR+sD119mCnmmd5/eag/TNsCVvv9fAdQaSEYR/3dYQbgV6sk58ncQPGQY8SovznxnUP
	9pYy43diLmMdD2oL7VfDOKw96JzniP3avbYHC5rWkSY046Nl5AIdefizeBkq39dIxqw2ZdY4maj
	Ev9+/F/WJFFQkhD4E5UjBwpAGiqn079cDioebxkKgxlEbqwf4DqNVygSl1LWUOJT2codCd6efYR
	tAO1Xy3Xe1XrnATQZ80lhkNfoDmu//HCGH54MwUPfpOw6Ij159KszA4LgLZTgoZMnUcKSBfh1nb
	/NrbQIafT9/ZPYgClF+Ik/TAfpiuyoXJqG9eG2wCLKvRFKu94VViAiMi68FLUZ3LWdxwEZauvUl
	K9esHACkdesk+vb+vvxyMk0MrG3zCtuGDVw3TDfmvI3z2iKkXegTuSLMVPw7wJxXe9XjzZ4/hqf
	5RMK6peVZ0kVJUlNempLA1Yru1UJwwz/vEH84GNUPBJr8jtbmzQTcydOb1x9Cj+BBfN90PFv+Zm
	WSrWLSGExwU
X-Received: by 2002:a05:600c:35c4:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-49978b37c8bmr106176575e9.11.1786472858658;
        Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 7/9] clk: renesas: r9a08g046: Sort macro definitions alphabetically
Date: Tue, 11 Aug 2026 19:27:20 +0100
Message-ID: <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Reorder the DDIV_PACK() and SEL_PLL_PACK() macro definitions so they
are grouped alphabetically by name, improving readability and making
it easier to spot duplicates or gaps. No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 4488bd1988e8..aaf329081e15 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -35,14 +35,11 @@
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
-#define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
-#define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
-#define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
-#define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
 #define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
+#define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_RSCI0		DDIV_PACK(G3L_CPG_RSCI_DDIV, 0, 2)
 #define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
 #define G3L_DIV_RSCI2		DDIV_PACK(G3L_CPG_RSCI_DDIV, 4, 2)
@@ -50,6 +47,9 @@
 #define G3L_DIV_RSPI0		DDIV_PACK(G3L_CPG_RSPI_DDIV, 0, 2)
 #define G3L_DIV_RSPI1		DDIV_PACK(G3L_CPG_RSPI_DDIV, 2, 2)
 #define G3L_DIV_RSPI2		DDIV_PACK(G3L_CPG_RSPI_DDIV, 4, 2)
+#define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
+#define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
+#define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -73,16 +73,13 @@
 #define G3L_DIV_SDHI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 24, 1)
 #define G3L_DIV_SDHI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 25, 1)
 #define G3L_DIV_SDHI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 26, 1)
+#define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
 
 #define G3L_SEL_SDHI0_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 16, 1)
 #define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
 #define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
-#define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
 
 /* RZ/G3L Specific clocks select. */
-#define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
-#define G3L_SEL_SDHI1		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 4, 2)
-#define G3L_SEL_SDHI2		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 8, 2)
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
 #define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
 #define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
@@ -101,6 +98,9 @@
 #define G3L_SEL_RSPI0		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
 #define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
 #define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
+#define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
+#define G3L_SEL_SDHI1		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 4, 2)
+#define G3L_SEL_SDHI2		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 8, 2)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-- 
2.43.0

