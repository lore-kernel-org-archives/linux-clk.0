Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8263EFD04
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352623; cv=none; b=X8cptQ8AJZm2il7DxZLRz84JwUcXvCrAO9LHGH5f0CBbRBXDZCiduAZuy+sP9LziWGy37WKyVFWFLMC6eDVl9Hy+VMVVpCvipNbi6T8eQqM7ajzf74slzJPTJSiXXs8q023hf786gJVEeSPXEfnMHdpk9xNLPdaGY1NCKvfP/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352623; c=relaxed/simple;
	bh=tMIliIfFi5lR2/wRIsIo/Pu8rrmOHm9c6ZsxrsgHRV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXbOaYxTokvPSCeakpGxwog1oE0IFPHX8m7CMd14vSOo5tijJ0Fctw7mNuLcMtu7uIK6OhNG0B1sAPC3qLDVeEr0vF/XfKKXBQv0cdXeyS0DsZW3jWM8SU4wmTZtlA6DIq6xVUAPvF56cvaU+NWHKIsMsqLPzYIfEJcPANdALHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYg7ipM/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYg7ipM/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so40747995e9.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352615; x=1774957415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbEI/M0HqfFMx8pnHBxJmnqRJ3E+kcbAEuNKlxD4MiU=;
        b=rYg7ipM/mWEmcCmMbOjn/HtY6ZCjgYx9L1DGhBMxK7HX0Msn8r9w2bJsuOtdRD/E84
         uXgIMzb1Yq1pAHZQW30sW2ysat+I+SO5tIgA34NmweE4ZS8ZHKHbRKrnNHRN0mBVkEwI
         /M6r7FsHILKMeU94uS27kkYpbea5VDNJwL3jxW/GKy+LNTBtq8jin7zPRcD0WsVseP7s
         Y745ffbNMpxXrZ1cbxlcCt4ZwGUszkf0sd/6Y1f3hVf8aPcBTFr5avTq2tkangjmyQe2
         fxyBAezUp9RTupWUQSSCdFtCOdMDOFvBonA6Yz2/ltlWxr3HhaDVaVF4mozCSqIZPyPG
         mDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352615; x=1774957415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbEI/M0HqfFMx8pnHBxJmnqRJ3E+kcbAEuNKlxD4MiU=;
        b=c+bVJZLsFt6m6MjfCxxUAO84t4M6CZoCj67tZ7q7kh6zdFAB+wZIv4JZwr3eYy45Ab
         fCTNnF9cMBD8WoBBF0vPvH4WF643jgno+C3HZMZWzg6suIAmy+STPfbiIsUDKnjYBpml
         iBaohPCJKiM8BTpcNVkirgj+5Nx+XHCkjtQ6UpcvBVF+Yfqlqc4fy38t68dOyidTywUj
         rNG4xmHGMxlhh1POcJTBuqg1dVpwYiuU/EO33VfgLg2QWgz66l4O4T7vXOiqBG5znnZt
         U0b+JI0cjQ2qa5sNnlHdqaz5y6+qSqf/V6W8WgHAu9XNiCCJyfy6irTKOaVOfl+A2Inl
         i9cw==
X-Forwarded-Encrypted: i=1; AJvYcCUrtBmHBG3zCQ0xAMjfnDM9Gew1kcmHonRfUtVvxurdJO3mWBhvxjD4lHwYl3BHhxydRB4Q4uB1ncI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfwwo+DIPgz1iTIWC+VdDKrJ1rVFXNwza/lNpBUeX7TfeoBsRx
	ejEWNK2gPs089VlkMosHcFWj3pqdrv2hKzN6GOGl9Bl5VrUv7BBtoVRL
X-Gm-Gg: ATEYQzxuLpPqwRqT2dmHHxukn8VAPpPhJFE197U1IrjHr/O0MfA8CdETAX8sJ5Rbeu7
	0y5nGgxDKxfyyUZb35U2vOGXp8xwcFExtb46QwkS+FLnVEXE7KIdfKtB5YAEmyWL9FXY+6V5zKl
	u6TqrXzyaeHU63rAF8NtBfHnWtBBemoezeCuKfbWV5/9/Iz5fwVAbE8BES6M8dr0V80j9TjSaq+
	H+8ltt9R0rNWF6QDa073iy5VnQaqNt4tYROGiOotajmGcCpQyTkDoaqKzTL9Zw3Onfyv0O4nvGt
	G391XS3jhv2mTpuLC0RTlxXL7fxQjNzAMSSk8Qqgsow20YCyPhDvWdJSXIvGGs6RdfpobsD+g2n
	tQJhS0zXjC+7C7VDuRKp1lqOTsIzwaz5pllusCsPh38nExWxTCpIp1XEld1pM2zZgYrWRsA20za
	1YLFxYcKSGvgtV0ejbXoFBXpzYRnW6tnaM9FKGmF2p+ZVWP6rT
X-Received: by 2002:a05:600c:1e09:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-486fedfb677mr229085025e9.11.1774352614349;
        Tue, 24 Mar 2026 04:43:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:34 -0700 (PDT)
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
Subject: [PATCH v8 02/11] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Tue, 24 Mar 2026 11:43:07 +0000
Message-ID: <20260324114329.268249-3-biju.das.jz@bp.renesas.com>
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

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no owning
driver to restore them. This mirrors the existing crit_mod_clks mechanism
which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
some peripheral interrupts to CPU.

Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
allow SoC-specific data tables to declare reset IDs that must never be
asserted.

Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
resets and deassert them. Call it both at probe time and during resume to
ensure critical peripherals are held out of reset after power-on and
suspend/resume cycles.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * Moved loop variable declaration inside for loops in
   __rzg2l_cpg_assert() and rzg2l_cpg_deassert_crit_resets()
 * Collected tag
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 30 ++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..f9e4af7f49d0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1765,6 +1765,13 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (assert) {
+		for (unsigned int i = 0; i < priv->info->num_crit_resets; i++) {
+			if (id == priv->info->crit_resets[i])
+				return 0;
+		}
+	}
+
 	if (!assert)
 		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
@@ -1802,6 +1809,20 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
+static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
+					  const struct rzg2l_cpg_info *info)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < info->num_crit_resets; i++) {
+		ret = rzg2l_cpg_deassert(rcdev, info->crit_resets[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
@@ -2051,6 +2072,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, info);
+	if (error)
+		return error;
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
@@ -2058,6 +2083,11 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
+	if (ret)
+		return ret;
 
 	rzg2l_mod_clock_init_mstop(priv);
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 55e815be16c8..af0a003d93f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -276,6 +276,9 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @crit_resets: Array with Reset IDs of critical resets that should not be
+ *               asserted without a knowledgeable driver
+ * @num_crit_resets: Number of entries in crit_resets[]
  * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
@@ -302,6 +305,10 @@ struct rzg2l_cpg_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Critical Resets that should not be asserted */
+	const unsigned int *crit_resets;
+	unsigned int num_crit_resets;
+
 	bool has_clk_mon_regs;
 };
 
-- 
2.43.0

