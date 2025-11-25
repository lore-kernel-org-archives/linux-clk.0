Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08733AD81
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108875; cv=none; b=nLS/pigyg5tjVUtQpTUVpr+Hvzmu3KBFYt6S1fqpWYurp7nux8Ic6wmZNDsfu2d/vXLRQdecRelc+etvnAR9+QsOFpx5jI547nzqa7z1CvQiKOJlUI1zfmLrSQ3H0CCxjcly+p+WOiODQfSUxBCscOfUz9i9CiXsoPTGeh3jLUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108875; c=relaxed/simple;
	bh=ieVmk/r37DgzjSeGs6qIdtiznjiv1WI5n4EoSx5CaRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWdYLJx2TK9970arb5dMfj4niYGDBiDow0F7PVnntu8SDVgRd57VYSzfCTeG9iiuv6arpvXloBAaRxn/Uo84UFUSWBZuwMs7QXwyggttSCFpWqQBFhLQiFbjwckJ5hPP2uiwudkuD74vy7vZIxI2iggrAvTBfvHu3hus5oOxBXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5ThUC5T; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5ThUC5T"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b566859ecso5321147f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 14:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108872; x=1764713672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF9EvNjU2PfrYJ746DaqTgf92wjMqKxNoWSk+rxmmzY=;
        b=g5ThUC5T6EAcAj9EwlS6gsSNxhwHBWNvPWtRvS2S0vEb4tIbn1VZRrbGUl+oY2S8w4
         nfT72IlmTMQU45zJeSOZFuNAZzI8W036TudaB6A6CfBmq72a8qZk2fivUd3I9kTu9tEi
         VTrYytLOxJH1zfHX+jpYPVbUXhu/tnqUYhvGLy44E7Bm6GBIXGdFZ/E+OlIa/j8QPqu1
         WNlH7+zuf0dMBDlXYB3fHRFTAFuTvNHOUQkLE+R8k1s/dXIrYSnbppgeZikhlCi4BSQM
         zGckIegYQRAZlrx/LIFQdv87rpoheRobhb2b6EcwFATT0ZXXX3tvz6xbctr7DCuHVJmt
         +E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108872; x=1764713672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kF9EvNjU2PfrYJ746DaqTgf92wjMqKxNoWSk+rxmmzY=;
        b=K7Y5ffIUU+ukoaupoj7WFwcH9BwwF+4fnc7CQe4LMUVfi1Kb+mDV5xRuTDaXF/iNMG
         qBxdY0a5PFyBlSntKANhTFDwX4mE1Z9NDchLILSEGoInZ49wOu/asoBtlYdRh+ywwPai
         b7kzGqnSqIIms1uRr+JY91VFTe+ZVVvWLd8AqwOUP9sWcqdZ49dCjEWa6JSiWPYaRDhw
         FRIXINhco2qwZVvsu6ijYRlD+UDvfBeOl94UerVjDqGhGXnyVKt1RzJGxgUEMda9mVAm
         ALspjoWDKYBMzIOxT86F3jhnAFRf4ZdPzHYTZ0etM9Xwuk3XSAGLrDJMBMGLCNKzEoPm
         GVtw==
X-Forwarded-Encrypted: i=1; AJvYcCUr1dEc7TWgrPF74Iv3VwgIxFM8OO1KqmCvQPisMb3Cur7LmFoxsCduGa64MIe1mUbiqZyl/iuJlWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhpDt1U2XGVRUU9BF3eQwpQDxqbQu5Nm0vRuuGf577Del7ZYAN
	Z7RvYnBXXNxes4PT56m5bBhmQezNJKzYoOgbC+WRRjIXtqdXzSG7u0aX
X-Gm-Gg: ASbGncur5P/PcP0Fg7sQuTA5TUxPNIeWcYAPltSM8Cf6f3o73YuWL+Xy3u0zZVflyCB
	tl8Uz7LJmhnd6GJjvRDPbfgyXvS4GG6SoNUt046rB0ZhSs6UX2noHP0EFNGo196gHDmUOlnAjS1
	sikEuZzSYWGpKmDjUy8x/sQRxvddc/Gh8pwJ7YSXDAiP6YXlicyztvs8+1brFci0ePFomE7cL7G
	Zrch0SWLiBW93UxaYvXZs0pxhwL8CQT+RHEM1K4NAm7pyYG56TVCV5aKJERw2iNU3qAvOwCwnNw
	74amp+e4MMAK+6fD8KySqs+ZlJ98hEMaG0RwRjy6NE6XUgLRNE4EEYafXSIW2+yV1J7NXEN/vvJ
	jkPSCanLsN9QvW2Oxy4mO3n0gfKVCJuVlM0hEMPCevZ//dLmbzpKlmFfH7u1CGZDoBxWKGPzc4v
	Mx1HPFA1JRt3NBb7CPMsRnjkpUUOBmBNNyZQ==
X-Google-Smtp-Source: AGHT+IGMiQmy0R+xrariL0SfMasthEFmrMEpgLOLsaKOLYZfkItc9vHrz4LY83QAaDZW0rLTXgTbvA==
X-Received: by 2002:a05:6000:430d:b0:429:ba48:4d6 with SMTP id ffacd0b85a97d-42e0f1fc42dmr4464560f8f.10.1764108872005;
        Tue, 25 Nov 2025 14:14:32 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:31 -0800 (PST)
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
Subject: [PATCH 1/3] clk: renesas: r9a09g056: Add entries for the DMACs
Date: Tue, 25 Nov 2025 22:14:18 +0000
Message-ID: <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the DMAC IPs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index f48a082e65d7..19b712685a31 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -51,6 +51,8 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_DIV16,
+	CLK_PLLDTY_RCPU,
+	CLK_PLLDTY_RCPU_DIV4,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_ISP,
@@ -184,6 +186,8 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
@@ -231,6 +235,16 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_GEAR, 0, 0, 0, 0,
+						BUS_MSTOP(5, BIT(9))),
+	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
+						BUS_MSTOP(3, BIT(2))),
+	DEF_MOD("dmac_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 2, 0, 2,
+						BUS_MSTOP(3, BIT(3))),
+	DEF_MOD("dmac_3_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 3, 0, 3,
+						BUS_MSTOP(10, BIT(11))),
+	DEF_MOD("dmac_4_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 4, 0, 4,
+						BUS_MSTOP(10, BIT(12))),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
@@ -401,6 +415,11 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 
 static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 1, 1, 2),		/* DMAC_0_ARESETN */
+	DEF_RST(3, 2, 1, 3),		/* DMAC_1_ARESETN */
+	DEF_RST(3, 3, 1, 4),		/* DMAC_2_ARESETN */
+	DEF_RST(3, 4, 1, 5),		/* DMAC_3_ARESETN */
+	DEF_RST(3, 5, 1, 6),		/* DMAC_4_ARESETN */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
-- 
2.52.0

