Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3748C7EE33
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 21:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240544AbjELVSN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 17:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240471AbjELVSM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 17:18:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA45A25D
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so8838739e87.2
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926256; x=1686518256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=BuRSACEhCM1LdPoW8vkgN9Kw/+4kq4HWSMGWy8GC4W+1SJX9yKDcp+/hF6RjWL8z06
         UukMbDEz5fMJVZEM48lzWP55DoQxBy+JV5EiCkX5zNGVQVx8PxQwkGVGCn23Rn7ZjBgk
         gEf5o/ei706P5KugtWZvsrSuieX6JI794aB3PrmpPunesQkgDQ5OxndxAb5fHtyowaKH
         Db+RraifmpT63xc6wLO7KHUIcHoT49KlgAlolyhxHoJPlH0a12czaUBBd3xikyhd8Pyu
         sR+ZVwngiTwlEfe27G+fUlE1HM1ykNWKskBJ1/xECQIXqbmnrHSN8VR9nNxiyuugpq2K
         nxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926256; x=1686518256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=KjmtmiWfrq/7vo85uzPk4UMokGdIsYr/9tsgR3wB90W5njp3E6V1pce2OvgS8RGudo
         Y2K1k+zwsYfSV1qmxFa3tNuyBN+1/TAz7T4OSC9jmK9oLop93256pmLyqlrFT7goTtjP
         mF43wyBpnWnMGMP1c0I2IGD8MMJAKsOlShQ9pW6wbuOtudu4h4Dp/e1v8vMu2/L4JdZ1
         5CW0vXcm+kTGgX31C21L5iaV4+Sx+q4r1H/ObgLB/pBmaOqTf/lGx+6Qe1N6F9sZGrTN
         Zk+MlylJO2QrBDRpDrOpBNzth4BcDIM0n4khOM/dZfNdItKSXcjSiyAN3/z4OWloJ55b
         FEog==
X-Gm-Message-State: AC+VfDwisrT37B13DqjQhFGliW7tQJVJmHa3/z+jrHiSnGEAaKpUeVzX
        ECDVcLjhn3Ajbx/2sheFIQ4xVA==
X-Google-Smtp-Source: ACHHUZ6xwvzC84NR4pC86NVahGBSGsuPoaNwdZ7LCEr0jS7odBvUsUnj/70eVECP01ZzUy34E88hBQ==
X-Received: by 2002:ac2:5227:0:b0:4ed:c286:7ab6 with SMTP id i7-20020ac25227000000b004edc2867ab6mr3639306lfl.67.1683926256664;
        Fri, 12 May 2023 14:17:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
Date:   Sat, 13 May 2023 00:17:26 +0300
Message-Id: <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify clocks used by the LCC device on the MDM9615 platform.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b40c52ddf9b4..556abe90cf5b 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -39,7 +39,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -113,6 +113,20 @@ lcc: clock-controller@28000000 {
 			reg = <0x28000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&cxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.39.2

