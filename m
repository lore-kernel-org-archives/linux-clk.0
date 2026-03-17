Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC6345734
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776693; cv=none; b=nmEunFOTgiEpi0mBMyeckogGO4hZcGZfVAV3z8GlCgetW7ozGzT2YdVHf+jRZ4T855kYJea/ha4XfsynYokK24tCNOfL/7OsoEXtYOxm86Egi/JsbLyPJ3CyPncKRkeFydOBCvc2YngHy8QH+TrhWHTcT+KQz9peXu6kIZ8Prf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776693; c=relaxed/simple;
	bh=rvcl8x70hBsjnab9fTtTkQT29M7rkPtwI3LOdVMcKIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udxl4UE5Tr63goDr4DOKLsJA5kEans/HTYQMygDNwFJL3bjiK+Fx9m29EdPfGHcIp602tLyvF/t9LD3l11da5+m06LHFWKulY/cJ+gYqX3rQWDOT+jPzJxsfNUlCh+2ixqxlI7R3gwhkrNKy1uclIsFnGgNL3yJHlEUjQrlP2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr+OuwYG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr+OuwYG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso4862968f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776690; x=1774381490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=cr+OuwYGYXSq7s7cpYwDDwPfA0pvA5l4opZAy7JKds1qTc4oMwzcBDK2/8xUrbsodl
         gCt58gODJN/4eg7snPWgCr7StU/UwgbmGHrPqEZ4JsTcIQBwDxyHFrZ0weZJ04xh7Apv
         N9rL6IY9Rk9KiawD0glwgc8xooHlV0JWhEd5Uy6mgSoiPmWgQN0u4Y/cckTf7Jful7NN
         bIRWFs3VdmM8AV0VC1JDvujj+O551IvlQBpMVrfIBTsnZMImCK6cD2VuIsB5eqE9+JYp
         P4dSOBL8/c64+puBCM3DMsTzeXoQv7Fib5hECqNx0NR/4eZVrITJ/msyhcrdmVSuefMd
         cEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776690; x=1774381490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=aigTCWSRu4wKHEBt7zatZ6SFzYvyQ/ORSZ1COvLN5ArVt6uKDnrr7hRMZiJdRatsyS
         IUZ/qc1uippwfFt/C0HB3Jj4go9qggn2sKsgWwGCNqwDGE0JZtEdlK8FseyZg5SR/i8H
         kv3xenJH6D00v1AMvFqNwkHgT2PRBwyGpLw5cBbku02sRXwpVwMQNuz4neFSLW4QTMOH
         FeEEkX1CGnz40nXtlTNwCdBc3oO4UofTE3dfFyYkEVF+F/7zLrcuAo769x21KTPj4ntE
         EdV3ZWlU7SbFR0ENRl9vv+/e879qV3yiKLJhRnx35fgnoU++mZRoDedBeV/DDG29BqdB
         iV1A==
X-Forwarded-Encrypted: i=1; AJvYcCULGynfjgBnI33JyBmtsL/Oddn0vd/KRJ85tKQgB8Eb9wQwW/ZKRbTrT7PlXuoxq1hqE71v+hRTOR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoDr6Ws84mj2MgGbz+Xz8i6lX8GtZTwyQNqHHpHX+2aSThGAg
	UNFToDnPn/1k60i+XAa2jos0VH1JWKhhSZf7Vj1jfHme2IUxcrUScPRH
X-Gm-Gg: ATEYQzzlpZUQagAwXjtp7vVZtcp/2nJOSf7hfLlIWUatzYU8sRLDoHlET1RtzeAjZ7O
	0/e5sfZPerFj6gJAZSMKT4pRqOdtybnwxcn3le4w4Fv1LgtYKVM3d8mcCpSIxFwWTmIUquemrd2
	F6BrXVvpe+7Rw0MJN1fKORkLUTFRZTm9y4yjR/pr8Yb6c4VpUVxPim8zAEoBAalIIXwpo4lJNMi
	WocCMi+e8hOHQVgoqUKFt2lsTN8sur5g7PQUZG5ALBI/OnhLF38qX5+GkTvmndz7nzsnqiKfXZM
	Jjym2CaE5B4kyCQR+lozO6MexlVaMusykYU7R2Up5F//CokiqnS5jpvAsEUHo0uch3FBUR4x5jF
	17Io2NktgTrZs91/+8wiZNdgru4nZpz+SKX2+3HipRoM8ltDq0M/hWbb/foXU9hhlUJ7tt1dP+l
	hFNpQowr6yHOvjoptXBXiHP/P0X4SxXFzy+SZLx1wUvwhtYpIwlhLvOua6aFw=
X-Received: by 2002:a05:6000:420a:b0:43b:514a:ec78 with SMTP id ffacd0b85a97d-43b5279c925mr926507f8f.1.1773776689847;
        Tue, 17 Mar 2026 12:44:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:49 -0700 (PDT)
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
Subject: [PATCH v4 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Tue, 17 Mar 2026 19:44:30 +0000
Message-ID: <20260317194442.468147-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  8 ++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..01d741ed8dc5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_critical_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..7f1405cab9c3 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_critical_resets[] = {
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
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..87ee43f9fe18 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_critical_resets[] = {
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
+	.crit_resets = r9a08g045_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0

