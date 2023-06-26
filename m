Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F8EC001B0
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 17:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjFZRsR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 13:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjFZRsQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 13:48:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2641A1B0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 10:48:15 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b466744368so53953361fa.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687801693; x=1690393693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuDHCgM7g2J3zSNzGr58n9ZI5DTdi0x0RzFvs9UVe3A=;
        b=ZByvhThQPzMUBz2+gD+q9KkkN1z9fOwKnYL2U0mqM4J0JCqxc+Jbs6clrszaYtcePu
         +mnIK0Lw+gu4wwLQj1nYCS5UbodzXCiZA3WffFI1PC8y/UKxayY+7e9b0gPzE/fCnhnW
         /DAQ2u28NSXtO1araR7ZUnxeVLqeJ67vfdz3sMxozZogpGZTZcaC0E8KiuzhNh5Mk4JV
         B3FabxzgenZ2Pkz5QVqW3YwxPAx2cQWH7eCb4xrPX5AW+DkQ1t8vJAJOwmqnXaGgIKfW
         PfW3e/JPptQULKFBDAI0eyymMgRWByOU+MVhDLr9Ld17yE9wyPAhma2kV75tSxifNQmv
         9qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687801693; x=1690393693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuDHCgM7g2J3zSNzGr58n9ZI5DTdi0x0RzFvs9UVe3A=;
        b=Ip25n3/MX+sPyjUUw4m1hXJzFpB3uayVEQsYHfB0W3nlb0TnOipHEZqxbV/vfn3glK
         H3bye0T4UnZE4xp4BzFu1Pf6zRE6METwF9dV0RH1Kfr0Ak169QZo52hUDpS7Eo+CqnrB
         4EQ8tXQxtXxPRvx/zj75MOSS9bX7NNfnYLRKMxoXFuQY8PHMh15I/A0GQyPGFD2KMshs
         Z5sJB68cS3nP+DdQJUbElmAjHflXP1SFBawcg0mQhXlzr5KLybUk9TFvnqPpiXv+RCWW
         6weu7djXyb1gW1MPaC1ur6Q+XP9nRNC9DgXGVgWb10I6WrAzwu29dIpqJUNi6S47cL4v
         oGQQ==
X-Gm-Message-State: AC+VfDy0vBBYrY0Qqvsw7if3q9Xr8h5EXbpklRaM790H4l592t/qZ1DB
        31XA+qqCSKsjsHAxvAfz9ZbhPw==
X-Google-Smtp-Source: ACHHUZ4g4j4G20eh+MmlOVjf1xLiy+VMmqyS7SLUCqgvImpVLY/AreHq/rYOMMsnevAHHZQCbs4zIA==
X-Received: by 2002:a2e:9c82:0:b0:2b4:6678:da57 with SMTP id x2-20020a2e9c82000000b002b46678da57mr16573606lji.6.1687801693411;
        Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b470afec39sm1337076ljl.48.2023.06.26.10.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 26 Jun 2023 19:48:06 +0200
Subject: [PATCH v2 1/3] clk: qcom: gcc-sc8280xp: Add missing GDSC flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-sc8280_gccgdsc-v2-1-562c1428c10d@linaro.org>
References: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687801690; l=3705;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=x2HNhRh3bUP7Bf6Yrnh3hjgn57WeQdMIkIFsaKOztGg=;
 b=J3I05++nImYR2qKxElBiEEQ2a6bdfGYoD27OnkneELgmvNl/nL6kp94PK3mc6rUNC1FPvMVXG
 dfbMZSVd/yMCzi0rSictoJBocMvTEiTEU5nnBRPKfWsmKRZ3m68lSLF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All of the 8280's GCC GDSCs can and should use the retain registers so
as not to lose their state when entering lower power modes.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b90c71637814..64bea886322d 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6761,7 +6761,7 @@ static struct gdsc pcie_0_tunnel_gdsc = {
 		.name = "pcie_0_tunnel_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_1_tunnel_gdsc = {
@@ -6772,7 +6772,7 @@ static struct gdsc pcie_1_tunnel_gdsc = {
 		.name = "pcie_1_tunnel_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 /*
@@ -6787,7 +6787,7 @@ static struct gdsc pcie_2a_gdsc = {
 		.name = "pcie_2a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_2b_gdsc = {
@@ -6798,7 +6798,7 @@ static struct gdsc pcie_2b_gdsc = {
 		.name = "pcie_2b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_3a_gdsc = {
@@ -6809,7 +6809,7 @@ static struct gdsc pcie_3a_gdsc = {
 		.name = "pcie_3a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_3b_gdsc = {
@@ -6820,7 +6820,7 @@ static struct gdsc pcie_3b_gdsc = {
 		.name = "pcie_3b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc pcie_4_gdsc = {
@@ -6831,7 +6831,7 @@ static struct gdsc pcie_4_gdsc = {
 		.name = "pcie_4_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
 };
 
 static struct gdsc ufs_card_gdsc = {
@@ -6840,6 +6840,7 @@ static struct gdsc ufs_card_gdsc = {
 		.name = "ufs_card_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_phy_gdsc = {
@@ -6848,6 +6849,7 @@ static struct gdsc ufs_phy_gdsc = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_mp_gdsc = {
@@ -6856,6 +6858,7 @@ static struct gdsc usb30_mp_gdsc = {
 		.name = "usb30_mp_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_prim_gdsc = {
@@ -6864,6 +6867,7 @@ static struct gdsc usb30_prim_gdsc = {
 		.name = "usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_sec_gdsc = {
@@ -6872,6 +6876,7 @@ static struct gdsc usb30_sec_gdsc = {
 		.name = "usb30_sec_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc emac_0_gdsc = {
@@ -6880,6 +6885,7 @@ static struct gdsc emac_0_gdsc = {
 		.name = "emac_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct gdsc emac_1_gdsc = {
@@ -6888,6 +6894,7 @@ static struct gdsc emac_1_gdsc = {
 		.name = "emac_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {

-- 
2.41.0

