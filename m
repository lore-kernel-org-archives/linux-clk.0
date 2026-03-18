Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7C38B7C8
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823325; cv=none; b=te+GosmeYj3wp0Wmk8tlohDjyX7IKwal9WphU5rItwf4YdlMNvtsf5ULImM1YqLWl79zfQiKNLrRKI+hAmRLK5vaQpbjt1BSU0jJRF3nS3aKRs4SBZs97Z4nxzoLyLJD5iu/flbaquIHlP4Kp3vjCrKuIR70MLosGlnni6nMhBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823325; c=relaxed/simple;
	bh=9UHP8gV6HX8JzqEc/1v9h0KsterRQebADvldIs9vSZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTPehcO+OaIM4Ks+s6fisv6Rjpp8TjssjChuDT8jm9YXZczE1rihrbOVrHwVU5fdJpGG+EVpXjDpYlwQKST6iPx8tAMBcRVFvneW20Cmq3ujimCGTYZvIIRuwXaqd3g1GLb4tzXoTeCUTdvUhO/fqCE1TSfOfxarJxF+jEdDIV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMAtA9W0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMAtA9W0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so455563f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823317; x=1774428117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdtqrEGcEb8BJ5VTpODAM1xEvDMiU/z6ATTkFh9EIzo=;
        b=PMAtA9W0gWAgK40nyN+P8t8aiLivQnyhzB0Tx/r/WhJJv69Apl49ZasABxb4Va6nq9
         5OAE/tZy3u/NhtN2s296ZuqEPrIT913/o6yRNGmDkrjhQBXtYXJYUD+uipIGgHVzGxAV
         eFXsOB6fC13ZrLW0ItdSaUyk5Ekh9LO9MTYo4ZQiD95J8MMzoJy5MRIk/9edYVjgUM/X
         pZpM2rip+/JDxbaLAQKMu3uchC+/05o+Hy/qigIMUl+35ATlxJK4dM3dvSKKRFp8cwWh
         dpVz4HYpHK3xo5ZJUPtVMFwLR18+cLM3S97Wc8c0rqH5zvR98EZoig7gKLBKBcf+IFu4
         /qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823317; x=1774428117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JdtqrEGcEb8BJ5VTpODAM1xEvDMiU/z6ATTkFh9EIzo=;
        b=RoT/b3DfdgGRk/4KGrifr6dcptN3zQ8NvaUxUQtqz9pUt5arHzrQP3NwUnnpZPNhzu
         MtwpSSNXisUOqGMiaMC/LnHbCyR1tfMnFG5GckcTE0RvlgLfHwF6V1fOgkA7HjpHCOpH
         T7egNaqKfcCn/dlwx0iZbp4CfdQLbYK4+dFePdfqf8+x2c7L90/zx4xr6zIPDF+RWR4Z
         TgWVOgEhI7/G/dE/EVz5+ncy+FoJBvUnBMUWT78wLjRGaO7g71ObbiH0TH1BfBAy44Ak
         PmR33Q94oPbdLphPWQh25ce8L2UYLzAOFo+c3Hh/HWR5IlVRoMhdCbKIuckvxqfbHTqe
         fy9w==
X-Forwarded-Encrypted: i=1; AJvYcCUsanfCKuqtZ3P2Tk5ALV8P00Ok/RfKc+dWyu9bNIP7QFM+Gou3zDlr7zx//2aMjFKIKhDBGNJ6fYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwghFl9A2ujxMedbRmgnwY2y5gtv9W7pvBuaAIhsbxtnMgM8zYb
	nDK/tw7PVgBuks6+Q3SNxi7HKsiqEMsyeiNsVH8wTBF1xW9vrUQ21wMy
X-Gm-Gg: ATEYQzxur0KFWR2IvLoDeBDLo8sdpcX9Sb2/u1Kz19WMaFooFagHHKli31Z+ojugBiW
	PePpcZnX0agT+uyT9JHpoj1YObqV6y1XHfZZoJ2n3vgbpJbPSoKZlv98t3sLpQETqAWAc1hdSSR
	0Hwx0m/27Pu2yiW5jifqpcifqSuJKBkbtZnqCCfPSdh0lZcYY67gQ9uw/eXbAXoiyRdl1LrMV9L
	urG0p9nmRTZmXvNfZM7kIsRjlnqCPyv3NSlrgDFOwV5n6ZeL/IwKxAM4s8tbwNoLJQ1+R1j6kqR
	60Ghgf3a5KiseZXClpkex4Cacg/FVUOkimsTq2cT13YDkabQMV5e3WP4wtNlyp3CZLS1kg4nnjt
	GTL4Jos5hvGVDREixSdYdtXk7GF/I1CEr0UhuhpBsCtUas8MjJ6ourgsShv2SFgs5H8AZsU3MUa
	Q1QvDaWPtQKcjzjCc4ghsckKvzLUwYWKlxsZTeG/PC6Jb7SW1X
X-Received: by 2002:a05:6000:144d:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43b4981a37emr12153866f8f.9.1773823317015;
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:56 -0700 (PDT)
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
Subject: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Wed, 18 Mar 2026 08:41:37 +0000
Message-ID: <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change
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

