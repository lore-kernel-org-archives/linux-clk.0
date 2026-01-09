Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF036655B
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979652; cv=none; b=dwp59THJx0OQpudgaUM0z1HOxEfRHHguHnkwhiAFJMpauTwQrbipfeX3hjpbBV7M1tyKlTqLXYpRsDB31Ru7y80JhCzYe23bxsl2LnANnmqieM4TvbzUIgr/DUqZj7yPBYlAsGH1EdKZPgRsTgQZFSU9F40XVb23s9Jf9csUqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979652; c=relaxed/simple;
	bh=3XB3rMBEqCsmj4gX8Pmw1bT8hVT6cvRuYvHSnPFCz3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+f7h5c4538NlMYKI533pt1bqbkNLvwTn67uJ2KZrb/VaXDADKu8YfOQDmBlETrNzZqU1u5JzxzHCHl5/QtCH5lOu2hSkiVW3Zxhlt6WvL3Rfcadz6AOyXhUnc7P9Q+pY+805CvoGl/Kn3jxoSdwkS0UgaHRQStOn+sBOtIadUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+cVGiwz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+cVGiwz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b8b5410a1so6576701a12.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979648; x=1768584448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=m+cVGiwzVy50HHFWafJpfKkxDqnIPk+pUvXyS2WvfbbXXInByQrC/jlLyrRgLyZCZt
         b82s5RDkS8r82mnQw2RZtNelsxUswh0dtGojFu0FeEpaPCq63eN2nw/ski21gruNTQ4x
         FaXtETwUjiUXZgOnrWBXNFTG1ggOtEjAQq07zs2jOL4IlgvbWAy1/y0rlEzR8AdOa2kT
         tKueycSnmrqo/Wz8dD9n0ZMXVshPAJAuH0W7qZQcjx/H8qmXpPP2iZ/XF7gl5Goh+SeK
         6C7fCUrciAnvVFs4wt1KheQ3p9T1EmjEFdO9aQ8kxdZpjxub9ChMV5J9vanZlvVyC/DD
         Y43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979648; x=1768584448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=AsVU4MuPPyZwK1z+zCIMYWm1TntwvNJ62f1kyvclLVFT3+Q67wYdIORV6Y+KuYtDZs
         ONfBoaj1dHSz25zOsjNe+ZJqMd5obY5qgw0Fv5ft59XcPcdg0DmqYge1sNq9sMsZyn7n
         oo0Xuj1G8823g9iEZGTHntuX5CGJE6UvVVx6u3UJpgrFPdUsfHov9fkU9j6wexyQhuq2
         ZeFYE9MtfHRJKSYH2EnfLDJY00IaYZN7hEn3jN+iHxtOMNBnuUTPHA8X15puRdUPfP6N
         lBbBhLqDxUc9K4BCF1PZ4WKxbvlj246FgvgV/LHTJZfiepVp+qJVhp2SqX+skPdIKzj2
         TTJw==
X-Forwarded-Encrypted: i=1; AJvYcCXSR6z4al+dMe65ZVG1CTatCIvOvUfDwGqQet8v6iDjmUpPNJzXje9UmXwcXIRaDBn0vjhVaWkOdi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5C246UcUaBlpxEsuZoIqGfOGbR74Eui1MsOQ8etABUK1Vxlr
	z6760XCOsgT8eFxpajri0BzIbl4kidiD1zRNrqiVojgtgCeWOroYO6eeK0ypj0NQzXg=
X-Gm-Gg: AY/fxX5OpcHvy3wpdc0095RAqgR+n1+gGdYhYXFAXuei2A04g3JiVKChaLlXyYwEPhb
	F3wBZmwenFEG73DKHFG0Gg8K9VkKmrySQSQLpg4Tj5pZFbxwMYyxR9EkPApVwuVIvHLPthzTl9d
	vCgC9dffm8nHvNOF7DQ+6UpZr3C0lFKmVgdbxGzt18wbN3bMTR4MNJg4fZMTQmc1jrlU82ian7U
	jAePf+7uKWXImYtX0XlgKRKccIDH8vSqz+SzC1revBEhwXyXOzj+nsZJlBg++2xmkIyjO+vklmp
	9rESt9wdVGAfhutxLs58O+2mRRxExgrTnwv4N7SSIYd1gQX+sNzKmISY0087NciX4NafJMShcVh
	9pcA1osNN+F++6cScQaGbBCdBGq3TljQ3gD47/i8dS2AdKA/BwIL+3i/F0DfptuLN73Jqi+OzNl
	Ke3FTxSYepF/hLVLFUWmXCOk9rT/KVwQp6gpa52Qp5TAl2pHjM9KieaWkrGnlkRXO7x1obaP6Z4
	CHSQQ==
X-Google-Smtp-Source: AGHT+IHfU+cxEUkm2kF/kOQsRd2ooDJ4uR4ri7MEIyFQqUrf3Okb1axWOyo618duvh8QSiexZtQrng==
X-Received: by 2002:a05:6402:13cd:b0:64d:1ce9:54b7 with SMTP id 4fb4d7f45d1cf-65097e4cf0amr8994867a12.18.1767979648255;
        Fri, 09 Jan 2026 09:27:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:25 +0000
Subject: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock gating
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

When automatic clock gating is enabled, runtime PM (RPM) isn't entered
even if enabled for a CMU if a sysreg clock exists and is provided by
this CMU (as is generally the case).

The reason is that this driver acquires a CMU's sysreg registers using
syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
clock. Given the sysreg clock is provided by this CMU, this CMU's usage
count is therefore bumped and RPM can not be entered as this CMU never
becomes idle.

Switch to using device_node_to_regmap() which doesn't handle resources
(the clock), leaving the CMU's usage count unaffected.

Note1: sysreg clock handling is completely removed with this commit
because sysreg register access is only required during suspend/resume.
In the runtime suspend case, we would have to enable the clock to read
the registers, but we can not do that as that would cause a resume of
this driver which is not allowed. This is not a problem because we
would only need to handle the clock manually if automatic clock gating
wasn't enabled in the first. This code is only relevant if automatic
clock gating is enabled, though.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk.c | 92 +++++++++++++++++++++++++++++++++++------------
 drivers/clk/samsung/clk.h |  2 ++
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f5262843e67575f6a4e0dda 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -9,11 +9,13 @@
  */
 
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
 #include <linux/syscore_ops.h>
@@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 }
 
+static int samsung_get_sysreg_regmap(struct device_node *np,
+				     struct samsung_clk_provider *ctx)
+{
+	struct device_node *sysreg_np;
+	struct clk *sysreg_clk;
+	struct regmap *regmap;
+	int ret;
+
+	sysreg_np = of_parse_phandle(np, "samsung,sysreg", 0);
+	if (!sysreg_np)
+		return -ENODEV;
+
+	sysreg_clk = of_clk_get(sysreg_np, 0);
+	if (IS_ERR(sysreg_clk)) {
+		ret = PTR_ERR(sysreg_clk);
+		/* clock is optional */
+		if (ret != -ENOENT) {
+			pr_warn("%pOF: Unable to get sysreg clock: %d\n", np,
+				ret);
+			goto put_sysreg_np;
+		}
+		sysreg_clk = NULL;
+	}
+
+	regmap = device_node_to_regmap(sysreg_np);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		pr_warn("%pOF: Unable to get CMU sysreg: %d\n", np, ret);
+		goto put_clk;
+	}
+
+	ctx->sysreg_clk = sysreg_clk;
+	ctx->sysreg = regmap;
+
+	of_node_put(sysreg_np);
+	return 0;
+
+put_clk:
+	clk_put(sysreg_clk);
+put_sysreg_np:
+	of_node_put(sysreg_np);
+	return ret;
+}
+
 /* Each bit enable/disables DRCG of a bus component */
 #define DRCG_EN_MSK	GENMASK(31, 0)
 #define MEMCLK_EN	BIT(0)
@@ -499,32 +545,32 @@ void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				    const struct samsung_cmu_info *cmu,
 				    bool cmu_has_pm)
 {
+	int ret;
+
 	if (!ctx->auto_clock_gate)
 		return;
 
-	ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
-	if (IS_ERR(ctx->sysreg)) {
-		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
-		ctx->sysreg = NULL;
-	} else {
-		/* Enable DRCG for all bus components */
-		regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
-		/* Enable memclk gate (not present on all sysreg) */
-		if (ctx->memclk_offset)
-			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
-					  MEMCLK_EN, 0x0);
-
-		if (!cmu_has_pm)
-			/*
-			 * When a CMU has PM support, clocks are saved/restored
-			 * via its PM handlers, so only register them with the
-			 * syscore suspend / resume paths if PM is not in use.
-			 */
-			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
-							cmu->sysreg_clk_regs,
-							cmu->nr_sysreg_clk_regs,
-							NULL, 0);
-	}
+	ret = samsung_get_sysreg_regmap(np, ctx);
+	if (ret)
+		return;
+
+	/* Enable DRCG for all bus components */
+	regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
+	/* Enable memclk gate (not present on all sysreg) */
+	if (ctx->memclk_offset)
+		regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
+				  MEMCLK_EN, 0x0);
+
+	if (!cmu_has_pm)
+		/*
+		 * When a CMU has PM support, clocks are saved/restored via its
+		 * PM handlers, so only register them with the syscore
+		 * suspend / resume paths if PM is not in use.
+		 */
+		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+						cmu->sysreg_clk_regs,
+						cmu->nr_sysreg_clk_regs,
+						NULL, 0);
 }
 
 /*
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5035cc485771ff5597cf132234a2a..deb426fbb0942f21b63c583f0ad55738239b04e4 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -21,6 +21,7 @@
  * @reg_base: virtual address for the register base
  * @dev: clock provider device needed for runtime PM
  * @sysreg: syscon regmap for clock-provider sysreg controller
+ * @sysreg_clk: clock for sysreg access, if required
  * @lock: maintains exclusion between callbacks for a given clock-provider
  * @auto_clock_gate: enable auto clk mode for all clocks in clock-provider
  * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto clk mode
@@ -33,6 +34,7 @@ struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct clk *sysreg_clk;
 	spinlock_t lock;
 	bool auto_clock_gate;
 	u32 gate_dbg_offset;

-- 
2.52.0.457.g6b5491de43-goog

