Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F149C001DD
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjGBRu5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjGBRu4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:50:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1A6E7D
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:50:53 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so4543301e87.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320251; x=1690912251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VyppmCQXuilTGQB3wrm3Kg/cbYa6gmWtfZYYvtVywc=;
        b=V1E4BiAmo7N+qyuIKVoWjsG358Dsm/OIAjLN7B09/d1HL1Kp+WJSBOZpmf2kM3KFZ5
         BtWCaOHUGoDBxLjlYDir0y0YFIdWkQYIXhyq2r223soRALd81uXoMXrglxLX8TQ2ov2+
         dZujqUXY/P1xBifq1t2OdMHhCHQEJPvyz9Sxuxix4fNfFmFmabNc1Pn/tJHzoBxlf6Wx
         qZkeM99AQdlql1cadRlGKli2rocbTZ0zKDuZB5ZHIR5VIy1/x/TCEqoRklcec6fgV7Ju
         ++7MyD1juBxu3ib01TYA5dzMUK16UN22fPMddjNsBB02wG8xp7q/bZEMOxumJMRCXN2u
         a4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320251; x=1690912251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VyppmCQXuilTGQB3wrm3Kg/cbYa6gmWtfZYYvtVywc=;
        b=HIgA059oE5ua75T343MK9BrbOchFVNSv+WanlQw2XBOOIejDjnLRrvbQAXfabzDuwb
         +RFenYAgdi25SFOROXsjbXduzsX0sJrZnae+sspPn5xfxBmf+El7E+kZUxqCe3RzKJP4
         w5JXutn/jjY/bhOp1bExME1OJQnfjU/a5Y1ueTL0Eo8cL7vQIN6BUv6/mVHUO+lTFfrw
         tWLnbsK45MEOa0oCaGneP9BEtIwplEd74BXhUmbbPmZHCo0KCf8fiRjwKP5e9AaWVoU7
         51lVdqcUF9t2XyVthVaNTsMbgWW7YNRBrf+Id8M82XGbSaewEUOPrOF8biN6jWVyAx4/
         hqRQ==
X-Gm-Message-State: AC+VfDw4tP/I9aUiCAHuuw4ru9Zgq8iR3ccGzRHWW970Egd+FHLepKRT
        hjRLMUr7y5055WnZuQKo3wei5A==
X-Google-Smtp-Source: ACHHUZ6iZUtgUFX6GHfndWo1pEqoTsBwjADAu+kP0CnIpbdZiLritZ34nsvckKEtzg9tdbYRiCZJ7A==
X-Received: by 2002:a05:6512:3f24:b0:4eb:46c2:e771 with SMTP id y36-20020a0565123f2400b004eb46c2e771mr4046175lfa.14.1688320251213;
        Sun, 02 Jul 2023 10:50:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH 6/8] ARM: dts: qcom: msm8960: add Krait clock controller
Date:   Sun,  2 Jul 2023 20:50:43 +0300
Message-Id: <20230702175045.122041-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device node for the clock controller for the CPU cores and L2
clocks. It will be further used by the L2 and by the CPUfreq nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index ba82b6ab899e..65065276c885 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -81,6 +81,24 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	kraitcc: clock-controller {
+		compatible = "qcom,krait-cc-v1";
+		clocks = <&gcc PLL9>, /* hfpll0 */
+			 <&gcc PLL10>, /* hfpll1 */
+			 <&gcc PLL12>, /* hfpll_l2 */
+			 <&acc0>,
+			 <&acc1>,
+			 <&l2cc>;
+		clock-names = "hfpll0",
+			      "hfpll1",
+			      "hfpll_l2",
+			      "acpu0_aux",
+			      "acpu1_aux",
+			      "acpu_l2_aux";
+		#clock-cells = <1>;
+		#interconnect-cells = <1>;
+	};
+
 	/* Temporary fixed regulator */
 	vsdcc_fixed: vsdcc-regulator {
 		compatible = "regulator-fixed";
-- 
2.39.2

