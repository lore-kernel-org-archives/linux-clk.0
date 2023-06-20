Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EDBEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jun 2023 18:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjFTSzJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jun 2023 14:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjFTSzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Jun 2023 14:55:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1E3172C
        for <linux-clk@vger.kernel.org>; Tue, 20 Jun 2023 11:55:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f86bc35f13so4322883e87.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Jun 2023 11:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287301; x=1689879301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2584mY2CIIT99nEUdLfXKaqA6hVAl1xKCUH5FIpuMY=;
        b=pA3az+vlsg1FbU4r0H7GRSrMO1K/6APbS4mEww46QipnUF30dtExLhz1gYYX/8F5Rl
         OpUamyM3sKBleOa6+du24TuSsJysMv89q4m7VrlT+OiStX+h5DvMpuCXU0nk16gLZINW
         cqRcjhA3kHi28mQwnGrMSRls9xYwJKupH0zgcKZh7lO2P5WReXe4BdW7daYnY+0DWX2t
         jBLbdLGbJIf+/92EErAvaazbezajMfty0lSg60A1M3b1EiuCiCax0Lxvzlj/vUH87cjs
         JqroPLqRlXSezbV02SYBCqETLfoT+qZbe60EL9p1mjezyF+wirizL0AoMsK9wzWQLJuK
         XfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287301; x=1689879301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2584mY2CIIT99nEUdLfXKaqA6hVAl1xKCUH5FIpuMY=;
        b=JJHatEHiRFfizVVL8N12ZIhE68Vqu1H8Hv4axrksMAqIqLa5L/6ULcOd94wm5iSSos
         j6GJA6EsxrEliUgPZRY8A90WtjYt/4osmmIbi9lXMnLzsqZhHwu7WT8L0gItOM0+2fFd
         Mh0IMnu1O6pFh8rv2bavWAO1eLP2nURjCvO45K6FlHraP1JHIgDGI67xlhnDFWCVw3Sy
         SI3xkK2YO6E+sq8MHgjSx0VEgnyDGxcH9DjN1URkQU82mdTauuPhKyVwCHLtivXc6s0p
         Vdb348V5UF31pK5H29jDlAy5oYbTZcolbqoYGBlFmZhbkvI295IKFuseoOCoQaES0b1G
         KTkg==
X-Gm-Message-State: AC+VfDyBNdZ+AY81xQ7QxhxTzDVVdsnlARQGxKrEsOIDLNv9gqKSnfkE
        d69xNE2tr2MCfi4E2Fg7ebZtLA==
X-Google-Smtp-Source: ACHHUZ5YK3+DQ+fqf/GvNiXAWn4RR3/C7kipu6rh0J8dUFQPAI7CLjjpQy+DjfJSw5r/M8xXXzHp7g==
X-Received: by 2002:a19:d619:0:b0:4f4:bbfc:3615 with SMTP id n25-20020a19d619000000b004f4bbfc3615mr7200331lfg.68.1687287301516;
        Tue, 20 Jun 2023 11:55:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25921000000b004f867f8d157sm463899lfi.124.2023.06.20.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 11:55:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 20:54:58 +0200
Subject: [PATCH 1/3] clk: qcom: gcc-sc8280xp: Add missing GDSC flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-sc8280_gccgdsc-v1-1-0fd91a942bda@linaro.org>
References: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687287298; l=3934;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zD4bAJffraIfwpzANPrCFCADlOJ036wDsQU07qiY6ho=;
 b=QeHHi6DuDgq2P9ODBKrUwVusAD4mrYFTqdvimc+cpr1Hb+Wy74AoiQrrbeeaKDiAHakNRCQr0
 fWI+tRowT3cCeLWbIHV9X7jtAfUXn/EPu5u9EeENzqFp+5Pqxg/4WKS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All GDSCs were missing the flags that describe how they should be
treated, namely:

- HW_CTRL - whether the hardware control mode is enabled
- RETAIN_FF_ENABLE - whether to enable retention registers

Add them as appropriate, according to the data from downstream.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 04a99dbaa57e..80bc741ee75a 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6760,7 +6760,7 @@ static struct gdsc pcie_0_tunnel_gdsc = {
 		.name = "pcie_0_tunnel_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_1_tunnel_gdsc = {
@@ -6771,7 +6771,7 @@ static struct gdsc pcie_1_tunnel_gdsc = {
 		.name = "pcie_1_tunnel_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 /*
@@ -6786,7 +6786,7 @@ static struct gdsc pcie_2a_gdsc = {
 		.name = "pcie_2a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_2b_gdsc = {
@@ -6797,7 +6797,7 @@ static struct gdsc pcie_2b_gdsc = {
 		.name = "pcie_2b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_3a_gdsc = {
@@ -6808,7 +6808,7 @@ static struct gdsc pcie_3a_gdsc = {
 		.name = "pcie_3a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_3b_gdsc = {
@@ -6819,7 +6819,7 @@ static struct gdsc pcie_3b_gdsc = {
 		.name = "pcie_3b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_4_gdsc = {
@@ -6830,7 +6830,7 @@ static struct gdsc pcie_4_gdsc = {
 		.name = "pcie_4_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | HW_CTRL | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc ufs_card_gdsc = {
@@ -6839,6 +6839,7 @@ static struct gdsc ufs_card_gdsc = {
 		.name = "ufs_card_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_phy_gdsc = {
@@ -6847,6 +6848,7 @@ static struct gdsc ufs_phy_gdsc = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_mp_gdsc = {
@@ -6855,6 +6857,7 @@ static struct gdsc usb30_mp_gdsc = {
 		.name = "usb30_mp_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_prim_gdsc = {
@@ -6863,6 +6866,7 @@ static struct gdsc usb30_prim_gdsc = {
 		.name = "usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_sec_gdsc = {
@@ -6871,6 +6875,7 @@ static struct gdsc usb30_sec_gdsc = {
 		.name = "usb30_sec_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc emac_0_gdsc = {
@@ -6879,6 +6884,7 @@ static struct gdsc emac_0_gdsc = {
 		.name = "emac_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc emac_1_gdsc = {
@@ -6887,6 +6893,7 @@ static struct gdsc emac_1_gdsc = {
 		.name = "emac_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {

-- 
2.41.0

