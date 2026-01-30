Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19A2F39A9
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783703; cv=none; b=mnP+TFZ9/toG1+pjMCGKkUgr2A4yti2jgh3gqSMWgWeFSXzj5z+Ydb9FSZSYeJHATlywzzWei8oloPIkt9YV+OlxhFu0ATE0KAQ16EVh96OrzBmFJmrOzeO+lWoO8YilvqQICpTnEFz0F9qqaFbGUtdLkKjVG9pfuI10nRVixHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783703; c=relaxed/simple;
	bh=n2Wsd3RQPIbljg+YG+aIbzv8r4oiDMC153jN4cyNWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i3Z1O6ewyShZ6NxbIbbr/cQGz8+VhBDg4XTE6tienUaQQbUyey4eEvcD2wQ5/G91CbN3KNvQ74X99q9SbXZCGRCiKxoOrNrqO2sT6a88QuhiJN7NQuSQCE+ww2u9lDrrW8La9MSIBIcsD9f86FQtR8zkfvS7ZXUv+Asab/b/d3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed8f6iJx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed8f6iJx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so2857296a12.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 06:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769783699; x=1770388499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Byw5W/UArvMTRrdXLkgeguHqFYyTfvL3tSa7AhvDzc=;
        b=ed8f6iJxogNEYoFWWSkzXqg8rgCekiXTGu5OJCz/F+ciidEVMaXvhARD7XywtwTDh2
         WLup4BhBslYqh5jwSB5utI/ZTzBy5jcIdiuOjT26WNSn/W/IRVoz5KFsa1h4k/ebf9B7
         oisKu8PaaOhnn3ptW0Qg08LlJnv1hP81q/tbR+XOn7gjajf8mQKXyRSkAQXdY73F7eB6
         UpVqA+WuB3ooBggDDJmynLCBKb++mqaTV4vZ9WgHSViB48ywMcJoKQemocXqMXquAjrk
         XrkOhWi6OvEBfD9dqsQhJnyg7wp2DWGwEH01LVmjojnH3oQa7YVA7jiu4MbPlKescXHs
         3k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783699; x=1770388499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Byw5W/UArvMTRrdXLkgeguHqFYyTfvL3tSa7AhvDzc=;
        b=l/ly1ZYw7Um+2guFL4wEHSuAtmE4EY1uEm/uR9j5uAV5hWOj03el8nkLzrORPXmYXD
         wspg4a2tmZSLRrsSmPnYl5R+2prCG39hGP0Kr2j/+SD3Q2HandhIOlSsDNuhDTgiXdPS
         kpBPh1hrWyfpshbm6NLpcbkuXn2tSUQAJJgufYIV+Kt1vluBq5A/BhNIK7IfDBsd5kVZ
         thMMPCeh6jzuenP1Min8nlXeHPb7c+J8I8FhTKXiApFjN56oJ+3xZ45+ufW7dzVkNTmJ
         QyfFRd+9Sg8sEatw2y65j34BDrmuvMQyNLiYw23TCoJ1OGt4urUDy1waTH9WE5gSNpcE
         jbQA==
X-Forwarded-Encrypted: i=1; AJvYcCV3afGVdrM+rp4jmwtR25jBx77ZMdMtLALbuYGGcgPm+D0PmT/R6X/Ejx1rh/RkgoMs+lJla1IpR/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZbo45dQXwPjqFMSwiAmyq2oI0HFdugxFzirbo4/CrMSd71ne
	QP6bv7cAmUJD53dJFG5I06EjqYAE5YIQwYKXg9N8sb9+llsmlgi1UDL/
X-Gm-Gg: AZuq6aLlldZlqh9bJBJ/Gs8AOQOHXGIMAgBiCgCj1ZgekVjioJo9CdL/BgeJjYmft8K
	Q+FxuXhaWdan/E3upcGShC76aHTdaKHi0xU+GA98XJU6MWGT+BH3lAXeCHcYnvnHWmyybVxgOrl
	nVPcBfCXwcJzv96YcdBLajXLlKmq+6HsIfCS4fkDZOOqjpbZTrDlOZ8Mg0mGV8Z1OlSlSpDdHsW
	oPXhHe+srZsRXEvqGjE+UH4Yl/dY7U2FjyEu7tFem8/7jJjv/d1xfeNI4RgEKbGwOY+9KE78biO
	W5QGoNbi0Iq6/h4Yc09T9tyF7EnwLz4zN70+bGOgnZkEPVX7UENhckGI5t8bkIqYIUmSFmwgsAB
	7HsmPRY/++gWf4et9az8krMwszFZSD6TVmn9HT5ipzl0/yeDDvf6Jo+xvjWLDNfDcE4hmB1vhQl
	r3f4A7IkEvx2qOqbzE/cWtJkwa3wP/nelkKgc=
X-Received: by 2002:a05:6402:5cd:b0:658:bd60:43e2 with SMTP id 4fb4d7f45d1cf-658de5a0831mr1909516a12.17.1769783699071;
        Fri, 30 Jan 2026 06:34:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a92sm4268188a12.5.2026.01.30.06.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:34:58 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for system boot
Date: Fri, 30 Jan 2026 14:34:49 +0000
Message-ID: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per section 4.6.1.7.1 of the RZ/G3L hardware manual "Precaution when
use the peripheral modules which can initiate DMA Controller", it is
stated that it needs the below register settings even if DMA controller
is not used:
 - Set CPG_CLKON_DMAC_REG register to supply a clock for DMA Controller.
 - Set CPG_RST_DMAC register to release a reset for DMA Controller.

Currently, the serial IRQ is not routed to the CPU if the DMA ACLK is off,
or if DMA resets being in the asserted state result in not getting serial
IRQs for the console. Fix the issue by explicitly deasserting the DMA
resets during probe, and since the DMA clk is a critical clock, it will be
turned on forever. This will allow booting system without DMA driver.

RZ/G2L SoC loses power during s2ram. Explicitly turn on clk/deassert
resets to get the console during wakeup.

The DMA driver is used by both RZ/G2L and RZ/V2H family SoCs. The latter
does not have any issue related to serial IRQ routing. The reset assert
in DMA driver will impact wakeup using serial IRQ on RZ/G2L SoCs. The
cpg_suspend() is suspend-no-irq which suspends later than DMA driver. So,
deassert thereset in cpg_suspend() for making available the serial IRQ
as a wakeup source for s2idle.

With these changes, the RZ/G2L-based systems:
 1) can boot without the DMA driver
 2) get serial IRQ available as wakeup source for s2idle
 3) get serial console prompt during wakeup of s2ram.
 4) has no dependency on bootloaders for turning on DMA clks/releasing
    the resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 35 ++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..16771a0101bd 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -86,6 +86,12 @@
 #define PLL5_HSCLK_MIN		10000000
 #define PLL5_HSCLK_MAX		187500000
 
+/* Critical clk/resets to route serial IRQ to CPU by default */
+#define CPG_CLKON_DMAC_REG	0x52c
+#define CPG_RST_DMAC		0x82c
+#define CPG_CLKON_DMAC_REG_ACLK_ON	((BIT(0) << 16) | BIT(0))
+#define CPG_RST_DMAC_DEASSERTED_ALL	((GENMASK(1, 0) << 16) | GENMASK(1, 0))
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -2051,21 +2057,48 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	/*
+	 * Deassert DMA resets to route the serial IRQ to CPU for serial
+	 * console during boot. DMA clk is critical clk and it will be
+	 * turned on forever.
+	 */
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
 
+static int rzg2l_cpg_suspend(struct device *dev)
+{
+	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+
+	/*
+	 * Deassert DMA resets to route the serial IRQ to CPU for making
+	 * serial IRQ available as wakeup source for s2idle.
+	 */
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+	return 0;
+}
+
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
 
 	rzg2l_mod_clock_init_mstop(priv);
 
+	/*
+	 * Deassert DMA resets and enable clk to route serial IRQ to CPU for
+	 * serial console during wakeup from s2ram as the SoC is in DDR
+	 * retention mode.
+	 */
+	writel(CPG_CLKON_DMAC_REG_ACLK_ON, priv->base + CPG_CLKON_DMAC_REG);
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+
 	return 0;
 }
 
 static const struct dev_pm_ops rzg2l_cpg_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, rzg2l_cpg_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg2l_cpg_suspend, rzg2l_cpg_resume)
 };
 
 static const struct of_device_id rzg2l_cpg_match[] = {
-- 
2.43.0

