Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292A346A19
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777419; cv=none; b=GkP5FPe5/v2AgPdS82SFYg3wAq7CNjhhaZvlz/Z5MnVcN5z0hNby1YCwwDUbaFOJDENA8AC3H7z3OruEdQhj09+m3jAuRnt2G0HwGB8r6wg2xT7fhYm2ADx+/HIFmaAgvG1T+5230s8lkhSCBxiumqWDPxXnt5Vvick6I/YfLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777419; c=relaxed/simple;
	bh=iUjasimP5+ky9qKqqpISytS+Xv3jTe4n2zAFs2FsfCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPRgJFlk4ojqumoMAr7vg13G7SMZnPEZ0Frfq09aihClBKHCI4glZFNU/jPO3P0rziikT/XMNGREY2ihFgGPtzY8dCzDPND8VLPRvpxjqVKJjzqezPRHpNt87NV0ZHQ26jSXomEYP/80vH5SXVP2piFaL9ZxpOHKevkDyuDSAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE/WTXvO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE/WTXvO"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b40003d13so17210f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777416; x=1774382216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=VE/WTXvODx4CouvcYCbH8ZSY8bzT0hBU57AaLfm9wVD6BQZhRVSAtaq7OnlVOvfWl4
         mIFIyiQz2F1i+3dUBX7Zt8prkZ6H+sDaaQ7Wi4TMiWL7TmxAUswBmcEYgVbqfdNQXNoD
         XPzT0nEtW6CDuu/HjEtITsmxGlpPeKiS2c043IG2BF1jb958sXFByb98o2u5E2TLuwiV
         lk9FYBlGBDSLmVrYG7HVpHFAVeKf7J6MGL/Xd89x8lV5rpwyVf62j8mYMZd0tVY3WfOl
         5lpdu/UQztcWnSCmVmNsgiPlUlObCWQNGGl5MzlFg/nkQhbQwnLSc9H+EzohXPhMogcP
         zB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777416; x=1774382216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=AXBJCWW1lzdzta7AyKOciUTSKXiMrcDdK0UTuw5r7UPX/ro1FCS1I4o1zLwkJDgTYh
         dTQJFyXT0NxtL2QYuQQNnJiJCiWCsi9gmgulKczTUJJ86T01U/gYVvNKgGNf/DEebrsf
         sJx+zaRqYY9dSjqZ/8hvmigGMkyOvsc2kK1C/2MWB5udWYl/RLMh6CZArePWcHQdtJAT
         Sz1SMzVAW8JGBNcwZHwLjVrHvnjDDpPNu/3/Ydt3pGLiY/rS+CHeZVOoLCeC2jzIUhSP
         PZcxdUttAXXEyiBdzxcSva5zt0cTsif2kuJAHOYjSoyScjJiCIRceAvsWzxlS7TbP1GO
         0Slw==
X-Forwarded-Encrypted: i=1; AJvYcCUgJ1+PRwEEqhzGNEqY5UEvJUtF39b549DhrDxoNITjCbd5MMSMj9oy54qXF4IJ6LypzV8effwenJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4KezD02xc8zsIB/ZoxB3CgXi8AP8QLYsaX8hdyO2ldGg414Z
	fIRlYzzYtnKRa+24srTKNvwzPueeqvLSwa/eRo/FykCcZwIKZ4mG78wK
X-Gm-Gg: ATEYQzwnCVwBL1Dp2qt2BFEcFQkJ20c1bFzuweCiA6oWj3Rn59ZYAR96bGkwfCO5OEB
	G+YIWOkw7LI3pLUH1YD7G0xDnT6GU0m4GyiFRoAV2eVyC8qdNYk7koDu0hmr+9SRpwn4W0OU+jp
	7Fu3dURnO1Hby9GMQAaaEQ03TPGzhqP9k5w44U6EibywY39PJoSFcBOjHGHiVNgPTc/WFyemehh
	27Vl7FstY9Kn1suNMdiCNdzXvrci8WrRfFfBS1M1u8AQmMauWoW2VDcFSAhgA0ife+eQiGVY3uE
	6KtviZE1GfmEldQRbRHaZguEsqXcXEAtTLZ2EyJB1AKSH5QyBjRCIx7sVQ4TsZDnVSYpIKfwBLp
	ZeUlWLaUVau77I72u0YDvpjhvOlAbrs6wkSu6oFkl8nu7AMdVoXJW3Ses7Hz3EIfMMZNGsRLIWC
	ba5abrIShqiV4ZEuqp1e6E4VUyHdQKY1vXOi5Ti/Z/2jniRIql
X-Received: by 2002:a05:6000:24c3:b0:439:df03:f300 with SMTP id ffacd0b85a97d-43b527c8a49mr786234f8f.40.1773777415878;
        Tue, 17 Mar 2026 12:56:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:55 -0700 (PDT)
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
Subject: [PATCH v4 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Tue, 17 Mar 2026 19:56:31 +0000
Message-ID: <20260317195650.468330-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..8165c163143a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1765,6 +1765,15 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (assert) {
+		unsigned int i;
+
+		for (i = 0; i < priv->info->num_crit_resets; i++) {
+			if (id == priv->info->crit_resets[i])
+				return 0;
+		}
+	}
+
 	if (!assert)
 		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
@@ -1802,6 +1811,21 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
+static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
+					  const struct rzg2l_cpg_info *info)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < info->num_crit_resets; i++) {
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
@@ -2051,6 +2075,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, info);
+	if (error)
+		return error;
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
@@ -2058,6 +2086,11 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
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

