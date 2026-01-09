Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4B2877FC
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979652; cv=none; b=Y6NhsTnU0O1X1GhzBBOgZC7UPKzunI52YrBhOiex8n5f60ucoeAEaA8/2wczGa1Jh3ysYTRafbdF5NwdQzqyL4aobesGzwaHlk1rNcAyGXq/MU+ivx9g7pGOWjWltD9uz9ovxiUXDltL8tBovqj/dHgGJ+aJ68xlUnkAE4MSQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979652; c=relaxed/simple;
	bh=Gq7DIsn/2JzXC4PuN08mJjpFhzbLLnk+bWpmyG+0b3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnUwM4DVPejbrybx0XKwDA8EDIisoiaHySuMT60bpuSoCNRGqdCt0FFdxXtG/eFP3w+jIa6+uVOVdG3ItSbTchmu1Gy/ltrcdX8temONIseidYv5cwlr7MDmBP1zmbhrckt5sfuC/+Nt4J7AWA9dW7xU7Yk1j0qI9Xb61Tr34m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XL0VXO97; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XL0VXO97"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7645324a12.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979648; x=1768584448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7Hmg5PdIFiKNjesvbLQf4CxxIUooCirMgEw2O+Jp7k=;
        b=XL0VXO9705xHRmz45eFMsGuPd+7R6BDZsbXT4Qj6+GLZvtQRIxeErBz3Xt+vDY6wCB
         R1RpDml/kTM0jsyOw9EfbGinnXUyJ5WB9y16Wp1HX/U1M0stdwFjrTxO/s9dOtpe8odP
         d5LSRD/uqYglYNFlScDJR5/ZOIBuAxsrjdYJH1ZCs66+2+Zd508Uc6OY+TvUknwMWZvt
         +mD7ka+H/3SLPPJDd1wV2uw/5A7oQCcNidK6pVTQ6h1mDmG3Q9nrkd4qLHD+pQXokZ20
         EpMd7wAQ2BNPgolH6o31f2ncUzQzUeyDkTNzuv/XkCa014jm4FoBJbQ9jRgxLJBFlwpb
         lStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979648; x=1768584448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7Hmg5PdIFiKNjesvbLQf4CxxIUooCirMgEw2O+Jp7k=;
        b=aTDErf5dLBZ9qLvBVbCrJqFi89JSq3XI5Y1b1TCZxh0mcKlcQx4l1DU16gXNfECE8l
         HEYUqpxzMTL2L1vSfjSlINBV+fJHiI8m878cr19xIxJH2g9GTnE7SchD2U//sr2iEcz5
         N+E2C94elyRnAWb7F4j+AUz1UCG3dko0+nqZpws8QBMCGG+vsGXOh/RI/5IuRXRrVV3Q
         j4Z0QBg6VlOTX6yJFfJGns+aLeI5Kh5mSbJE/oez0yzEvy8OvZgW9rjMgu20zk0Mvmo3
         BQ5qX7xAWIeTwhbsZq8Ynjteda/h3jK+czKKj8VL68y9e5P8vOjRYMDoNEK5Hw9/RYz7
         PWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSPlZu5T/rABVso8wvFw5MStAZLRFDtgtI7QKZuUCaSneUfHl+S/ivUAE6JO++gmvUyoI78rhzRxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnyX7pLsFxx4huL0SUuefKIJ1H/CXVMsoy43IFrj0U4TIhFjP
	PK6mMy3RSC49sNYmX0fNP1ZVpf4ig541+S0fYLf2tQcZYtjFjB9tVq1O09mMHK/g/Uc=
X-Gm-Gg: AY/fxX77DKhbZ421TQ2Q+GCzdb1RYulYqWp9APN+mgsZHPsj7DCSS+m3ylXvKGIOGVj
	JLmPZ7LX4qBz+1Etnhx8DwBPOuKv+XItPXKivKjj4YiPUax8Qj6LiyyMJ2B5nQizQXUaxGkwAMQ
	ZfNO590ZyiaotdEjdPuu94YO6GMwEyDsf6oONPUwa+2SQwM3mHOKL75duvhJBaCxSLxivVkWGsx
	xsOY0ekSBzLonHdaeY2wc0KvDWDJS2sO5iI9dSkZGGl1Ko7FglwiQUgETNspaC4CzjUxSv1Shpg
	/WFB5WGYzffCa/5/VcJHuOdHZT1Whjy86t0BGCgoExY1yooVEtr+XFIPjR72xbQycDXLka+w8zv
	dHBjtOwv0KelA9VuuZvkRVbMBVKGzeQ8VDng9VOD613U+VPedk4junO7ZsyEsb0hXN5eVzjbrcZ
	UdIXzP77n56svNfhtfit8Mh2iGcDPr76TEPRar50MqwoXlaFVZHMaCxhERdatqU2bzggptRwpz9
	q/1IQ==
X-Google-Smtp-Source: AGHT+IHlzZvKQ1vGaBuCrNMWiF2l/TnTFiSG49QjgLu/wfS2dioTQUU95+p1/w0tLKgtkLx/PQjBDg==
X-Received: by 2002:a05:6402:2554:b0:64b:7f98:c7e with SMTP id 4fb4d7f45d1cf-65097dc6375mr8749976a12.1.1767979647762;
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:24 +0000
Subject: [PATCH 2/3] clk: samsung: fix sysreg save/restore when PM is
 enabled for CMU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
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

Currently, sysreg registers of a CMU that has PM and automatic clock
gating enabled are not saved / restored during runtime PM (RPM) or
s2idle. During normal suspend, they are accessed too late, after the
CMU (and potentially power domain) have been shut down, causing an
SError.

The reason is that these registers are registered to be saved/restored
via a syscore suspend handler which doesn't run during RPM or s2idle.
During normal suspend, this handler runs after the CMU has been shut
down. This registration happens as part of
samsung_clk_extended_sleep_init() via samsung_en_dyn_root_clk_gating().

When PM is enabled for a CMU, registers must be saved/restored via
exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() respectively
instead. These use their own data structures and are unrelated to
anything that samsung_clk_extended_sleep_init() does. Calling it
unconditionally from samsung_en_dyn_root_clk_gating() therefore isn't
useful.

Update the code to prepare sysreg save / restore in a similar way to
how it handles other clock registers in the PM case already.
exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() already handle
sysreg save/restore, just the setup was incorrect.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 32 ++++++++++++++++++++++++++------
 drivers/clk/samsung/clk.c              | 19 +++++++++++++------
 drivers/clk/samsung/clk.h              |  3 ++-
 3 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 11e4d49f2390ba714eff5a329bb1f427cd6437b9..35d4de233cc1b4aa25490ff20d0f0372b8d3d0d6 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -174,7 +174,7 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 		const struct samsung_cmu_info *cmu)
 {
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
-	int i;
+	int i, ret;
 
 	data->clk_save = samsung_clk_alloc_reg_dump(cmu->clk_regs,
 						    cmu->nr_clk_regs);
@@ -182,8 +182,22 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 		return -ENOMEM;
 
 	data->nr_clk_save = cmu->nr_clk_regs;
+
+	if (cmu->nr_sysreg_clk_regs) {
+		data->clk_sysreg_save =
+			samsung_clk_alloc_reg_dump(cmu->sysreg_clk_regs,
+						   cmu->nr_sysreg_clk_regs);
+		if (!data->clk_sysreg_save) {
+			ret = -ENOMEM;
+			goto free_clk_save;
+		}
+
+		data->nr_clk_sysreg = cmu->nr_sysreg_clk_regs;
+	}
+
 	data->clk_suspend = cmu->suspend_regs;
 	data->nr_clk_suspend = cmu->nr_suspend_regs;
+
 	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
 	if (!data->nr_pclks)
 		return 0;
@@ -191,23 +205,29 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 	data->pclks = devm_kcalloc(dev, sizeof(struct clk *), data->nr_pclks,
 				   GFP_KERNEL);
 	if (!data->pclks) {
-		kfree(data->clk_save);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_sysreg_save;
 	}
 
 	for (i = 0; i < data->nr_pclks; i++) {
 		struct clk *clk = of_clk_get(dev->of_node, i);
 
 		if (IS_ERR(clk)) {
-			kfree(data->clk_save);
 			while (--i >= 0)
 				clk_put(data->pclks[i]);
-			return PTR_ERR(clk);
+			ret = PTR_ERR(clk);
+			goto free_sysreg_save;
 		}
 		data->pclks[i] = clk;
 	}
 
 	return 0;
+
+free_sysreg_save:
+	kfree(data->clk_sysreg_save);
+free_clk_save:
+	kfree(data->clk_save);
+	return ret;
 }
 
 /**
@@ -305,7 +325,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 	samsung_cmu_register_clocks(data->ctx, cmu, np);
 	samsung_clk_of_add_provider(dev->of_node, data->ctx);
 	/* sysreg DT nodes reference a clock in this CMU */
-	samsung_en_dyn_root_clk_gating(np, data->ctx, cmu);
+	samsung_en_dyn_root_clk_gating(np, data->ctx, cmu, true);
 	pm_runtime_put_sync(dev);
 
 	return 0;
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 417ec1786b5e77e17dda4022b417c1c6b79c59ab..9f68f079fd552f8dfb6898dbfb47dec0e84c626c 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -496,7 +496,8 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 /* Enable Dynamic Root Clock Gating (DRCG) of bus components */
 void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				    struct samsung_clk_provider *ctx,
-				    const struct samsung_cmu_info *cmu)
+				    const struct samsung_cmu_info *cmu,
+				    bool cmu_has_pm)
 {
 	if (!ctx->auto_clock_gate)
 		return;
@@ -513,10 +514,16 @@ void samsung_en_dyn_root_clk_gating(struct device_node *np,
 			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
 					  MEMCLK_EN, 0x0);
 
-		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
-						cmu->sysreg_clk_regs,
-						cmu->nr_sysreg_clk_regs,
-						NULL, 0);
+		if (!cmu_has_pm)
+			/*
+			 * When a CMU has PM support, clocks are saved/restored
+			 * via its PM handlers, so only register them with the
+			 * syscore suspend / resume paths if PM is not in use.
+			 */
+			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+							cmu->sysreg_clk_regs,
+							cmu->nr_sysreg_clk_regs,
+							NULL, 0);
 	}
 }
 
@@ -548,7 +555,7 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	samsung_clk_of_add_provider(np, ctx);
 
 	/* sysreg DT nodes reference a clock in this CMU */
-	samsung_en_dyn_root_clk_gating(np, ctx, cmu);
+	samsung_en_dyn_root_clk_gating(np, ctx, cmu, false);
 
 	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a56aa3be54d817cd24bf2bc29427e783a1a9a859..b1192ca03db5035cc485771ff5597cf132234a2a 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -476,7 +476,8 @@ struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 
 void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				struct samsung_clk_provider *ctx,
-				const struct samsung_cmu_info *cmu);
+				const struct samsung_cmu_info *cmu,
+				bool cmu_has_pm);
 
 struct clk_hw *samsung_register_auto_gate(struct device *dev,
 		struct device_node *np, const char *name,

-- 
2.52.0.457.g6b5491de43-goog

