Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945251CF73
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679064; cv=none; b=Gx0duKkjY4eMe5Qko+OrZo0/2f5AtgiC2I6wcue9YHMnSbs5mf3JNAnIyLZe2mdX20MUOuJfz6/lzJhIEL3SAh/uu4wNaEjhBX427nZAjdgLZZo3DVjQZii6QCwzmQUfW/k3ripg7Vsr+yR2qSTf91K4Ei9h/YSJXdm1U7c1USE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679064; c=relaxed/simple;
	bh=7HoFWraQLe6a5qbXG/Khd8BdOa2g+dhz8geCFRVA8UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaZL0rXK3VFpAYEtZku9C6GXiTiKJwd+ZpQ5/UW6bVaPhZJqNo8FtoL0CeEkgh6dF6me+wTIUOEMdVtxkLTtvZJfqQifAY8SewAyeEauTC5gAQS3al/zNzPd+ID8Z5FYpEqBvfPbrDIXXm/y+bxbiGmSqacJl1xWvZOmVexTnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeJC8Kqs; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeJC8Kqs"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so3919612f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679041; x=1791283841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5rRbd/AhhlscHaVREYShLlFQFPqfLAqKH8ieUrnby8=;
        b=KeJC8KqsvGGwmdL0lhOeNX3p5Vvl4cniM01y/hXWCrO6wkhHw2OIdnZjzhVZknhnfM
         Dj8gVik+DERGNP5PGWJoLvNKbeE3bnjqVka2K52c/1upXN/a4um8Olgauxj4LUc7/x5z
         Zb0xX+7E4d6aaxTMgZC2fCW4Lp/PkT7ib8/Iex4s98s3oB3IKYFJQZWr9I98wKMAOk6Y
         tZ4LXawDFqlAaZ6j0e+DG09v497qj9f7mF0jdq8rQiDGqORTTe9uABnEtyjpsCcAGkTV
         ZX2NQLua6jTJ7u8S1B4guE45dgq/elxdv/7x0bUoKLrtnW7sSKqs/4sNoQroOvHExS9B
         Prxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679041; x=1791283841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5rRbd/AhhlscHaVREYShLlFQFPqfLAqKH8ieUrnby8=;
        b=dJru+MCimMpRZHymUjqaCdVarxRLfdScW5m5fHZuYdnYVzVhayA35cMjOf8ZlfAPdA
         BNIBlZm5ESFSmc15DVL6UoWUg3uh07HnqBPM1nnskPXB2wRalaFydcFdjFRM1OPar6d+
         CwqDsHfQjlESddHa/BciAvjLB9E/CiXGsAbkuoYcVYyXbBYXutOVQwTABZT8tCoGVZNg
         bnDmLK64WwcYhodCu4/Exld6Wl/eouAEGHO0lh+jMcGQNJH9Pde0ylYv+a3juEPDHKug
         Gej3u57JcmUQtDdCFURbD4FmxVReFRpvNCf3Yhec7XH78WzOXFHmciCutsX6ASUltHMu
         myMA==
X-Forwarded-Encrypted: i=1; AKwUvBy/0kzL/BxtxTtO8XRt2S6mtJ8i+8lDfU/Z/GwXjwXInh2ZpqCleXvEiDS4H1+8kYhHykQJ1rO7HXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRC9v5PojlBr94NEsbdHWTIfo7g/dZzkGug5b4oPZqXM/cky36
	VmDA4dr0CmCULepEMe4wsZL7NsGBRnhRY7f5j4/g2e8zHpzwiTNx53u0
X-Gm-Gg: AYBFou00EGLtekXh4Mjs1ir/wi8eqCZCg0nxdljZ2vp/84Sfk7EhsNiNhoa0odu3sY0
	4wkTIDLp8Wd9/k1VRmV2KBxgBa+P4YTSg/xrxjL2RRcxmBXMH7aYrJ/g5aVkvx+VQfGQnm8odZQ
	oN+qQM8IALeCE+JmkPNvgnLTyLLyDZVHwQQFkOHI/3CJHHfSKq86xt9MfVQzPOFjyw4eZE6Q1aB
	9HIszu7/GmN4wt2C1YBoxpqliZbTsqGUJoc2DiclpMIoWhM4hbuiC+yPxw5oHM3dOKgEG6QpfF8
	4zNyaRmas/jrdSPaLw5Mae4SOWiq4amFZLyd6QqvkiCQmZ9odCDaYwFFg/XPobHs9KB6DNoSZM7
	6Ld6tVhKXEdNh2GffJLzeY6/a43xiig/MplZeOY7dzGhI88LOvTmsdqOGru59sqL++PcjqkL5bc
	24RxATqOxc/Wtu6I/SaI8EzLZfPE93G/NsQq8DR6gnHvvnBjL0uuWsj5FOjNFLGBHGDagij3W0c
	GDJGm/kLZmamDeAxrhjqIh/2KMu7pRRureuRt+dgy+VXUJFcSfDI8cgTOJl5vsXrPtfa77fK2jD
	jjkNoE1bDveUAJmsHUJTv9ZLOOE1
X-Received: by 2002:a05:6000:2c11:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48871879aecmr29681808f8f.47.1790679040440;
        Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 6/8] watchdog: rzv2h_wdt: Add syscon based WDTDCR access
Date: Tue, 29 Sep 2026 11:50:19 +0100
Message-ID: <20260929105021.542730-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/T2H and RZ/N2H, WDTDCR is located in the SYS block rather than the
WDT register space. Allow the WDT driver to access it through the syscon
regmap exposed by the CPG driver. Retain support for the existing second
WDT register region for compatibility with older device trees.

The syscon regmap uses locks and cannot be used from the watchdog restart
handler, which runs in atomic context. Use the CPG helper for this path so
WDTDCR can be accessed without taking a lock, while continuing to use the
syscon regmap for normal start and stop operations.

Keep the WDTDCR start and stop helpers as void and treat the regmap
operations as best effort. Propagating errors from these MMIO-backed
accesses would complicate the control flow and error handling, while
the restart path in particular should make a best effort to restart
the system.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

v5->v6:
- No change

v4->v5:
- Code changes due to regmap_lock introduction.

v3->v4:
- No change

v2->v3:
- Made use of the new "renesas,sysc" phandle-array property to access the
  WDTDCR register via the CPG/MSSR syscon node.
- Updated commit message

v1->v2:
- No change.
---
 drivers/watchdog/rzv2h_wdt.c | 77 +++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 40157e969f58..122e5f36c6cb 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -5,18 +5,23 @@
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/stringify.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
 
+MODULE_IMPORT_NS("RZT2H_CPG");
+
 #define WDTRR			0x00	/* WDT Refresh Register RW, 8  */
 #define WDTCR			0x02	/* WDT Control Register RW, 16 */
 #define WDTSR			0x04	/* WDT Status Register RW, 16 */
@@ -44,6 +49,11 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define RZT2H_WDT_MAX_INSTANCES	6
+
+#define RZT2H_SYS_BLOCK1_BASE	(BIT(16) | 0x5100)
+#define RZT2H_WDTDCR_OFFSET(n)	(RZT2H_SYS_BLOCK1_BASE + (n) * 4)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -64,6 +74,12 @@ struct rzv2h_of_data {
 	bool wdtdcr;
 };
 
+struct rzv2h_sysc_wdtdcr {
+	struct regmap *regmap;
+	unsigned int offset;
+	unsigned int wdt_index;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
 	void __iomem *wdtdcr;
@@ -72,6 +88,7 @@ struct rzv2h_wdt_priv {
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
 	const struct rzv2h_of_data *of_data;
+	struct rzv2h_sysc_wdtdcr sysc;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -90,18 +107,50 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+	u32 reg;
+
+	if (sysc->regmap) {
+		/* Ignore the theoretical regmap error */
+		regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
+		return;
+	}
 
+	reg = readl(priv->wdtdcr + WDTDCR);
 	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
 }
 
 static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+	u32 reg;
+
+	if (sysc->regmap) {
+		/* Ignore the theoretical regmap error */
+		regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
+		return;
+	}
 
+	reg = readl(priv->wdtdcr + WDTDCR);
 	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
 }
 
+/*
+ * Restart runs in atomic context, so the syscon regmap must not be used.
+ * Go through the CPG helper, which writes the register directly.
+ */
+static void rzt2h_wdt_wdtdcr_count_start_atomic(struct rzv2h_wdt_priv *priv)
+{
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	if (sysc->regmap) {
+		rzt2h_cpg_wdtdcr_count_start(sysc->wdt_index);
+		return;
+	}
+
+	rzt2h_wdt_wdtdcr_count_start(priv);
+}
+
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
 {
 	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
@@ -221,7 +270,7 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		rzt2h_wdt_wdtdcr_count_start_atomic(priv);
 
 	rzv2h_wdt_ping(wdev);
 
@@ -242,9 +291,25 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->wdtdcr))
-		return PTR_ERR(priv->wdtdcr);
+	struct device_node *np = dev_of_node(&pdev->dev);
+
+	if (of_property_present(np, "renesas,sysc")) {
+		struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
+								    1, &sysc->wdt_index);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+
+		if (sysc->wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+			return -EINVAL;
+
+		sysc->offset = RZT2H_WDTDCR_OFFSET(sysc->wdt_index);
+	} else {
+		priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(priv->wdtdcr))
+			return PTR_ERR(priv->wdtdcr);
+	}
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-- 
2.55.0

