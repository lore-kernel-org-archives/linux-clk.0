Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266D43D4E2
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837555; cv=none; b=QeaA61VBrKSpfk4TYDTeEcohvs/7d0tCYLL83WW5vggr+1J7gYlKNf58npR7L7IZrSOZFlzt/JerawO9TFrh+YV2CZz4gUpXACWdYwRBdXHmEE+UH3StTNGiywZglYAY/1fRkDT4WE3okGXMqay4MDOoQNYrCOR+vFsBILgz120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837555; c=relaxed/simple;
	bh=DGMgRKBcQct6SvRrV5090Y3iu6T7EpjfNpyPo6Ptfr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tt4ZYkOYxmMlXqdDVSiOJ0qG77PsGxSS1IPdOVFSRXLhckyRUnaHuV6nCRyatmRbY6s9DDdATkvqseuyv5vbigUVYL1ztH+JveJ87JVO6KAyf/eY4gR8JQurHxln8owYaw3Arxuoxz5SDcLyy/+g/oydR7kovjj/ulBX2oHOND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHQiu3l0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHQiu3l0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a877510541so8814958e87.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837552; x=1779442352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=BHQiu3l006nR+k/zJWZ+44R9f1HlsG7OEF860AUn8HLyC+vv7LpAYem4Q6GxiFpI0o
         1Beu63w3Dn3AX5gw+o+y+E2R5VY6fNNjZwOjqhRU9lmqoFixzsPlMlpKW21V/6IarZVY
         SAPDQh49wNC5Oha5J3wxgyqWFWMYOu7yEgRczuElZlUMKsTb54VV6ukmIB8jGOTJxPnT
         VGvb+Ft5/lXmvkpYbONOjOJiD8gU4VyqmYnwyiqQPeNFN2EANxD6QigV9YAEKovkOLDW
         wujDT4BRkJx/lqpju62Y+cV0DlTg1jPtY8SDeW+1qjUEVwtGhRamuT+35XIQGAfKCfW6
         N41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837552; x=1779442352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=ipoKR2Ii77x9/qDy/6WzCTaoE1MlKuiiDCrija9Wfr0kaN5xyTjXcxoA/ypeZ+qtRE
         U5YRHHbpxezAqgE99Zs972wYt5b3jXUUdSVVZ6SPZJ8SE0/+X/2z4n5khCE8rI7oBBCA
         hCbeKxFE+M0Tk38ZzLk/IrflDs+guyqogPv5xfR6nL11Hg/SA2MdE2rjdpR7Vvi8DuK2
         f3DZ/GQ1vSqoN3B4aVOZ8Z2p60duSN5mUoALLfQfWDV1bagNsH7e+LuQkg19kpr5WbdO
         2dDXR6dvPpOTS/dubY3sQyerKT8UZxUgg1AhYlGG8aKgT6hACdnGlVXmXBkI9rgSCdlF
         gIRA==
X-Forwarded-Encrypted: i=1; AFNElJ9SlayaP/ooBUb/v3hIWEuwk1dVSWENtppD84N4DzV5QAeMsBFFOVv7DhBhck9ZZ6PKUXQvJG6exc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywep+aH555R3XW8eqOW123M7YYgmGi8n35k7o70Zua6oMbfQx0A
	4Q1CtGEFwCygtY7QBizZcOKPygTc5dyY0eTrPgvhyAVd9LGZf1Fv+AHUyuxAzwoNkk8=
X-Gm-Gg: Acq92OHXN/yzuTqvzChqNdPTRYdlXBeUbWGRK6QcUU80o+SRdLcnkdAx5FUTEgGN7M8
	Zgw9dDONZax21kOXw9NgfFcCPKBFHVWVotISZlTpH2myeoOjQYUj8N3x1FhtHB0za0VYf688/Y7
	YqhLoVJgoRLLKYpxoYCkaqAPxKk36rxI8WIp4ELFgPcvNlQbMgrg7Ny1K3LTEidGbPRlOqfRe8K
	wwsjcR7rLQtghZiI0tfOF8+atrEj9YD93TqtUG2fjjvBWg8+aaOQznkzpUlto+6NNxTjDHfWzCa
	Ccjt1N+nwA2Rt/LNZFRPUKPTin4AP5QeixNZ79WZ4sD/xGF/YozqngYvtGqsvUluSbRhopguPR4
	EwBnTsXBmkmHZ5ngFyu6hpmJhpDy5pEvmGcH7eL1gov3VuA7LFGe0cq+yJlZtJpI3r+qlODAGOS
	mlZKoIWwZ/zsTJ2303FKXPe+HiWv6+9dNuEte4w80ReplqlQMR9ebh58lKUMAJmcbmvuKMF/21F
	EoeNU0h
X-Received: by 2002:a05:6512:10c9:b0:5a8:e340:487 with SMTP id 2adb3069b0e04-5aa0e734039mr932408e87.9.1778837552152;
        Fri, 15 May 2026 02:32:32 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:27 +0000
Subject: [PATCH v2 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-3-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=4528;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DGMgRKBcQct6SvRrV5090Y3iu6T7EpjfNpyPo6Ptfr8=;
 b=oUgk+W+9ie/v9Qg1HmqzI4CBnVs8xE1qprJt/Y9TI/1OGNvHDAKpRZ4m5a9zS3aTBM6bilJdC
 hLavEvjfcpMAK00bpledGnzKPgamHkXmPPWSmvG2soRHjTf8hsTpvWH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
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
index fac88c427d2a..da960d3e1145 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
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
2.54.0.563.g4f69b47b94-goog

