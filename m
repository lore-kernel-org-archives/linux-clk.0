Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3309285CA9
	for <linux-clk@vger.kernel.org>; Sat,  1 Nov 2025 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973268; cv=none; b=WJ1LzNG9QIg6wsNh/ce/i7zn5Nh16cDaYK9Pf9m9iQGbypHGLDzTQfpPO/coopWjpr8tG+In2oJn2O/vtiMl2BAVidL9AM12V2zl1w/EFwJ6uw5IV+mtjqAi3yrx/em4P/rSg2y0LgMvGHP8z4RzKFKSaiYwTo2REm1kFR4VUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973268; c=relaxed/simple;
	bh=7CoecAazZVUZJo5c1x/39QLu8I+tPMMru6+eOKh156g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4twLqFAg6XBTXO9dxqPAzgr7ss8RBsGBnJobQCebqMWnQSn2SsLq7HXvVgzYAk4+hwwYH/xkkc0t6i6O/UI/XLOksDvqNcaSuBVEcJV0fdl1a8haEdB+7ZFkzCYULv463DoskoS9AAlx7//+D8if/sl579sMLV9T93esfftsuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpZ2Wcl5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpZ2Wcl5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340c680fe8cso73293a91.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973266; x=1762578066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+IGcxRP2HUQNmNa/PX5gbUVFNrUfSy3Bcn1D58oBqI=;
        b=VpZ2Wcl5a8pfWhLtBBNGk5fqDnfa/krJDzj5ub+W+e7cvgCfREBYzf7/R7duLF7w1k
         HPn+z6xGoPrHSWzcFvKGjFWLhpa50cq8TNdHMf+MB7vnUxJ3e/ENFZZdZlWon39z2exW
         M39cEKNVyvcLm89yil3V4bRE8IU4imfpNq28XDM93pwEU/SNPovRXbBPseMYAHMjtTEq
         HJApOwqGkm7XgXzcEsqiLsxdaj3Sz/MznTF+AtsoH48ms+OHlG7sr1VE7EA/LeDgOBRY
         l/+7r5Y1tEexuNQmNA2S27CZRcKX37oaY+Eto3fz/xpsIh63AU3oIt2dYOjY6YuaZYQp
         75Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973266; x=1762578066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+IGcxRP2HUQNmNa/PX5gbUVFNrUfSy3Bcn1D58oBqI=;
        b=Ev9kRsuXWjTNsS4ClLrFd34V2lt/l7ugLDn59TnZB6iemt62mbuUNFyhluVgNcBuDe
         lDTikMIsHqC3WwdLYO2HHm/RCi3nIlge4wwqAsiq9hE/DHnVHnqLURipLnmcyqpjYNap
         7RiJg8xoBBGrgBiV1e3GiFcarsVxdzofNkN+NKD9VIBLRmeY0Rx8/g+dBn2/tFYlQsNg
         YZziNzwe0/h/rfXqx9W1FtZBJUGSSVi6lovOUwB40MCqRvuXQ4zucL34XtbiAyM3Yr7M
         7gyStOOVtWilDl1Bl/LmolQNUicZMMgaYPT9JZ9MTZlL4uKiSZwRXhS783DZAdL9eFF5
         FQWg==
X-Gm-Message-State: AOJu0YxSxO+DULfeMdEAcFIYOAKw4fGtl+saYxlelykfgRDpAq0cHjmW
	wXqMULQsyQuFWGTWFdI8WtnMvtKhOUiHlIFkCgrRgZhpd84g+WyENx8X
X-Gm-Gg: ASbGncthX3HwcMnha53s3Kgxt5xL4zO4x/jgaLE92miZ0GrRiuhuEI8TGZ3GVUTBmpG
	NDa4JHafyRIeD1/rAHgFdqZnYp7b16ShN1bDaSTndtUgGjGk67tNh+m3qHssCxHGkYepR6m3qtI
	scQ7+LDHKR9rZ1p788OvpxR9Lopdh+CKdAVa101uACSOKzsAzPQfwhOaK2VIhP42hfkXOigzUh1
	Jiv9EWSGB3qmqBxAIN/sk2z6NetbSusC+Dk7Ajxu2dzatBkdnGIhvGIX3OXaHxG/E7m83duRZOh
	OHWDOQSjgeWN4litCDz6KlyKT8QqSe4UZZF2hpHvnW24WGC4QUpj/8ScPRUImBdeT/qAYI5LwZM
	OMVzzinF/wjSIfK88jXFJJJB4ASzvPRdEQkmVgMzb6HQ2k1nYS/JogISo+m0QBy2Mvw4e/1Vs7i
	go8/TMjliCtaUU7VwtSzzNCmPudAnduuQ=
X-Google-Smtp-Source: AGHT+IFTVER6tPe0BrYgVjVhCPj/RhlxH2w2OGMnx5CtQGWOImiI7geL9hbHegU87BWWBMj9pLwYsQ==
X-Received: by 2002:a17:90b:28c8:b0:340:c261:f9f0 with SMTP id 98e67ed59e1d1-340c261fc6fmr822666a91.15.1761973266042;
        Fri, 31 Oct 2025 22:01:06 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:01:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] clk: renesas: r9a09g056: Add USB3.0 clocks/resets
Date: Sat,  1 Nov 2025 05:00:34 +0000
Message-ID: <20251101050034.738807-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USB3.0 clock and reset entries.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index e4a6dfd2bec9..f48a082e65d7 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -17,7 +17,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G056_SPI_CLK_SPI,
+	LAST_DT_CORE_CLK = R9A09G056_USB3_0_CLKCORE,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -226,6 +226,8 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G056_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
 			     FIXED_MOD_CONF_XSPI),
+	DEF_FIXED("usb3_0_ref_alt_clk_p", R9A09G056_USB3_0_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb3_0_core_clk", R9A09G056_USB3_0_CLKCORE, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
@@ -319,6 +321,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb3_0_aclk",			CLK_PLLDTY_DIV8, 10, 15, 5, 15,
+						BUS_MSTOP(7, BIT(12))),
+	DEF_MOD("usb3_0_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
+						BUS_MSTOP(7, BIT(14))),
 	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
 						BUS_MSTOP(7, BIT(7))),
 	DEF_MOD("usb2_0_u2p_exr_cpuclk",	CLK_PLLDTY_ACPU_DIV4, 11, 5, 5, 21,
@@ -426,6 +432,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 10, 4, 27),		/* USB3_0_ARESETN */
 	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
 	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
-- 
2.43.0

