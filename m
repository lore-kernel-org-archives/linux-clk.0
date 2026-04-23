Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726B036DA1C
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957787; cv=none; b=G4aVGqFfIyPc34Lrr7jwv8g5NPDTP0LXVYgYwqBOsL42CrNVT2hwluG1yWwrUh9OlH2NirqWn8HfQ+m19PaAZorHTWvPyMlIxxl6LobS7ywnMSE5+YdSFq9ThGBcz60xlmyjUcaaHszPjtgBiseVKlE2/b1CtKHzgHRchbPUDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957787; c=relaxed/simple;
	bh=6Fhzjxw+vi8XP19sFgBxNUlkscVh4nTSp5CfK4gr45o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMraNGdqJyNEYKbHgMHusOu1GTAPthuQ7ihIz8zQpTykGCPO7cPIzkGeMQS3M6maff3GPq1xlQERQ3X23Pc/+1+6cbl5t9pIpp9izuK3qeR+vpGe0XmMx8rBXosj5Fn3ZsKeqdjFicr/DV0XZETeHXkofIsKYZY3PvRpNiRRNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZX7+hid; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZX7+hid"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so48847125e9.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957781; x=1777562581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN4V9UR7DRre5LEE2+ZTpG14TXvnUwqmjv4/QNq2Ugs=;
        b=mZX7+hidc61FA6sH/uyYWJldAoksCQcQsVAhILJPId2UQIio9Ged0bLOmGtAA5UflZ
         AQC+l1Fkvp4MziSQgyZbOX2Fs06xSkOqnziv5hTUiGR2oDD7QCF2H3Ht6NG60mDdwDtt
         H/vE/n98RVt96vVl106DByEk3DNimyuz5WZxVXSrfZ+hQ+wL4yHnZwW5kr+QOy9hvFHB
         40sYhLjK7WGmSXkA9CbK9PlyirO8jAjMUZN49Wk2U1XsLc9Kl8EMs8K3znv8uxrviQUK
         6uLwsd41GoL+fQvOUmS8r5oZ+2eX6KvMIZWOgfiLUnau4OXWjLqSm6kreh5tXBT9fHbl
         PlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957781; x=1777562581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EN4V9UR7DRre5LEE2+ZTpG14TXvnUwqmjv4/QNq2Ugs=;
        b=UwFwFTf5J0qt55XwY9GD0zZzQmMthqN7r1t3nCuA++QdjOrmgE7AQA+98odCH6jZyA
         rLbY4PzKneOW+q8UhkVVA/sn6II5nx6568XU+hC/+Ym39hiv564EiLQfMRnot77iBpXU
         fzyPI0ocXDSl2Rt9e8IW/6ZI9Ao/2emcWyC6uWAkB2MMxnCq7xqJu+L2IHRt20waaTjV
         D0Dg+gyBwemyqtvblA7tcoTTzsRWkb3d4d2pZfGCEb/VoYLj1LI/drmhFvJEOTApNFlL
         VCl3wXvLUHKbR9MkUuuH+h8gL+p5zUqbsMUzYEg/FkGNJii8tlotTwx1dYBITiB5gdVM
         B/kw==
X-Forwarded-Encrypted: i=1; AFNElJ/9hHNPrRPuM21G5k0QSQ5trQR8bZpxaNVXbr1ChBHVr0xJR4BxTyPOS+FC/5k8BNLjPygNyYAvZO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKadVMl/iayJBJKPSsh2NUieAvUkiN/hPCvQmYL0bl1ZLw/lmN
	jWX2jNmLzfoNiVtl9uzwVEXAbD78OzFITNBPWQyBuj0ZSXYLCS3r0LN/5hBvsCpNPuA=
X-Gm-Gg: AeBDievKVhkbJGrhqhIqcPkrjYrwAMONAkjAHrlemHJNJQr0K5ycon7kcp7VCe2dtKB
	UaLPPFGvOxRUZHbqmTPaq0wl0RiTsDh3EOdrD3XyKlEC6WnqIe2SiYrGKudiMME7TVFxofVO0tU
	mbEp5x2jjM+5+Dz7Ods+puBETpqE0X/b8AYBWlihiBIKSs3vWQ4BOK9w/ecbr9MsCtDMPRLu8PV
	A8iOvudi5q2Oq/zoY6O1hLXo14HKQREnPtnQ8syRvihdcuRm8wcMlciDDc4KG8DdEP2Xx2M4tXl
	E/wX4LIC7ju+3bMF3gWTYs/KzWznVfKVFRVOyoA2XPRzi5ZXgnPt/1FhILdjumMZZaHJdRuGPGg
	QDjrpufhS44Ti+erg/in0i+4rTNmjOLt2LbpAUFe1LTyKLZPp43CozEWID7WkMKCh9QqdSWYJ/w
	toIJo4yt92INyI+PIXqtGDMdck/HQRpnKgXsDAk3vOXjFuRRN/0Aqv70XvgxUUSqJnY4OtF3u5J
	wzOBxQ812YNVFXbcw==
X-Received: by 2002:a05:600c:a105:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-488fb7786e4mr293834645e9.19.1776957781446;
        Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:52 +0000
Subject: [PATCH v4 04/11] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-4-8b59f8548634@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=4435;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6Fhzjxw+vi8XP19sFgBxNUlkscVh4nTSp5CfK4gr45o=;
 b=m4fvvg7wwQHeVb0yPnYIqHEWlawnheJct73ayBmrt0vkfwIxMaAcSV6BGF7raasQPHx7k6W2Y
 gg/2Y1LaGpgDZ1YNuIQjhH8k3GmTU4AO/Uu4HrbMnBnxExDYFknXje1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
 drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
 drivers/mfd/sec-acpm.c                                | 6 +++---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..93667777094c 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
-					clk->mbox_chan_id, clk->id);
+	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
-					clk->mbox_chan_id, clk->id, rate);
+	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e5c85d769d0a..a2cd54ee4589 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -627,8 +627,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 0e23b9d9f7ee..9e15b260b8df 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index d4db2796a6fb..b206efa62be6 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -36,8 +36,8 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
-	struct acpm_dvfs_ops dvfs_ops;
-	struct acpm_pmic_ops pmic_ops;
+	struct acpm_dvfs_ops dvfs;
+	struct acpm_pmic_ops pmic;
 };
 
 /**

-- 
2.54.0.545.g6539524ca2-goog

