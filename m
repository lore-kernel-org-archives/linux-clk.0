Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF93F0ABA
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352623; cv=none; b=t7Y1czfJObtKKyWIjMExL1PgNtipWSrYoTrr5SO/0+m40fIe/8+MUJcrn4ERMdex/2a/6LZOZ6i5HommYs9k3B2JeFcb2A7qzMEitnI9VEF6HC1/vRX94LudTer7FjIbz8BjAQPPFgjhcl6o9OjTEfkBlvtzdSDF6YYyCgorjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352623; c=relaxed/simple;
	bh=5n+qOn0hIXqrgiVI7V0TJR9fN2uaFfd4IpzlvpgTGIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9t6qOHMVb69j21RryoRllS5WvaMpOuGpctQ55eM/jFfvmkXRmYPTxazBu8lFdj/gE1zoEgpp6vVUCOTSFIfy9q8dM7g6/G7+Hc1swZixJWLD5N5ny195i3AFSplWmoJhIPOFtvE9Xa3yoys9+3wQaTjt5yE0nS48MUjTfK+HhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crSzEHaD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crSzEHaD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so32660095e9.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352616; x=1774957416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFwbwZSb6QeRoEKz7hzYCH5JQTk0Zj5Ht1pVW1ybioI=;
        b=crSzEHaDQqUKoMdrUs70mnOMxViur1wathoYeLAbk7FQQW25ey8zYhKqmuxvKZiH7H
         VEvzBmopcqzIy4yGzWpeVbkYQjBHp4injCowTJm1sJVbEroMEnoonPKndq4VtxJMSTlW
         vdtOuigbSrhXK1KUXaQ5UVKDg93fJThHwpiAeBG4LO6J5HCJv7sd+l8rQ98/dvhg7xqJ
         O2TpPPEHh6ys37lHNi6Qcr7nzjOGd/LI+a7e17P5Tn/pntxERK+2aaehnULULGmrIEOE
         cUBWOUXlkogcVgEo5+SbRAtcnG5X8F0JZuxc2eVe9roTYNNDTHwwe0nr1RXvEYEr4rpt
         z3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352616; x=1774957416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFwbwZSb6QeRoEKz7hzYCH5JQTk0Zj5Ht1pVW1ybioI=;
        b=owpPwg9MsAxF8+QIQyVCPpuyRYJB3tvY61jn0V+xFi9+/Ua/V/vGUTqmaQ8k0zE77l
         +AyzWKY3n+VKpOufbztlCbW080ZbZJCn5IJubkpQMEGLB/66JPPbOqOZo9/pwcgDs0yd
         MKJUL7sE5VW5nValny7JkO1Q0xkbhPInl7usX338BvqreXMQTXmJ5RGhAOnXM0eEmtEJ
         orXcxLHQae4yK8aTTUHgRtgZB538yHT2aaULA0rsynkgT7xxWtSIrzczBJUSVfgtOtkf
         qH8/CIg2T+zSZM0hjyCuHQ8SjpuHGuSOtZV9jer6mTPqu0FSiuAxeF1kR0Ysdd/MrDme
         Jf4g==
X-Forwarded-Encrypted: i=1; AJvYcCVXsEr8JH8/icTyUijpV8vuh5K5YSS2z4xmAFNVVHySC98s+S6OMtuvdtXo3VUj8XjyE/NEKoDDzug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3G6ZrrohUe3dJSeaq2stncHbY4ao5rt+4MymDpPk44zoaujZ
	qNI1kk27TnzUCXaAn/Nc/t92vW2NY4TgeL7yIbvEWsPKwLPQ+mMKdZbO
X-Gm-Gg: ATEYQzy7yP7X1azGKuFbfJYc2WHc/63h25AngMUN1x8/6wHtMCOBkkBM9g2IHpA72A2
	Sy9k6tlD4wbBFEkgiWLX91UG56/M5/eUtBennGUVL4jzNw7GeundHxaatgL/w69ko3OU3jb9m2A
	PhTN3TIG/XkiyhWalZ+Dfuau2k4ifpnSUo65Xy71RQ2HawTkbCHCURXy9YPsOAipuUC86Eh09Nw
	i7n4q5cOh9YR00W/WfSNnbmZL2XXiqvk+G6hWOIbam0z7c1whqZwDeKzSmd4Npgko/baMY3oCeu
	AWNLSgyYowhnRCvcHLAceM6a7yUBcIkT2jZ7ohqKJXnM7VQG8bT8eGQWY1gkx20cXBSShC3vuzH
	ldGJWenXtQeNl8EvY4ZTWw9vyv3SoLzXjYgEsivsMLP/vW3KLKBnidUM3F8qE5jmjtL1qFn/eWQ
	H92SHpaVMgPFzgAHT8tKvuq4hSWdIkVptgqE1yVRH8SIoqAtKcJIFiG4sC7Cs=
X-Received: by 2002:a05:600c:4705:b0:485:3af5:7e53 with SMTP id 5b1f17b1804b1-486fee04f94mr209610845e9.19.1774352615552;
        Tue, 24 Mar 2026 04:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 03/11] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Tue, 24 Mar 2026 11:43:08 +0000
Message-ID: <20260324114329.268249-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC family requires DMA resets to be deasserted for routing
some peripheral interrupts to the CPU. Asserting these resets after boot
would silently break interrupt delivery with no driver to restore them.

Mark the DMA resets as critical by adding them to the crit_resets table
in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
ensuring they are deasserted during probe and resume.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * Updated r9a07g043_cpg_info by inserting a blank line before
  .has_clk_mon_regs
 * Replaced r9a07g044_critical_resets->r9a07g044_crit_resets and
   r9a08g045_critical_resets->r9a08g045_crit_resets for consistency
v5->v6:
 * Replaced r9a07g043_critical_resets->r9a07g043_crit_resets for
   consistency
 * Collected tag
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  9 +++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..70944ef8c5b8 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_crit_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,9 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..2d3487203bf5 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_crit_resets[] = {
+	R9A07G044_DMAC_ARESETN,
+	R9A07G044_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_SYSCLK,
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
@@ -519,6 +524,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..1232fec913eb 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_crit_resets[] = {
+	R9A08G045_DMAC_ARESETN,
+	R9A08G045_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a08g045_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
 };
@@ -389,5 +394,9 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a08g045_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0

