Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2411A3932FF
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350184; cv=none; b=PQoYzFB5FQSmns7vjsMPGjoqFq9gy2pBeZ4nQwMvdack6fzaiI8afSetqyJf3z8b22eaYl4GdobKKsn6YBpNgnNwQ9/K9h3d5Wb+zgWVtVSHs3A+I3xaL2e22N5cWv/l1Bn4PqjBxjCGRTV21ZFOEnpvi4oOnd7fZWVYLrm58AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350184; c=relaxed/simple;
	bh=7EVf7sPgwz08uOEICfZTm2vyiIZLETiS/W6o+3w2BxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1LzYN07Jgr1sgQGaY4EGCBSK5XAlJDyvAuPaoEpfL1FNyzW0aNJMHB139ATgvPMSy+giubVxpVeighc0/+RH5LUCStAGmAShAzsZayjVMW4vqHTpt8kUg5FiVha3hcb0nqpcfyHC/82rQxBQRdFSXTFb+pEnEbVNNHgemvUtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zu2V247g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zu2V247g"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso21900765e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350180; x=1783954980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=Zu2V247go1cvcmNzfeSrzKqFpwYTKtpSBT/2zZfzalyJrVTEfWhttrVaWXjjC48D4Z
         0bea+/9ZakiZdtrGKE0d54JONO6y2nwYLRttwTqh5l5b6hEvcVxxLb4I7xdSqBZc+NBd
         r5vDkX4BpfQx1uggdfIVscuIo3/IJy9tBL0zGWsX1WZxLZaaB4ptoAuIL5xN4R974Tlc
         afFDJ/wFqf7pEAp7UBO5ubs40bZd3kbQofPaBbLg1hxxkTM9jWhX7KshITsEP6ILUXCm
         11zGyqOtNlRmpkQTLBiYyrWWhL9lGy1nm6SEQCYAPaXjnvk65Kn9KTquiHzxTVYnaMGy
         QcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350180; x=1783954980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=IIOKKrMZfGeCZSqXkP2UgNUhHs+fOvnOOAvQ0vzSO+lw3rO0hHsybLmjTIf8OH1IAx
         iu5cpMumVz8CPhDA9aHD3lT69NwjjP+X75esiBPjwE8L7TK5Zfonle+SwcGJyVPKr8w/
         EsHSlvKw9eQpuG9m8gJeN1HmLLHnzbqW9m8B/6/jgu1e3iRkBFsy8yC5pwsAGgIVBe+o
         0rFCYsnvrQAvTq5K6r/xCsvQ/OgSbCIPrFfs3Jdk8yl7UguDSjM2OS1VxePF2zPH93bK
         CLlWr3+aC2yrq7sSZmPE6c4vIy/GRsDMxRIMiyiFLGhMMbD2UOkJ7xSIDO2dNIxrDV3J
         oJ7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6/rvXnTE+EC9CJgS7CFuf1unbMzCqNCQ7zsR5p2mvx3/tsg5csRMVaqG9J3Z9pINWOmp5Cj0XNVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSzMZ3fKw6EF/7F54zWv9gccpqE0rPjFLGDwE4bhTKCdXL2xQ
	r+ZwyTQb3R7mnQ7TLvNiJ1df0emDGNNrplzSgGfm3pszJTBL33kQU81ab8OdbMIMkiU=
X-Gm-Gg: AfdE7cn6bSqshbqYy5yAg1LSW6HlFazI+JcFDt9lIVmA9Bo+Os03BWtKocORiJEPTFu
	Qb8JFGLZLBMNOYO20dIIcek+FjTLJms8n/am1J0hI7EN3wFj/GlzLNgOFuu8SBzuwbxuNTc3ngz
	Jco8UuPKQs8E69aubBgAtKbRFyqrgs841syqG+AbuljyI76QFiuO9GgNqCtQF0UmX/RkaCCo/zl
	JtYKWuZfEJkvdJKbpk55aSvR0Uk82ATioQrNvK8FZ+uryGvT/p/SDMA/PnrQaN5ozE+F0ofKnLJ
	hO+NkGHRg2kdWVKyECa9twV1ZHXe4zJy0ElI5FJjRoNBmVb1ACGzfrmgGq6FLWkhAeuDVc32jaF
	yWsovGy9F5ShtU9AKzi/P3CwCcBG0QrSXpLpMJVkfNUNGgrYyPmtebbaSziH5nys1cVx+ONdiNX
	WoxjRmGO91l8WM+hHqIe4V/2S3DQ==
X-Received: by 2002:a05:600c:5297:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493df062140mr10992855e9.4.1783350177732;
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:13 +0200
Subject: [PATCH v2 06/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-6-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist on the specified address on MDM9607.
Reading/writing the registers always results in 0 or crashes. The math in
the frequency table is also broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

It seems like this clock does exist on this SoC on a different address, but
since there is no user and reference code for it, it is still better to
drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 092076a5a0c9..f9ed655513ef 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -158,20 +158,6 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll2[] = {
 	{ .hw = &gpll2.clkr.hw },
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_gpll2_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1, 2 },
-	{ P_GPLL2, 3 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_gpll1_gpll2[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll1_vote.hw },
-	{ .hw = &gpll2.clkr.hw },
-};
-
 static const struct freq_tbl ftbl_apss_ahb_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -674,26 +660,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0, 2, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 apss_tcu_clk_src = {
-	.cmd_rcgr = 0x1207c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_gpll2_map,
-	.freq_tbl = ftbl_gcc_apss_tcu_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "apss_tcu_clk_src",
-		.parent_data = gcc_xo_gpll0_gpll1_gpll2,
-		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(57140000, P_GPLL0, 14, 0, 0),
@@ -1512,7 +1478,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0

