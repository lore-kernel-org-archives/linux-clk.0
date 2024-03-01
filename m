Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663422E415
	for <linux-clk@vger.kernel.org>; Fri,  1 Mar 2024 01:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257883; cv=none; b=ir9qh41nvhjDrXs0r+MV81lYwqQADKV+VWa+E01HceuI5av08m34mi3/7qu4D3NO5yR6AOXBuw0J87lwLPKTnuv595YS+qNvm9yo66ChKeNnvIXNQvxzhrGry3PLi90blK6yJUbDsnqNe/TbDJZv8l1B12ax7ClbpA9iqapDtjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257883; c=relaxed/simple;
	bh=QyxP1iqPDjfvyIjGdmhxdRhklCVEPt8HipFJGmMfadc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WwM3I0ktOL9lrih1te10UtZf9G5wQ47sj4e5S+ho3jMOBFUd4d12XlJ89Mwz973e4R/Y2EaJc3O88vFIyPAhY7aNqdk0dxSjJKK+L5NIzu1bVELYnldyD6wg3yRSR8bV5tmLfMde2ZmQThTiRMsFYIJTC6d0XJiYV8iOc/drEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJfiRkYk; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJfiRkYk"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21e5fa2f7efso813905fac.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 17:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709257879; x=1709862679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89qGbY61adiDC0jI07VuVZZvVnnxUhSYInpzriInm0g=;
        b=gJfiRkYkBAwFyoIN5ftwqtT55gqG2FTFjwBNuZeAfLL2g+s14xeHO7v3V7xm8flIEh
         ifDr4Pn7g9nsKg0ifppwgY5VK/28VMhr+p7ljKxa7Y5igg62U5tGnTAUepLkm4vBWUcr
         oMhzmCxL8vzcyvJIV3bC4LassFDXREG1RtgP9Mc61gX+FGsq/+TsGI3szHaK2sUyPW64
         Z6NsvgS2WPFfOSggR0x1bBmyfew+jwB9qSmcHMaqtBSBLMNKAEELLHMJXJMEXrLd4Pp+
         uvlQw8fC8RcY6E0H0M1eCUiRJ+1opTBKyAaU24scevYpHrCtPNB8cJsoazuX6aZxJS5E
         5R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709257879; x=1709862679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89qGbY61adiDC0jI07VuVZZvVnnxUhSYInpzriInm0g=;
        b=v+EDq7wJ5zjMrdlXg/QYzmAxvHvwBk8LqlB5Q1s+aHXIUp+Jl2vSVH5OHdx36iau1A
         7EMgr/vkyLnDuqqIG0ZezoCXKpXUOM7ICN0ljZBOOM6bIhJMG+oqbDl30RO9YRxvxGHR
         cEGj04xx/fPhufcsWa6BFKLPHhHv2ZlNCiT4TjZx2AGZ7/c3SZ8RCojkpD281x+qM3ZH
         DUOjG2CUU54AfDk03Sjkv9DewiK+BK3tEyjj45jbvnkx8JaE8P4hL65UI+rc2tLdwuQc
         MK42dqWJptXC4esCb/1qVexqjykYbDCF8q95ZZ1Nh874pFnZjE2q/19mhxW7Yd4JMIgB
         UjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVscN46KHz+pU0L4fheb1g2DluZtv+djXZBxIdkBtuVMCwde/80Q2TCxvpgmsB6zqwl1NmgjrvaQYYw6SnkfFjl7JlQ2J4LR5I
X-Gm-Message-State: AOJu0Yxckc5b2sHVErrzHd2QAWw4tDxHSHoMb4Ff6R+0nuAUqGw7Y3sG
	dkuN3Em2sIO1GNQSTX/uweq6ox1ikpro7cjCdAOYFHxsGvvdJucZpYgRADLO1Cw=
X-Google-Smtp-Source: AGHT+IG5WbMLsAps1Rv/qERBYELMrznbY8kTNQafWroXqqjZ8VoicEyOJ2ngKFP8bSF/qa4S6YfGXQ==
X-Received: by 2002:a05:6870:1652:b0:21e:b096:2494 with SMTP id c18-20020a056870165200b0021eb0962494mr335586oae.50.1709257879454;
        Thu, 29 Feb 2024 17:51:19 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id ux11-20020a056870af0b00b0021fd54aba16sm754686oab.48.2024.02.29.17.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 17:51:19 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
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
Subject: [PATCH v4 1/3] clk: samsung: Implement manual PLL control for ARM64 SoCs
Date: Thu, 29 Feb 2024 19:51:16 -0600
Message-Id: <20240301015118.30072-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some ARM64 Exynos chips are capable to control PLL clocks automatically.
For those chips, whether the PLL is controlled automatically or manually
is chosen in PLL_CON1 register with next bits:

    [28]  ENABLE_AUTOMATIC_CLKGATING
    [1]   MANUAL_PLL_CTRL
    [0]   AUTO_PLL_CTRL

The bl2 bootloader sets 0x10000001 value for some PLL_CON1 registers,
which means any attempt to control those PLLs manually (e.g.
disabling/enabling those PLLs or changing MUX parent clocks) would lead
to PLL lock timeout with error message like this:

    Could not lock PLL ...

At the moment, all Samsung clock drivers implement manual clock control.
So in order to make it possible to control PLLs, corresponding PLL_CON1
registers should be set to 0x2 first.

Some older ARM64 chips don't implement the automatic clock control
though. It also might be desirable to configure some PLLs for manual
control, while keeping the default configuration for the rest. So it'd
convenient to choose this PLL mode for each CMU separately. Introduce
.manual_plls field to CMU structure to choose the PLL control mode.
Because it'll be initialized with "false" in all existing CMU
structures by default, it won't affect any existing clock drivers,
allowing for this feature to be enabled gradually when it's needed with
no change for the rest of users. In case .manual_plls is set, set
PLL_CON1 registers to manual control, akin to what's already done for
gate clocks in exynos_arm64_init_clocks(). Of course, PLL_CON1 registers
should be added to corresponding struct samsung_cmu_info::clk_regs array
to make sure they get initialized.

No functional change. This patch adds a feature, but doesn't enable it
for any users.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - Turned register checking macros into static functions

Changes in v3:
  - none

Changes in v2:
  - none

 drivers/clk/samsung/clk-exynos-arm64.c | 56 +++++++++++++++++++-------
 drivers/clk/samsung/clk.h              |  4 ++
 2 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 6fb7194df7ab..bf7de21f329e 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -17,10 +17,17 @@
 
 #include "clk-exynos-arm64.h"
 
+/* PLL register bits */
+#define PLL_CON1_MANUAL		BIT(1)
+
 /* Gate register bits */
 #define GATE_MANUAL		BIT(20)
 #define GATE_ENABLE_HWACG	BIT(28)
 
+/* PLL_CONx_PLL register offsets range */
+#define PLL_CON_OFF_START	0x100
+#define PLL_CON_OFF_END		0x600
+
 /* Gate register offsets range */
 #define GATE_OFF_START		0x2000
 #define GATE_OFF_END		0x2fff
@@ -38,17 +45,36 @@ struct exynos_arm64_cmu_data {
 	struct samsung_clk_provider *ctx;
 };
 
+/* Check if the register offset is a GATE register */
+static bool is_gate_reg(unsigned long off)
+{
+	return off >= GATE_OFF_START && off <= GATE_OFF_END;
+}
+
+/* Check if the register offset is a PLL_CONx register */
+static bool is_pll_conx_reg(unsigned long off)
+{
+	return off >= PLL_CON_OFF_START && off <= PLL_CON_OFF_END;
+}
+
+/* Check if the register offset is a PLL_CON1 register */
+static bool is_pll_con1_reg(unsigned long off)
+{
+	return is_pll_conx_reg(off) && (off & 0xf) == 0x4 && !(off & 0x10);
+}
+
 /**
  * exynos_arm64_init_clocks - Set clocks initial configuration
- * @np:			CMU device tree node with "reg" property (CMU addr)
- * @reg_offs:		Register offsets array for clocks to init
- * @reg_offs_len:	Number of register offsets in reg_offs array
+ * @np:		CMU device tree node with "reg" property (CMU addr)
+ * @cmu:	CMU data
  *
- * Set manual control mode for all gate clocks.
+ * Set manual control mode for all gate and PLL clocks.
  */
 static void __init exynos_arm64_init_clocks(struct device_node *np,
-		const unsigned long *reg_offs, size_t reg_offs_len)
+					    const struct samsung_cmu_info *cmu)
 {
+	const unsigned long *reg_offs = cmu->clk_regs;
+	size_t reg_offs_len = cmu->nr_clk_regs;
 	void __iomem *reg_base;
 	size_t i;
 
@@ -60,14 +86,14 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 		void __iomem *reg = reg_base + reg_offs[i];
 		u32 val;
 
-		/* Modify only gate clock registers */
-		if (reg_offs[i] < GATE_OFF_START || reg_offs[i] > GATE_OFF_END)
-			continue;
-
-		val = readl(reg);
-		val |= GATE_MANUAL;
-		val &= ~GATE_ENABLE_HWACG;
-		writel(val, reg);
+		if (cmu->manual_plls && is_pll_con1_reg(reg_offs[i])) {
+			writel(PLL_CON1_MANUAL, reg);
+		} else if (is_gate_reg(reg_offs[i])) {
+			val = readl(reg);
+			val |= GATE_MANUAL;
+			val &= ~GATE_ENABLE_HWACG;
+			writel(val, reg);
+		}
 	}
 
 	iounmap(reg_base);
@@ -177,7 +203,7 @@ void __init exynos_arm64_register_cmu(struct device *dev,
 		pr_err("%s: could not enable bus clock %s; err = %d\n",
 		       __func__, cmu->clk_name, err);
 
-	exynos_arm64_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
+	exynos_arm64_init_clocks(np, cmu);
 	samsung_cmu_register_one(np, cmu);
 }
 
@@ -224,7 +250,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 		       __func__, cmu->clk_name, ret);
 
 	if (set_manual)
-		exynos_arm64_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
+		exynos_arm64_init_clocks(np, cmu);
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a763309e6f12..a70bd7cce39f 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -330,6 +330,7 @@ struct samsung_clock_reg_cache {
  * @suspend_regs: list of clock registers to set before suspend
  * @nr_suspend_regs: count of clock registers in @suspend_regs
  * @clk_name: name of the parent clock needed for CMU register access
+ * @manual_plls: Enable manual control for PLL clocks
  */
 struct samsung_cmu_info {
 	const struct samsung_pll_clock *pll_clks;
@@ -354,6 +355,9 @@ struct samsung_cmu_info {
 	const struct samsung_clk_reg_dump *suspend_regs;
 	unsigned int nr_suspend_regs;
 	const char *clk_name;
+
+	/* ARM64 Exynos CMUs */
+	bool manual_plls;
 };
 
 struct samsung_clk_provider *samsung_clk_init(struct device *dev,
-- 
2.39.2

