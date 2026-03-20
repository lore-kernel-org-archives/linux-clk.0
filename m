Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F839282B
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003799; cv=none; b=Mo5ZQsWR5ht2QkaQYB3CzldSTrYw5dePwlYxOhD4b1+ZYxoZhAkok+WldZQ29vY04Zf0Mcq8USavq1KWOG+2TqgOkctx7s4HM7uiDZMclteUdYyhTVKSo6uRLnIH7x1EzeG8VI6rGaN/WrB9r5y9PrOH8n+K91PGel4rSCEkcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003799; c=relaxed/simple;
	bh=IiVbDpGGDD4RSyLv3c7fTfBYylUyvZwXxZ1DAs2PfOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8N+vdmPKQjOTcpMbDmpHAtiWAe/XW6DA1A9jUTJOKMJSujxrupVhBaDY0RcTcCOSwPAH+XJ9qjEyYA+txejK8TbLE4kMCQ9pwDWFblN40Spc/Oj4PVdcs6uUdqOhw6h1paHUMgsR21t8+UKM2xdLQ0+XcGc+Tmgt9Gis6F0Cj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVzgizIS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVzgizIS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso1643223f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003793; x=1774608593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEEA7I0ZvUlQhKijbyn5xZAb8FKf9j9NUypo5/H5hDY=;
        b=QVzgizISLt3b/hNHIH72ZgDmhIm5urwQqzXpvp9qub/Ysqy6n1CNtI+0qaUy4vdQji
         KfPU1717/+VlbBGRxjMn6KyXk5KduP1mTE0EghFlRUUUxEzaosh+Ti+Gtye13hSAq1JR
         IxDmYU6m/rTbSH4AjWwR5HXD9d8/aljAADCLHVXnD/CuFKoYvMpozZqB+HavwQmbB2PR
         Nn6jbRNxpQ2JE8DodPdStdtIqDeXtcQhwD9k7YRMtw2MP6U6TeG++yZEQGjaQ5zuC3Yx
         q2TpEl6uGj6kTT+DD1BdamqerWkdD17nTAODTkyo9Ed4Z9gskyIHXPuRbcJTl4Yex/fO
         Bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003793; x=1774608593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEEA7I0ZvUlQhKijbyn5xZAb8FKf9j9NUypo5/H5hDY=;
        b=SUn7YIGffVjxEmDplKgo9j+MJPVqhPGIjZfE7hIDYGCQYmdvqKHJBO/yWWmRqHze3Q
         ABjUCFVUiWgE84QaA692wrd5qClXfDuJPpwdLvly9yKH7SmhbMinh6xYeiHcotoOfurC
         vKZaP3E/swaEFONZfmycEsgaNx1HJRSzD2dSvzq8tCyq43r18tuUfo+s8QJiLFBGN3Ao
         BkxAHWAK/LfH7PjcuoTXHTPF6sxQbSqL5xgkF5HTldE10H6LqH7OTK64J180OE9KKdZn
         s0PXyHs19bGHQMEvtOs4dnSOiTuWjXWvcfr6QExGWm1zi4HoMq1NtMrPxwKqjU5Fos8e
         8alA==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ1oIF2DKwli1hHekByf9lyI6vqPMMvaQjKAadgL1PYKEB0lsWABiZb70Hqf7RB89faD91q9rWX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOd5AkxNnbyKbBvGYgHDDKbGeEF2BC2aO0rKbVIVCY3vBIPP5P
	Nx3gj6bwg4F8Xx04CkXYWz5QJc9z4YAfEbB5KHFVljJ+Aasz+S19Q/lz
X-Gm-Gg: ATEYQzzDHk3SKwGPY3WUMU6fwliXyO5pN/ChYZUUjKgT8i0aynrRf9XVDJoep93Nyt+
	edyiy8IupteTZxWYO9XZniJ96EN8bYeZTfW7VYj6vB3zjfZL4dMCtqScPEUCpfw5QSVC8ch4VC3
	fc1Hrp18W8rSymt9j5efT/3YZIY96h+1u8Tm/B4YNbgInN2idCbXVdqqX85H4rriuTNkfPbiNbs
	m6+kEh3wUGBG6nWKPh37vgGVkrZMVs0rvZRGq9t6287llzY4QkWA9Urhvruhv4IUDzqVX3HEaWx
	2nPQs7124Y1uMCe5yzO2s4l+TGD+shnH9QZLhhzGkEiJJOJxpo55vwfEyLZLxJ834EkRRwHQT69
	KeNI6NLNJoHvaSa5351GSoU4QWRTGW7ps0JpAE8XOjLt95zq2QK2DyufOlFfGPJ1MjIf+WAmuvT
	Dn5eJ5uJoW5tB96F93kGgoS65IHE8/zmpsXlZYMM79Dw==
X-Received: by 2002:a05:6000:2f84:b0:439:bd70:6114 with SMTP id ffacd0b85a97d-43b6426d1b1mr4311679f8f.38.1774003793392;
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.52
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
Subject: [PATCH v7 02/10] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Fri, 20 Mar 2026 10:49:36 +0000
Message-ID: <20260320104950.42220-3-biju.das.jz@bp.renesas.com>
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

