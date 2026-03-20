Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD13386C39
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003798; cv=none; b=MzSyOWsoU9o+ijWj2EdNLfhpal+355ayrptBPRb4s7nFsOTmglI1lC6Je6ilql8ew4OKZPcFg/UIe+t6lQ2J2L7ApKFBtWftTyiv3R7U1mmFfkDOunEf4Pgx7OXjVnEK+dS/ufXzq+lt33s8FbtLvxYkdsccG+2jjX2CK1mSrvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003798; c=relaxed/simple;
	bh=ajpMcqKfNP9HAt82cwjHe9/52zY3oHxoR2gC6/k0qOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+GZoQhHEhyNQ3/FnEQWcuJZO+RQfKhbNc7k5RdZmkqGoX9BZ9Jnrp8ILYuCgYwIsTl8MMlkKj+mPrKqUemrZef8pRRFz6rMxdFjWAl72cLFIy3JaXKiwWsfztwIr9lE3LZ7p8vS6d/cOx9rXJvu9w07/jpcpYdxyuJ7PVLi8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUmX/j1O; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUmX/j1O"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2039247f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003794; x=1774608594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaD0/MOliBcQM28TfUPYVE0y6iDdS5KDXDCppjI2wrU=;
        b=dUmX/j1OlGI7bXannrHmAawXtUGVRMYfUVEkcMe+7yHIRydkSe/8uEyehZm3+LqFlc
         DeDpRJl4JmZ2FeO+5uwn3PfFaT8rYBgYtD90CPG3x36I11vJ8ZHhEODUADLOhJDsOYeA
         f83CpPPNmiLfcQw3UWpy8UWdOlSBU31HQWGqKpDLFolAXUuNcJ9h0lFl6Gj9VW24XhGm
         TwXnJtueRirPSuUtw5j+U/o7lnk0ap3GvTOBnBpSFaNNCl/CEH/8BFlUbAOZzvKLfH0K
         dD20nUDT+s5SFJEe5E9h8H6xXkoaFqIe3E3BYP4LSX5dVhntpDPBEe6oG8Yg2o0W73Wn
         BHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003794; x=1774608594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaD0/MOliBcQM28TfUPYVE0y6iDdS5KDXDCppjI2wrU=;
        b=eXSuD+GLSx/Ne+920Lp7bFtkvfSfRWK444HsxsBHcBux4pJtEdq9GHzgxdX4iNg1dG
         VPYdxipl5xEiU8LX70cGEFexStXzQb8WLsFdR3APK99gqiS2sHJGsV9cZm6RXnOfR84V
         7JbSs9Klun+KuGvFHZXQZPE4g3gNbsMgHXWx25eNrEv9kBAxE6wsh02vTP0Zf1H+GzPQ
         yYsF2AgYmL32nag7/Zc9sukGTt9wXwVLgPvip8iDRDQTscC1WR5ruzFOzxkMkkaFQV7y
         nFUj7JteDGsxe+SfVoLCkbKweL4P62LxE0RVBnomWbVXaFCuu3QXAemRgJEYivIi/t8N
         1HKg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1AS2gha8oEwC6eQtMAbbd3JnjF0pY3WEqBrI9Crp04qis318UdmzRT3/pEgTVkci4xFu1XPP+dA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CUqSUTCrZQwSr+LIex9ZUYYNNr7evGeczJeXojuHvSuG8AUb
	CvqbjYcFC9KqcKJ0QRNIi52nxPTvRYMal1lmNbcnhsdXMdSlP8LnbdrW
X-Gm-Gg: ATEYQzzZhDjP5GAied3jSRYr0uBtgylh8SjVGs6qA3yrWnbhHyNYYN8zHn2xclJ1w+C
	Yrvz+DwiTxPK5WNGUx4lAbrrzsrr8LiL5bjpKwCqb8OHhzGqukgfzW7tEJ4JpvCIFKkhkGpMyTm
	VyqT4em928ijm17B8elOgC7AIk9oHFqWPHAoQdShnFSeciem+xavu4rfUmgxK/j9b3ASnYV111v
	20nypxd5JGBltcX5BRDdGumvMFJvHe842BVujHZEZPK5lRRzaEeGFGhmWdV0f7uxUH35CC50OxR
	cBrkL9Bg7u0+onw9PpYDRvcc0c5+5L2rmuERp1VUIVvq/KEaRlpmBLvq4LWI2iphbE8ywns6E/z
	ZM+yEbDLVQvLvP2IcmOhxb8vODJHwJVGlKPo+n+58VQw91dHQdtUIzKjxoj+2GhdTslbM71e50d
	bBeophkUcrXhDKD5/nbnmYwt9/IgNNS3M=
X-Received: by 2002:a05:6000:4021:b0:43b:566e:fad2 with SMTP id ffacd0b85a97d-43b64242eb2mr5322361f8f.9.1774003793977;
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
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
Subject: [PATCH v7 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Fri, 20 Mar 2026 10:49:37 +0000
Message-ID: <20260320104950.42220-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
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

