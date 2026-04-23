Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414334F48A
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957787; cv=none; b=pCyVVFkYRFkutLlrWYUXOzWB9qgMoBxfY3kpCfHHQMff8HneC8lbf4hKVxrdoKgPYDbNHLfyff1AoJwUG3BbIdBt+mXydXRHzV/f5LGl0AZM6PoV/2UzjKhKn0YVmKd2INSD3FQN1j1hd7DJOBaRjCSoS6U1oZVoOGTNT7HIMtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957787; c=relaxed/simple;
	bh=wmSJ4leNLyELML627FEDTONj947cYs+EgV6hiLIWw+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po76gUcdlMTYwdjemxLgL+fZeBcd86pUUqcyAYh6RZI0kMtEPzUB01WafH3jyIBw43b3Wg6GQGOAZz7Ky1Sluvjcpw92MY1B1HlpOVGq341af7yHG4FzqfpilW4qYC3TMo2op1Fj+WVEmMtCtat7owCCt2OyqmZicsrFpHSNGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O3CEo/To; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O3CEo/To"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso44165025e9.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957783; x=1777562583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoK1C2zStDqs2HDGBFigq8hHFdAU01w+3goGRavdu6k=;
        b=O3CEo/ToVAe550MkMX20OXgGItWnsi5C5GBxQu4FHSrTgJJ/Sx+ucUqhqzXyNpU2OT
         /6R8cgSNEoUlFygmJxtsIS0y0+Mg9DcWGP95FlPTG0uYhrVDn5SfMKWCjS86QbU0LAjU
         yPGh8GgmTOpzX1E0ibfLrRF1kg2G8Sgu1/c1yZXHzlic5bmU3MXDEMIu/RkhaGFGxpH1
         MYMOdOnFHUjCkiPo8xb7NUzCDTCWpT/mPLM+tIK0LjFmICFFqhIxiPrFrgvIRsspUlwf
         YbENrgmBOy019ff8jdE13pnCgg3nunMF+td3V5Ce+z6W4rM3bP8qSSnjSj1klMe1X1WK
         dYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957783; x=1777562583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoK1C2zStDqs2HDGBFigq8hHFdAU01w+3goGRavdu6k=;
        b=BEobZqVoiBEojpqvXwL9BFcFUaqojFaf9z9ZUyz+P/Gxux/wXkJ3dFFtRwMlVEu+kZ
         RonaVki8E7uYT7+JF/ATVIr20Nkesa1RBnigiWd5VsXVOmyK3GUdDE3y4uesMF27h7Sk
         aaN77oWDebMSJzeOQxSbSO29jQY3gWBP5txUNTL5z1TECJeDsCdDvmwYXpu6pj/vuj6u
         +XIZfEDqRA7igxNx27FagMlAkPiYjPOc82dH2p+5bhgFoNzxkjUZpNeisYrcIn27d4qs
         RZjgGDT0v55mDvb8AwzS1CfDi6oB94veTmA0G/cCyWmjAiqHPuN8yor00Td5QOWvm/7J
         4WvA==
X-Forwarded-Encrypted: i=1; AFNElJ+Q8ur+AIecmTwl6YlLy6sCbjLHbECIjzFeztJZSjJ+xswBg7Y1FqvlKHKBK6N2VG/v9MGQjoGbijE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmaL+m1KfdVsgDKxJeYJ1NprJ704LCqHNXXiDNrpQh0fzUdPq
	gAvuzHVtSuN7y1epmE1NTRxUoJ8W3zvlSgNsz1IojH9lhnhi769yVxN+suhCNV32G+k=
X-Gm-Gg: AeBDieug1XDcUNALfTdjmmXpMG4a7SCkNLnnsCVT0EspBIhfF5UN5i7UQpCblCaqvD+
	2ljBO0WRyaK4uKGVK4mJmWErUurUdBSvqKfUiEqDLW916A3vn+j82eUxE439izGnEk2Erf+J7UY
	ZJphJ8sPMopnfrxKxo9SgfJusunGgZSLyeNWC/FUQijFvtYJiLo/EbIKw9PjJS92nsIBlSqcOaj
	hIuc7JNcs+Fc23JlBRtsse5llpDsi06feQ/GOqhT9C987Ffax8Q4UL9pOjfAotcBDQeNdZPXMM9
	HIml3MryAu51jH37OLWNCZqtlSDEq2/nml9LHFBm8+wyRzdzHmroOT01dZCI/wUXfaXB+0POGKQ
	H0YGTLzzoN0ey+QoegyrdFROxJCleR72UHCnHepegavLz+fq95GGOsqAHfSHM42e3caUfGA8p+i
	xtahL+pdoMvNH8ik/fKuxgzlBdFrDBgGVHQIfEmuT9JGTPWwBJG3hING8b8fmq//ZM9x/jJSrEq
	49OUws9DGMHu9yfKA==
X-Received: by 2002:a05:600c:6289:b0:488:f941:aab2 with SMTP id 5b1f17b1804b1-488fb78a561mr382038865e9.30.1776957782397;
        Thu, 23 Apr 2026 08:23:02 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:53 +0000
Subject: [PATCH v4 05/11] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-5-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=6122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wmSJ4leNLyELML627FEDTONj947cYs+EgV6hiLIWw+Q=;
 b=BNyvDPIvGqa6/baxNysPZ0qCl8LZAy+enzTQt4VLh7RQ3zyZPXe3Jc6F07To8ReEXWUrzZgfV
 t25sgONY5DyCjkQDnN05QW80Bd/6kpW4iksNcx/rOZfje6/YKiWr21x
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
a pointer to a `const struct acpm_ops`.

Previously, the operations structure was embedded directly within the
handle and populated dynamically at runtime via `acpm_setup_ops()`.
This resulted in mutable function pointers and unnecessary per-instance
memory overhead.

By defining `exynos_acpm_driver_ops` statically as a `const` structure,
the function pointers are now safely housed in the read-only `.rodata`
section. This improves security by preventing function pointer
overwrites, saves memory, and slightly reduces initialization overhead
in `acpm_probe()`.

Consequently, update all consumer drivers (clk, mfd) to access the
operations via the new pointer indirection (`->ops->`). Finally, fix
the previously empty kernel-doc description for the ops member to
reflect its new pointer nature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                     |  8 ++---
 drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
 drivers/mfd/sec-acpm.c                             |  6 ++--
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
 4 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 93667777094c..953ca8d5720a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id);
+	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id, rate);
+	return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a2cd54ee4589..38f40fb67ea7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -621,30 +621,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	return 0;
 }
 
-/**
- * acpm_setup_ops() - setup the operations structures.
- * @acpm:	pointer to the driver data.
- */
-static void acpm_setup_ops(struct acpm_info *acpm)
-{
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
-
-	dvfs_ops->set_rate = acpm_dvfs_set_rate;
-	dvfs_ops->get_rate = acpm_dvfs_get_rate;
-
-	pmic_ops->read_reg = acpm_pmic_read_reg;
-	pmic_ops->bulk_read = acpm_pmic_bulk_read;
-	pmic_ops->write_reg = acpm_pmic_write_reg;
-	pmic_ops->bulk_write = acpm_pmic_bulk_write;
-	pmic_ops->update_reg = acpm_pmic_update_reg;
-}
-
 static void acpm_clk_pdev_unregister(void *data)
 {
 	platform_device_unregister(data);
 }
 
+static const struct acpm_ops exynos_acpm_driver_ops = {
+	.dvfs = {
+		.set_rate = acpm_dvfs_set_rate,
+		.get_rate = acpm_dvfs_get_rate,
+	},
+
+	.pmic = {
+		.read_reg = acpm_pmic_read_reg,
+		.bulk_read = acpm_pmic_bulk_read,
+		.write_reg = acpm_pmic_write_reg,
+		.bulk_write = acpm_pmic_bulk_write,
+		.update_reg = acpm_pmic_update_reg,
+	},
+};
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
@@ -689,7 +685,7 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
 
-	acpm_setup_ops(acpm);
+	acpm->handle.ops = &exynos_acpm_driver_ops;
 
 	platform_set_drvdata(pdev, acpm);
 
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 9e15b260b8df..3397d13d3b7f 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index b206efa62be6..fbf1829b33db 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -42,10 +42,10 @@ struct acpm_ops {
 
 /**
  * struct acpm_handle - Reference to an initialized protocol instance
- * @ops:
+ * @ops:	pointer to the constant ACPM protocol operations.
  */
 struct acpm_handle {
-	struct acpm_ops ops;
+	const struct acpm_ops *ops;
 };
 
 struct device;

-- 
2.54.0.545.g6539524ca2-goog

