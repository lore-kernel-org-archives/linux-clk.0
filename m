Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD063845B7
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350182; cv=none; b=Jj4XuCb2bH36MJLW2GE/n1d7NTIQXoRi2a3L+b0LOm8N/nIbi8sI/0kpdrlqtV1Gzaide3lkAALv/FYi8AXPeTdp7TQYWWAUpaqfjQKzqPGhswutz+iIgiQjzq/poXeGeUW1fumUeH/PJtmxrJYtAWCHEBzZDfwjCCuJt+NySaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350182; c=relaxed/simple;
	bh=l9Ym/I6LGIuY1NBqKLVkODWRGiyzG1V85fGPSTiYcco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bu++6XIPXzSSO61+Edf7cE8SgvBMvnXdkMPTXTLqkuauzOz598OGMSP8qLEv7pU4qoB47e6InF9GisX1eiMY3iZ57+UCnp2AguNJa2R8nY/ri23joEUxqUYTicyt/pdJn274aTkSEEp2o/+yO+jPoBuCeVfYue1Vgkpk3GyPm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DhPwOJ0z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhPwOJ0z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so21816755e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350179; x=1783954979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFVOx30uAac950vvuoee7ZCsxXunq7hMY93R+H02rTI=;
        b=DhPwOJ0z8MEJ7ATUM0bJbFelev4+u8f0pyPATLxjEGERmfkTuX25Ht1zo2xu0URLD0
         Xbnm/pII11pS8kdmkvCSudPsZpzneYgloSApkoZw8ywb386IU/7GsOIO9ZnnA4vSkGQz
         ga/CftZ9aVBrhpFxY0c+2GmUxPefCk15iyrf1q0PZeAqpQ/+4ZKVhwyyheX4cDEGx3tH
         7Urvl7BckX8ygHhzclpiOCbANvgjM8p588aYubCS8JC5BL5oxF6dBqzCp68s1pLYDNsY
         bGCbqFFc+l/AD81xTT1PwE6KSsgfKt4i1jg8X1pPxJkyMRPwWKh5gvCS0XZLHLx+X76r
         42Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350179; x=1783954979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFVOx30uAac950vvuoee7ZCsxXunq7hMY93R+H02rTI=;
        b=DEoKi/7G94qF5GULwXQzakJyLZSi+8uhX0n3K4/+IwSpTevgMgzxQPt7bwFi0nJdcK
         eG8qRqLsWEthJE5i1YjFl2BbEEqugU3pJi6ZUePsVERm+9LRVNaWlgBSdaR2BZcEKnI7
         FgD8NKx+1z+7Mqgnn6Soascinu71pENoq9lrhOxJu76MlBLFxaUhpANUm3ZLZASB8vbT
         qM2psjlK5lnWMvXGXGi7UqsGb9e/2EW4WnfKR1Ue2AipX8NX52WVoeZyx8n640Us6nP4
         PmRoLarwFvUPpVMOCMfc6sYvpdpDCsS1S3ynoo0OaJrKfRJJA2nOkeQZkRNQ2huNAQ7k
         6Ygg==
X-Forwarded-Encrypted: i=1; AHgh+RpbPM9jDLO9N/3rb4RPjj1GCp93OFen7X3NYC8zTA9yIGj1Z7pBVHJAMJpfCCpzyd5XX1njQPvQnOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNfgCkqGNP6PgwDCnIJyh2RtF6lGwjoDc09aeJmTjkcEMHQBM
	NT2wX/p45G22gdCZK/YS5n8FNflKWPR4WbYisKPlTN9oSSKgPpF4z1K5erA1Z5KZZkM=
X-Gm-Gg: AfdE7ckD0rXSUXwXXK9Ef7gf9yiuprYOf9+YWGnxR5UpUskDGqNDjvsQZRqvce15xan
	kDAM3DLUqlfeYHXWn9Gaz6/pNmkP1vSuvbKFt/5W4GnLMyfQ78rSSBcFMsN6UFgoSsHslgm4L3g
	kYJsqEZAnls3LF5hv85vbMn6dcKIIjl64y6DuZqfLss4x7gj5xAylnCi9TfH40f6uEfwBvRC920
	RTisVexO1OSXTqyK5PTT0uYeOtrZEIY/aokJnuxo2bzFB3OinAIsThoKmiAHTNfkyUiCOzoIEvg
	dg0dHL0K5hSrOGf+Ru7EMgevlqH4n5qGl9SCSLeyRgijsgpp9NBotmUV2/MmST+lakodr606W9w
	ih1NzqAFO0b3n4pT8g0oLeO7nmgk0eNYBIknScUEN/YNVM31XrpGrHIQ2OgxKkCX/Kg+xs+9/eA
	TZdFwNr+MkhquT0r1ovO1sHlIYaw==
X-Received: by 2002:a05:600c:3514:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493df05f8d4mr9781945e9.11.1783350178912;
        Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:14 +0200
Subject: [PATCH v2 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-7-745565101869@linaro.org>
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

This clock does not exist on MDM9607. Reading/writing the registers always
results in 0.

Presumably, this definition was mistakenly copied from gcc-msm8916. On
MSM8916, this root clock is used for multimedia subsystems (camera,
display, video). MDM9607 has none of that, so this clock was probably
omitted in the hardware.

There are no users inside gcc-mdm9607, so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index f9ed655513ef..c6abe93ce2e8 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -240,18 +240,6 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	},
 };
 
-static struct clk_rcg2 system_noc_bfdcd_clk_src = {
-	.cmd_rcgr = 0x26004,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "system_noc_bfdcd_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -1451,7 +1439,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[BIMC_PLL_VOTE] = &bimc_pll_vote,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
-	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0

