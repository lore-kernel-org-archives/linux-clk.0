Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE7318121
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770328921; cv=none; b=ZiWNXiaG9ZJZF43tsiWk4q6dvp0OnHGZgRgt6fHDFv6Y2zg8lwsQWpuX+TB9mwp9vv4+GDfjsN1tU4zp5kLAoMP2MF9dA4t+MuFy0c0nwMrQ7eyf1fVKNSWdwdQJO9h49hBuKuU0vfqe/JNGGiXI6pyTNQkcMakzU67hgDTeZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770328921; c=relaxed/simple;
	bh=U05JLftmyJnHY2XoTQa/nqqqQ5++HU8ZHdqPgaBReWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IMgGHqWrORFXYMPsEuPsTc+NbN1zAfTEyNCucBmfJzwemz7oHJLDEA4ZyQTCxDGSbjnGiOlyNHO9MCaYaH5sdsYRb96H8yJnjlGf9JBfEmGizqWugnVNCWxMY9Tn9DTsLfoZOmTfKlpa2Bipib6K5YxEejICD4YOvGOYQJ3UpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y2ZWOG9w; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y2ZWOG9w"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so2235434a12.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770328919; x=1770933719; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSe1MS03T8BW9ZubjvfneKpDOJEdsi+I8lH8q1oaCb4=;
        b=Y2ZWOG9wzo4xToeA9qHRyVHAIUjfEIyW7drWjryIS9pVCtcr+5oPsm+rsvQI5gJZD3
         vCMF+fVckwt+OG2jzDms7CwJzliuxlfK2bIQ7POeDZnZCLUaOs2Cl5bxTDCvxvaA8Bj9
         vEuiUSIxnhZ7tnKKD6wwygVpZx4EDTDIhgY9LZVog8FxmGWYgQB+hzvM0DOgKR7X/v/C
         q+SZtwx29cbYJtH/Apeunm6hJRuwr1kFlC5eyKtp9+3VZqs0l+EYyYbWYAJ1qLa3AP3E
         +zK3QCZczVLYBxEyQgMFDTLjCJmQALxE/kdZzU+F3qmiNEToGlP+G7pX37oXdeHZLJGW
         whVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770328919; x=1770933719;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSe1MS03T8BW9ZubjvfneKpDOJEdsi+I8lH8q1oaCb4=;
        b=d/v5GtOUvI17SMT+oZ/3F7HjpggIhczn0PGqPzcQZcawysUqIlpthcbluI/O2e7oFg
         XFtHpA/ljkFJjvy7ySSWBH0mAKeVE1Acy1K++X5vKyMjIvgIRYYM6Z08XJIidU+rdpBU
         2KUSh/A9Q1lkJhu+XWwM3qEpd3xo1pxf093XAkr+TLq7olwgeVlLzNI5G9vhOvS/TjpF
         6CNMBGOEzf60XNwg4UCx+KhgEdCtze3xVAyAlGcmCFCclvJ7Td1v5LERtVbYzpeYOPsp
         8jXjLDJx02GIasbrBpwnr1F/QgvFk0OrjuNl1l4ILwhmrrFcqoY8r0/oP7Bef+kUgdok
         RWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbh3RIpYIyNct9Oj4QLmbF87boQ0ixRqOvKjfQD5pDIPBanUcew9V4RrxRwvRxlk9/n5vvb8YVtt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVXfZsfXU9dshab0pSWOWMMmFqLqV4R4zCwYUy5IabI/p9rvy
	jlk0Fj2sbE1ii4xJrtJNUTtgEqmwfRZbjmYLjnMKIlM46yApba1Gn5gdt6SrMJBazL5Des51tbb
	4/uu01v4=
X-Gm-Gg: AZuq6aLF3EAa+vHDevSMEz2c78t2l77iWEgo4ePWzYLyUzszwbEEmbufhkWUY/U6Ys6
	eTyh0zFyxge54yQ8h8MmSQwx17s5mgqA4SQl30Nn0aJrHyoPq+fb6EyWsY6jzICw5ZqLLan/sQH
	KKbuGdjbrAl3xZ9n5PYRLoBDOQGDsBmgfPsCDZKhHn33cVATJvfkewRE8X9tx/DPQCamwUnyYal
	tI20DvN/s7PDNKvX34vFspMtUlolTsoUKRMb3RIrz1wIDNx2pBtlWkTKgOhLusjS54hJj2ynadO
	cc8Zgo+F7hl/9ckwxhgPsJA3kpiqyfBz2/I0mDBbXGeEPNyHy/pTJkKxCOtNGq339FHU63c2jdk
	mzD05n1CssC+xYf3lIENBsvH0enaIsGoTXayhfMoVN+dZh0NdMFarWpze6xFmPT94N9i3oSKMH6
	hqHYNIFMk2ezZ7BIAeZ80Z1U4EKkfxbNrIoQamdi6SAlitzfDAQDJkekDWjrsDLXRiaOeZ5H1Zk
	CvKhA==
X-Received: by 2002:a17:907:6d1e:b0:b8e:12f9:5fce with SMTP id a640c23a62f3a-b8edf4636b0mr25927466b.61.1770328918709;
        Thu, 05 Feb 2026 14:01:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748963sm22893366b.12.2026.02.05.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 14:01:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 22:01:57 +0000
Subject: [PATCH] clk: samsung: gs101: harmonise symbol names (clock arrays)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFQThWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3eScbN30YkMDQ93iytyk/BzdvMTc1GJdA3NzEwsLC9Pk5MQkJaD
 mgqLUtMwKsMHRsbW1ALdxm+xoAAAA
X-Change-ID: 20260123-clk-gs101-symbol-names-07748885ccab
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Most symbols for the clock descriptions (arrays) don't have a cmu_
prefix and all symbols have a _clks suffix where appropriate.

Update the few outliers to also fall into this same scheme for
consistency.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 52 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 44a8ecd332fddce7d4e162219528462ce3c8c03f..d2bcd3a9daf8939157640c4e7a00da3d39ac309e 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -339,7 +339,7 @@
 #define GENERALIO_ACD_CHANNEL_3				0x3f0c
 #define GENERALIO_ACD_MASK				0x3f14
 
-static const unsigned long cmu_top_clk_regs[] __initconst = {
+static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED0,
 	PLL_LOCKTIME_PLL_SHARED1,
 	PLL_LOCKTIME_PLL_SHARED2,
@@ -638,7 +638,7 @@ static const unsigned long cmu_top_clk_regs[] __initconst = {
 	GENERALIO_ACD_MASK,
 };
 
-static const struct samsung_pll_clock cmu_top_pll_clks[] __initconst = {
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	/* CMU_TOP_PURECLKCOMP */
 	PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
@@ -952,7 +952,7 @@ PNAME(mout_cmu_cmuref_p)	= { "mout_cmu_top_boost_option1",
  * For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
  */
 
-static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
 	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
@@ -1108,7 +1108,7 @@ static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
 	    CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
 };
 
-static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
+static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLK_DOUT_CMU_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
 	    CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -1253,13 +1253,13 @@ static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
 	    "mout_pll_shared3", CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
 };
 
-static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+static const struct samsung_fixed_factor_clock top_ffactor_clks[] __initconst = {
 	FFACTOR(CLK_DOUT_CMU_HSI0_USBDPDBG, "dout_cmu_hsi0_usbdpdbg",
 		"gout_cmu_hsi0_usbdpdbg", 1, 4, 0),
 	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
 };
 
-static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
+static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMU_BUS0_BOOST, "gout_cmu_bus0_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_BUS0_BOOST, 21, 0, 0),
 	GATE(CLK_GOUT_CMU_BUS1_BOOST, "gout_cmu_bus1_boost",
@@ -1425,19 +1425,19 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
 };
 
 static const struct samsung_cmu_info top_cmu_info __initconst = {
-	.pll_clks		= cmu_top_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(cmu_top_pll_clks),
-	.mux_clks		= cmu_top_mux_clks,
-	.nr_mux_clks		= ARRAY_SIZE(cmu_top_mux_clks),
-	.div_clks		= cmu_top_div_clks,
-	.nr_div_clks		= ARRAY_SIZE(cmu_top_div_clks),
-	.fixed_factor_clks	= cmu_top_ffactor,
-	.nr_fixed_factor_clks	= ARRAY_SIZE(cmu_top_ffactor),
-	.gate_clks		= cmu_top_gate_clks,
-	.nr_gate_clks		= ARRAY_SIZE(cmu_top_gate_clks),
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_ffactor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_ffactor_clks),
+	.gate_clks		= top_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids		= CLKS_NR_TOP,
-	.clk_regs		= cmu_top_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
 	.auto_clock_gate	= true,
 	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
 	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
@@ -2434,15 +2434,15 @@ PNAME(mout_hsi0_usb31drd_p)		= { "fout_usb_pll",
 					    "dout_hsi0_usb31drd",
 					    "fout_usb_pll" };
 
-static const struct samsung_pll_rate_table cmu_hsi0_usb_pll_rates[] __initconst = {
+static const struct samsung_pll_rate_table hsi0_usb_pll_rates[] __initconst = {
 	PLL_35XX_RATE(24576000, 19200000, 150, 6, 5),
 	{ /* sentinel */ }
 };
 
-static const struct samsung_pll_clock cmu_hsi0_pll_clks[] __initconst = {
+static const struct samsung_pll_clock hsi0_pll_clks[] __initconst = {
 	PLL(pll_0518x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_USB, PLL_CON3_PLL_USB,
-	    cmu_hsi0_usb_pll_rates),
+	    hsi0_usb_pll_rates),
 };
 
 static const struct samsung_mux_clock hsi0_mux_clks[] __initconst = {
@@ -2660,8 +2660,8 @@ static const struct samsung_fixed_rate_clock hsi0_fixed_clks[] __initconst = {
 };
 
 static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
-	.pll_clks		= cmu_hsi0_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(cmu_hsi0_pll_clks),
+	.pll_clks		= hsi0_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(hsi0_pll_clks),
 	.mux_clks		= hsi0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(hsi0_mux_clks),
 	.div_clks		= hsi0_div_clks,
@@ -2791,7 +2791,7 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 #define QCH_CON_UFS_EMBD_QCH_FMP													0x3094
 #define QUEUE_CTRL_REG_BLK_HSI2_CMU_HSI2												0x3c00
 
-static const unsigned long cmu_hsi2_clk_regs[] __initconst = {
+static const unsigned long hsi2_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_HSI2_BUS_USER,
 	PLL_CON1_MUX_CLKCMU_HSI2_BUS_USER,
 	PLL_CON0_MUX_CLKCMU_HSI2_MMC_CARD_USER,
@@ -3166,8 +3166,8 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.gate_clks		= hsi2_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(hsi2_gate_clks),
 	.nr_clk_ids		= CLKS_NR_HSI2,
-	.clk_regs		= cmu_hsi2_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.clk_regs		= hsi2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(hsi2_clk_regs),
 	.sysreg_clk_regs	= dcrg_memclk_sysreg,
 	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260123-clk-gs101-symbol-names-07748885ccab

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

