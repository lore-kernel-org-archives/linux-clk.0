Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724592FD1A1
	for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221563; cv=none; b=p688NDiKCerE8qrPQa8QmLyiaF9tjVCPXkvRi6VdBFgadWXX5d0rznGPru3FzLNNu9umW5TJ17M/r6XmFKtLILuKEXjsd28813dEyA85gHQk/CmAd8QQvSpH52oUDF4vXSdCwQdr6+ZWa6V3OXnXxtYByZTokkzT6K2pWMvYxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221563; c=relaxed/simple;
	bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ov2xtprQ22WuqElLeCs69vHEZ+HRVE3QkpvlzKzOCytl8IsYMnOHJscPdny93kfXVzQJ/+qIXnufHCe4BU0DjZPACizRC6dhIahXKEYRY6xf6U50f+dL93RYgvgls3MvYTBArVARFuP/tqgCUgYpsYCgYVjVfoXiV9n7RlQt8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwXr1U4p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwXr1U4p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso18059895e9.2
        for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221559; x=1766826359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=iwXr1U4pHBVFKUsW5iHtsallGwffMOdrr7XsfqgeipDGfGQ+BNDy73GDbC1ShlpABu
         Yo0XJlDS8FkBFjw1Vmqlrj9o4RjcbhUtrEvjm4QAQ3HknYdG3aQ8AsL/Rfb/Jo3ftUyj
         B3VJTIX9eNb/FlnU4oT8IDikx61Tn0CTDF5AqTpY5Kh8J9FpNpzKfbb48zMdOXnZyFlE
         P9zKy2CAM0dun1Xw2bx8YGNpKlcBeghLFOxEAQq9k/bcRTEtkEJ6fI20M01v64lGWf5o
         3fYP4qjJL5OepwBDAqfunWFOmKffeu3Xhih7TOD0+iwQ6OHdJB3lJULs//DnUlXR1vt0
         AnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221559; x=1766826359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=Am3T/K3avmUJBI/vZuedHJW3Eeuge2y7xiKH29jEJ6O5RD1hMxI5KGAaoyabG/Mds2
         Fm1DsIYgXGHARB9dykC2SDsGujnPxckU0eGd3EqwKrnOwjRsAXnWhQ08sdjWTl7NzA1F
         aUwsOSkOznV5BPHs/bPByG4kqlpIRc/u43BBrIKCFtqYtzTKXaUe9ecq1Gls++B/6N0C
         Zji6mMgSDLEMCUBB9trKotpa+cI/1xEHfSxkTctRNOrZKK7QaPqyyMQZjfUZF1aPlO/T
         zxenVQdj2fZDUwplogKL1LBoD19NB//TCt6f9iU+cYBUrBk0hyHIbxZBHSgQpP/6M8Cp
         3bAw==
X-Forwarded-Encrypted: i=1; AJvYcCXfDqgBt4efoTMKmdefnUO5hTJ/9LkmcR93d1yvS5WDrTX3Rmh6xlB2VjZxdJKhxqXTOr5XVnIpfBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/maDh8gvcrP2UuuTpDS8Zh0mN0/SN0skFTmmuEvdKnZ27ZdP
	tD5RAaPrwhXzI/dJveepR/Fne7VAW7xelBZxoM2zUjin8byXpbl01bm6PTzuVmRybXU=
X-Gm-Gg: AY/fxX4g9XdTvymHxokSeKCdyhon8RNw9MQ2VPcO1L1lLNgwBhC/Ys1uTXg1V91tpre
	SWkKeQbgTS5r5UeUwSjKsQfeLv7eZlRducespzYmfXr0ontoM538SlC54R4CCbqhQMbGaOs3j7f
	fa7lNnvSnzU4Qt0LvDoE+zZ80BFtPMXAbUaPxH2fSnEucrZPdE2v0R5otdnMGv2DID7c/CETZtn
	2wv4u7vgoB6Eet6oZ9cFGUyk2bFHR3rlsObcUP465khVKZNAF3eWZliFZin0ABkKTDrf/8ZGsPE
	ky07fAwz5cUQ0BiCDIuAepjM7saY6ASgaEuq8XT7U0RNHcLPUREGG1iS0dT8B+80EQ1waNV7hKE
	NSX/y/nB4emPTedWq1ZQ9lOjlZcZz/ZdDETURiX2pDFe0mnd0G/yezxIuJi5KImi09iKv22CAP0
	MeppOJ3mh6Ik+S1rqizjqhWAlTUcIGnjqPItLFyVg=
X-Google-Smtp-Source: AGHT+IFCUXWI6aw3Mi0uQPnoiCABpAeI+lRIlbv8QjWYLfVthEPpi5pHmK0OXgUKHYpht3AdIb214A==
X-Received: by 2002:a05:600c:470e:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47d19589469mr52722335e9.26.1766221558592;
        Sat, 20 Dec 2025 01:05:58 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:57 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:05:42 +0000
Subject: [PATCH v6 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-automatic-clocks-v6-4-36c2f276a135@linaro.org>
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
In-Reply-To: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbuBqmDI4GAqQs79cB1AkMOySGopviN+P3hb
 uecIYdF8IuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7gAKCRDO6LjWAjRy
 um/vEACicphWUljDI3ykObAXL+bUHs0wN+2joaKqvPwVqdTWr6a25rNAvmK3kwjLayHZikDoLTd
 9TOeYdv8s6+1+g5zXx5RH4TtF+KNUlZpNkri3jjQKxWBLf0awRS/FVYr0rX+/+f8ECt92C81q95
 MMY8xU+jGvZ53TrxVmfSsnl/Wots3TaO9Bk499iz60mLtg/p1otQfObAeCBdL0XiguSEVQRBmIC
 k49HVnccEQ8k4lQagnSqG/V9YQ/PHYcMF0c4AAdBTvTKIgDBLN8bwiR/XR/49eBQSXIu7y44ok1
 Vrjf53DKBHZ9QNCAaVTS3qLRnXbPPrim7jUhRuLpo1SAMDZTejpfZRe+HTj+Fcio/tz9V+Au/LV
 R27RI11sZeZonax2PEHqRYlP/Z9PC1lGodEIOCs7y4YIaUy20zfevGfXJyPJL2Vqlq1hu2g3bt5
 e26Ss7JlxP1Eq+G/VVjx2rEK3HoaWe5Qrbib80x/oJs5K27+26PrVXeH3Fl/h/JAFY01/jtc2ad
 VZujbRnRRbK9b3e6c6kQ56v95kftLQIzUH3hsuYO3cr1A3BqiNyVmFNQJ5XJ4PldhvID8Egj9et
 wJJF1hAIHd7iDYaECNe/mSGc0MN989glz6BeSgMFTfivQnJOuSC86d4Y4DQ/Xbitiq6ZEL+Wc4W
 rgbbAo4+V6U6cYQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Remove unnecessary header of_address.h (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..8551289b46eb88ec61dd1914d0fe782ae6794000 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -26,6 +26,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1437,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1907,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
+static const unsigned long dcrg_memclk_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+	GS101_MEMCLK_OFFSET,
+};
+
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.mux_clks		= apm_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
@@ -1912,6 +1924,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_APM,
 	.clk_regs		= apm_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
@@ -2375,7 +2393,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI0,
 	.clk_regs		= hsi0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI2 ------------------------------------------------------------ */
@@ -2863,7 +2888,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI2,
 	.clk_regs		= cmu_hsi2_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_MISC ------------------------------------------------------------ */
@@ -3423,7 +3455,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 static void __init gs101_cmu_misc_init(struct device_node *np)
@@ -4010,6 +4049,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4063,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC0,
 	.clk_regs		= peric0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- CMU_PERIC1 ---------------------------------------------------------- */
@@ -4368,7 +4417,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC1,
 	.clk_regs		= peric1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- platform_driver ----------------------------------------------------- */

-- 
2.52.0.351.gbe84eed79e-goog

