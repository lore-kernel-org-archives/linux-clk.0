Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C694EB3C
	for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806063; cv=none; b=iIoODk9bHdybgH+ONMlVBJgDKcrw5HFewFZP9vB6YOpusV2yqUtagqKrHcIzJyqsz7xjx4xVrSyOR7CPavaif4vhoc7GdYi+4cwpUVkPXXchfhQj9F118Npxi3LgKYcStbfucLMf8l2GHYxZ/R+zSQEZOBjJx92M0YkdXl0J2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806063; c=relaxed/simple;
	bh=I96YKQZ0t11s5RcnJ7tAugdVcbAQ7md0ZCeNUli1r4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G6IpSxB8xdRvwucymil7iRzF20n6Z+cCT4f8YJwVHjY8P/AgoJtTeJSyxzWrU/1rdEeSlytb0wsUW8wAX4cmfOHQL8ptAkqTeA1QbhEURLs1C1beZJifuA06ctJWrqcNoayw+jHzTf2envRJNsQSeeeY3Y6UHq+43/52zpKs/Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iSblJGud; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSblJGud"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ddca59e336so1161216a34.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 12:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806060; x=1709410860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN1Kh7lkVcTMYZwGXce81ohJ7U1I8Dudo/Chcw5aFyA=;
        b=iSblJGudqQLz+pr9Jid/1rLz5TCF3rlDVG0KlB3eHF0aQ1iIsWibR+HhTaWNI+sqZZ
         GTe2OjSWkwU8Rg9qgVyfwGvKTGSlr7Uv70JrtkoxFxATGnIb9iJqMeXRcxm/pNMoq6r0
         L2DVGRkgshoWP1lWpLgCwOxzVT2VjaE+ybrRvgObHWuvqDl+3f9y5YGtPnxCxmB2AfhP
         qeqvvXQqAXYHzyZq4wLE8ZwqQAAoRJxFSgEnsNp4mMEWzm3rkVwjbV9wv08mpgFND6Vf
         tHXpen4fmD4iJtz9eYuBogJlmj2dtc2kW4j6mb7td/+wCPxxcEFsuepcjy38IS76xbKV
         HXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806060; x=1709410860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN1Kh7lkVcTMYZwGXce81ohJ7U1I8Dudo/Chcw5aFyA=;
        b=XSB6PHlxhp7yXP+fbkBhQelXAdalFz+iLORIpKiOpt5JZSXWaKIoVNpexuyA2R6lmr
         qthjvVvTFFVIu25Z/cUjZZuECpoIwRAU1tBmER9mqcVf50wzsBi4b7CuRS/yNBuv5CQT
         CBDJzZnJ4jcCBDRT6jerQX1BMrBrcNIhUDS8V3AfltnB2lYgKvvj67jnwn7UrbDKUvf3
         4Lm2npmdSJCqtMaBVm5VBNtpoV/GgOadPvrYLike3DID21+F5LA9mW3GzMQp6GQ9b8yw
         QHDO1GeBKdtpfPNWBA3MgkNLDACTTTN6UQNYGRxYpSivc0HOmgfP7bUpWwdiHkDQzgi8
         q/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPXfeYrWJcmwiSp6+Ht10t28ZSzkQWYOIQPOEBNMzNh3qlh2ImfEqYREYvZdQYEoH8s7w9Jytk9KmOI3ujpnKqVACtDB5CKbJp
X-Gm-Message-State: AOJu0YzbGK8WSott2rN3l5vM5Zu7buW1oAH40OAi6ftBN1mTQQatWGjx
	S+xTf8pSp/PAu9/qGYogEpJWu1+8CY7as+gLm4ujecRuAZPLtZ9v9yoQCrXX/yg=
X-Google-Smtp-Source: AGHT+IEz2nKgRQ9jmPgb6eGrJTYZq8wl+MRzc4F4C82P4mDY8vrW/3HpQ7g4fCKZ2KsTzDll2O7eFw==
X-Received: by 2002:a05:6830:15:b0:6e2:dc35:fd1b with SMTP id c21-20020a056830001500b006e2dc35fd1bmr1386212otp.11.1708806060372;
        Sat, 24 Feb 2024 12:21:00 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830149800b006e48e98c0d0sm384424otq.35.2024.02.24.12.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:21:00 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/15] clk: samsung: Pass register layout type explicitly to CLK_CPU()
Date: Sat, 24 Feb 2024 14:20:46 -0600
Message-Id: <20240224202053.25313-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224202053.25313-1-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a dedicated enum field to explicitly specify which register layout
should be used for the CPU clock, instead of passing it as a bit flag.
This way it would be possible to keep the chip-specific data in some
array, where each chip structure could be accessed by its corresponding
layout index. It prepares clk-cpu.c for adding new chips support, which
might have different data for different CPU clusters.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - none

Changes in v2:
  - Improved the commit message: explained why enum is needed for
    specifying the layout (vs bit flag)
  - Included clk-cpu.h in clk.h as it uses enum exynos_cpuclk_layout
    from clk-cpu.h (it's needed because preceding patch adding headers
    was dropped)

 drivers/clk/samsung/clk-cpu.c        |  2 +-
 drivers/clk/samsung/clk-cpu.h        | 12 ++++++++++--
 drivers/clk/samsung/clk-exynos3250.c |  2 +-
 drivers/clk/samsung/clk-exynos4.c    |  6 +++---
 drivers/clk/samsung/clk-exynos5250.c |  3 ++-
 drivers/clk/samsung/clk-exynos5420.c |  8 ++++----
 drivers/clk/samsung/clk-exynos5433.c |  8 ++++----
 drivers/clk/samsung/clk.h            |  5 ++++-
 8 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 82d54b0c9040..635ab8cc54a2 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -465,7 +465,7 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	cpuclk->lock = &ctx->lock;
 	cpuclk->flags = clk_data->flags;
 	cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
-	if (clk_data->flags & CLK_CPU_HAS_E5433_REGS_LAYOUT) {
+	if (clk_data->reg_layout == CPUCLK_LAYOUT_E5433) {
 		cpuclk->pre_rate_cb = exynos5433_cpuclk_pre_rate_change;
 		cpuclk->post_rate_cb = exynos5433_cpuclk_post_rate_change;
 	} else {
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index ee57f3638fed..4382ab005ad3 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -12,8 +12,16 @@
 #define CLK_CPU_HAS_DIV1		BIT(0)
 /* When ALT parent is active, debug clocks need safe divider values */
 #define CLK_CPU_NEEDS_DEBUG_ALT_DIV	BIT(1)
-/* The CPU clock registers have Exynos5433-compatible layout */
-#define CLK_CPU_HAS_E5433_REGS_LAYOUT	BIT(2)
+
+/**
+ * enum exynos_cpuclk_layout - CPU clock registers layout compatibility
+ * @CPUCLK_LAYOUT_E4210: Exynos4210 compatible layout
+ * @CPUCLK_LAYOUT_E5433: Exynos5433 compatible layout
+ */
+enum exynos_cpuclk_layout {
+	CPUCLK_LAYOUT_E4210,
+	CPUCLK_LAYOUT_E5433,
+};
 
 /**
  * struct exynos_cpuclk_cfg_data - config data to setup cpu clocks
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index bf149fae04c3..cd4fec323a42 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -775,7 +775,7 @@ static const struct exynos_cpuclk_cfg_data e3250_armclk_d[] __initconst = {
 
 static const struct samsung_cpu_clock exynos3250_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
-		CLK_CPU_HAS_DIV1, 0x14000, e3250_armclk_d),
+		CLK_CPU_HAS_DIV1, 0x14000, CPUCLK_LAYOUT_E4210, e3250_armclk_d),
 };
 
 static void __init exynos3_core_down_clock(void __iomem *reg_base)
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index d5b1e9f49d8b..a026ccca7315 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1253,19 +1253,19 @@ static const struct exynos_cpuclk_cfg_data e4412_armclk_d[] __initconst = {
 static const struct samsung_cpu_clock exynos4210_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_SCLK_MPLL,
 		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
-		e4210_armclk_d),
+		CPUCLK_LAYOUT_E4210, e4210_armclk_d),
 };
 
 static const struct samsung_cpu_clock exynos4212_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
 		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
-		e4212_armclk_d),
+		CPUCLK_LAYOUT_E4210, e4212_armclk_d),
 };
 
 static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
 		CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14000,
-		e4412_armclk_d),
+		CPUCLK_LAYOUT_E4210, e4412_armclk_d),
 };
 
 /* register exynos4 clocks */
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 58df80de52ef..e02e7c013f3d 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -777,7 +777,8 @@ static const struct exynos_cpuclk_cfg_data exynos5250_armclk_d[] __initconst = {
 
 static const struct samsung_cpu_clock exynos5250_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL,
-		CLK_CPU_HAS_DIV1, 0x0, exynos5250_armclk_d),
+		CLK_CPU_HAS_DIV1, 0x0, CPUCLK_LAYOUT_E4210,
+		exynos5250_armclk_d),
 };
 
 static const struct of_device_id ext_clk_match[] __initconst = {
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index bd7b304d2c00..c630135c686b 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1556,16 +1556,16 @@ static const struct exynos_cpuclk_cfg_data exynos5420_kfcclk_d[] __initconst = {
 
 static const struct samsung_cpu_clock exynos5420_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0,
-		0x0, exynos5420_eglclk_d),
+		0x0, CPUCLK_LAYOUT_E4210, exynos5420_eglclk_d),
 	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0,
-		0x28000, exynos5420_kfcclk_d),
+		0x28000, CPUCLK_LAYOUT_E4210, exynos5420_kfcclk_d),
 };
 
 static const struct samsung_cpu_clock exynos5800_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0,
-		0x0, exynos5800_eglclk_d),
+		0x0, CPUCLK_LAYOUT_E4210, exynos5800_eglclk_d),
 	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0,
-		0x28000, exynos5420_kfcclk_d),
+		0x28000, CPUCLK_LAYOUT_E4210, exynos5420_kfcclk_d),
 };
 
 static const struct of_device_id ext_clk_match[] __initconst = {
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index d3779eefb438..609d31a7aa52 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3700,8 +3700,8 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 
 static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", CLK_MOUT_APOLLO_PLL,
-		CLK_MOUT_BUS_PLL_APOLLO_USER, CLK_CPU_HAS_E5433_REGS_LAYOUT,
-		0x0, exynos5433_apolloclk_d),
+		CLK_MOUT_BUS_PLL_APOLLO_USER, 0, 0x0,
+		CPUCLK_LAYOUT_E5433, exynos5433_apolloclk_d),
 };
 
 static const struct samsung_cmu_info apollo_cmu_info __initconst = {
@@ -3944,8 +3944,8 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
 
 static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", CLK_MOUT_ATLAS_PLL,
-		CLK_MOUT_BUS_PLL_ATLAS_USER, CLK_CPU_HAS_E5433_REGS_LAYOUT,
-		0x0, exynos5433_atlasclk_d),
+		CLK_MOUT_BUS_PLL_ATLAS_USER, 0, 0x0,
+		CPUCLK_LAYOUT_E5433, exynos5433_atlasclk_d),
 };
 
 static const struct samsung_cmu_info atlas_cmu_info __initconst = {
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 516b716407e5..a763309e6f12 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk-provider.h>
 #include "clk-pll.h"
+#include "clk-cpu.h"
 
 /**
  * struct samsung_clk_provider - information about clock provider
@@ -282,10 +283,11 @@ struct samsung_cpu_clock {
 	unsigned int	alt_parent_id;
 	unsigned long	flags;
 	int		offset;
+	enum exynos_cpuclk_layout reg_layout;
 	const struct exynos_cpuclk_cfg_data *cfg;
 };
 
-#define CPU_CLK(_id, _name, _pid, _apid, _flags, _offset, _cfg) \
+#define CPU_CLK(_id, _name, _pid, _apid, _flags, _offset, _layout, _cfg) \
 	{							\
 		.id		  = _id,			\
 		.name		  = _name,			\
@@ -293,6 +295,7 @@ struct samsung_cpu_clock {
 		.alt_parent_id	  = _apid,			\
 		.flags		  = _flags,			\
 		.offset		  = _offset,			\
+		.reg_layout	  = _layout,			\
 		.cfg		  = _cfg,			\
 	}
 
-- 
2.39.2

