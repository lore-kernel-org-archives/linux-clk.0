Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D263446B7
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776692; cv=none; b=fNkQGCuAfEhOgEkjqLV5VoC9aMc3vU2MedYaBzkpGQdeIuV9fffeA0rivci0AW+H7gDQ+FsVhtkY3lQWbvjZ9HhrD7/a/m87wxYZ0QrRs6L+FfZN15Fy2QcM8aKXvgaR5B91P2peJlSNS26W2ANL2rjd604lc1B9X6pqhSncJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776692; c=relaxed/simple;
	bh=iUjasimP5+ky9qKqqpISytS+Xv3jTe4n2zAFs2FsfCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8fbzix28PAutM2WFDHAjcGSkjv8cEz9AbIU44Pvl7fsK2/GwiMjCgIiFkBl5+i/Ht1ulEmiUAGg7RmYuI/r5Y9GQKP17JPKbxlBcpWaSflpUKvC8GbWBaA4ExxUX49FTG3wRvNmbnhES3K7wwv9j+RP1DOIIPsJ/5z4VMyF6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSL4k57X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSL4k57X"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4557049f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776689; x=1774381489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=hSL4k57X30xYn5Bx8cEntlolE4PY72JXdZm3sAyMmn1XK8YG0BzHPTjoyJvrmS6ght
         dHN0bn4uth9T9CYpTq8DabOSE0BLUmVwvhpaosTOg0bhSeNcajyxp6g2dlvxkTVKXio3
         DFDApIUX1NfaqvhC7dd7yd6y/tt7/Zcd0RGSxfQ8o4ZN7T3QoYbHdKt8nqZ7igr56ond
         zGeZas8DGHXcyzt+WJ/ogEVa11uwoHlF57DSaVBKu6qVt46hNhx+QrHf62mkTEt7Hn2C
         4d+0xBj3hRuhzNY7NYnywR1Md4l+KRd+V62DsLHSCOoMNqjBAEDzWjsCstL3oV2gh4G1
         7sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776689; x=1774381489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=Rmn+Ad0CGIl0lzBKayXcLCSuPnSN2dX9MjX1qYGW59NR1sWsqy5+xu02dVlfZOxdfT
         hEM8jXadYdWTIMX4a+KpWJiBTUTVV72nJ7FSOQDV+VJwGqfXv/e9esxIDrxGm91Y0aty
         pdaYELvqIyz8knoWNk6EHZgjLtzdY8Nmtc9lD+fsJGz1KqcXPgVSEu+8shUPSgmzNGGO
         M961NmUAh8lnKtTdQ2tPZIBnd103GAvFYnvjqcr65DUMi1PUvHDBegEg9MB9aTlt+HZo
         Aqa2+ZvNZLDnXyxWRsQb1gyS7yHbolIjLA6NCdcaaONkaO7gOyst4GHknvRDVCnoij8u
         NBoA==
X-Forwarded-Encrypted: i=1; AJvYcCVtgJbZ3WOXgXb6ve6UHkv3Qzq8V6dzhXCTt5oIBHxLXhzp/4x1m/R5LUpOEudk94Ft1tlKREkHI0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6YEefRcYjIyzRygjRVwTI8duB8RauJMJfZgvasYuc0UDJeQG
	KXDGPP9c1IQ+J1LNtOLyg6L1e1nZ126jloMvns/bX2jdW6y1bervmv2a
X-Gm-Gg: ATEYQzzkJtpslQdihfnenEAgSX6Mb6QWUj4RfOCED8f0r+PKOru40UJqdOXGA3L/LSL
	sEJVaQdCkPqZEixNUQFkL7WVV72J9jzzEMlS1/zjKai6JEkV66cvTQPHcS1TQJJK4AE10JjZ2Lg
	ZA2U1UH0wzzACygzOT4jrktjq+esHnUs/TNfkOLSP5NY2J4DaW3LfpxBhG9Y+8VJU4GI4hS+ght
	1J08mdnFN4Z6cZj+1o2UMtdmC3ii5woUpWPWG2dekVrjGOiF4X+zf+FQgLGq3E0Dt+YMgc7iNO+
	gUOqYdO3EdPojXT2Q4bYRjJ3+XAh/qK5Xg99s3c9YFF8OkVSvG8fV+eprf5EaG2vttQpc1wk9po
	fTl18AoJDuBAMZ+xHSTytMzeTGNoMKgYRm6CrYdNUn4+pZXWrQpyYqpcw0r3Vig18xyPSRdUxQ+
	E/whUoL7zJJmiM0J1lcrig3mZaqtE9davIxkUxMlG8gs2IxFDf
X-Received: by 2002:a5d:5d0b:0:b0:439:df60:f87a with SMTP id ffacd0b85a97d-43b527c7b4amr846878f8f.46.1773776688697;
        Tue, 17 Mar 2026 12:44:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:47 -0700 (PDT)
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
Date: Tue, 17 Mar 2026 19:44:29 +0000
Message-ID: <20260317194442.468147-3-biju.das.jz@bp.renesas.com>
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

