Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFE30EF92
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804556; cv=none; b=bp8wdUqkNUOjayy28KEc9mF7RMnaMIkMHBeqXFfcPR1IBr6a53sGeyO9Kg+5JuGx7OgRNFTgG28pVA3hId63pcNpLOuPyY1E/a+U1MX8B55fBIX+e7na2uQzAIR/Wr8fQyPxUlNPi9gNmj7n/zXjqtPJa8z6dbWiaI9YTXHv1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804556; c=relaxed/simple;
	bh=oDDmA+qtseMoqwvqvrsoGzJksVvbHRORAHe+YeEPpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDrXav0HCeKHRTkgOA2+2yc14H23r0zxixF4I1OC3NJ2kvd0mpGsrPijL4y7oZ7tAj7EisPCe4omCdapvBKjZ5d4krLjbyeQbs3lfHgeL//CLhvl47plgocVwanK5XPtMLef4BvlDR1NG+zoou1b1EnEZic3ivFSYn3lBO16E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRp7ZHT+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRp7ZHT+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso538465e9.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804553; x=1773409353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7HfjRvaTulj2GfsP2nDOzeVXSEKKzPOa36MxET5CCs=;
        b=YRp7ZHT+ekkk+WHpMEKikB2NB8guV38oViVAjZ4xZd9kSCUPMgRxi1APcgzDcf2YbU
         m45NUs0A9FH/oJ6OOw8n+AwGTPYEWCiuqfwHJZdHrYkVH4E73hZT2BGvwM3f8FaNCqlA
         WMgpTVz7BwtWheaeIPE09+MGg3F1Jy4ncihqVQFCea0zNc7IuyCv/u769DauWG1eEVyx
         omRSeq9JPfzDvkuuWDyIST2P2hdjRcOzBB3TK6/272Ost5cJ6O9mpYxwk1mcWWoD5f4Q
         c5iGgiI2OC4DoA+mT6Urta/F/+PjvNmgKv5BnK/fsh+cqPAcefpwlSaQDrqJUmyPUjcV
         191Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804553; x=1773409353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7HfjRvaTulj2GfsP2nDOzeVXSEKKzPOa36MxET5CCs=;
        b=hWIQGaGXl+RjU3eW3mO7IelvQvQa5MJHCEUU10Wmo0/gUbzoeK8F9p44qgWgbbVw6l
         FB0K92ex04VGMbn+N3ymzFvRHk0a6sR78YQC7SMUoFsUh8qvOXdXmWvO89xwnI8PZMXd
         x+xzZPDcu3IO1a9PQqCsZ3BatIMUzkpl+3fMYlYarmbhhMZ25ZLh+dyEAwLAWWbHJ6ip
         G0ynlaH9Zk+Cxw8txBmAaAQvDB7CEC/zXO9n3wBmxxE2+2G7qWOgK3ip867bOo7jIlfv
         vVmzXi+oymliEqQ25ghB5KCptqtmhT2bECUYJtCcwYGFycXP36N4QuJ9CJhhi2IUk/Xn
         DMDA==
X-Forwarded-Encrypted: i=1; AJvYcCWrxU20TDLrfCFsLNSLdfSlhIgd00V1lCD9WBmUmnq2wwF9p8ZDzjjBo6n2x9tSD8xqAlbrEzt1yDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUk8y1Yeq+HsOcgFJvL7n9o0EzaHL7jYep9hTZ2KHxpAQA8HS
	Y0/KO3Z2HsJb9bcQHS3jjngaB7IPJVEotUs6YdapWAhZVspybAo5bGHo
X-Gm-Gg: ATEYQzzxAvgBy1h4EX+iGWWbDPtrdMlakBcwZZAYTy4LJuU+qwN9J/KwrDMpm/8do/D
	MSCYzlMl35zpzt4XIeB1IQK2SSizTbGRDwHjjGPAW35SqDQ0TkESD9GjiRcYGMxphzYN5Ocu5XJ
	PquFXfQTLN3Y4ar6WgDXo/z3aNsld+sxkRX/vdvEv07dkihROydbXkBHMM+hig6BXyX86fMpsO/
	ELSzGjYCs5FEy4LPnDvzSmrEm5sInEdRsqNQadFZ3wCJWYVuqW0fVrQpKIT8WKYhARH+h0tt2rX
	/C5zXWrU/prrpuZmeFbET0HdqBX0K3nwlX0pRMcO4EJZRiooUytxq+Wz5BQw4s4EQEt8TBnMHf+
	TuiRLZFxOgTKjvLqkH+b0xjcR1Rfw3ZuEj3aYh8sbd1djXSSxIxkOYJHbN4pL15GvAJGXDo9VWn
	I+OdX0r2XA30dUgyt7uX/2nkcFE5D3Q1DJAXQ7G5KnPOsY0WU=
X-Received: by 2002:a05:600c:19cb:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-485269791a9mr31478995e9.33.1772804552665;
        Fri, 06 Mar 2026 05:42:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:31 -0800 (PST)
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
Subject: [PATCH 1/3] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Fri,  6 Mar 2026 13:42:23 +0000
Message-ID: <20260306134228.871815-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no
owning driver to restore them. This mirrors the existing crit_mod_clks
mechanism which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, DMA reset to be deasseted for routing some
peripheral interrupts to CPU.

Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
allow SoC-specific data tables to declare reset IDs that must never be
asserted.

Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
resets and deassert them. Call it both at probe time and during resume to
ensure critical peripherals are held out of reset after power-on and
suspend/resume cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

