Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A06C49361
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95DF961107
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhFPOOe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbhFPOO2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 10:14:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C896AC0619FB
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:36 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso4224398wmg.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HGT2HeGVD/Jr+ubaKRB0o5Xpp+A7fNhogq7R332vnmI=;
        b=t2mViS9Vtqosgs7daQ2fKKMi/FXdC0XifEJyp0sfJTffXWO2D17cIv+7CfO2bVkq/q
         mJZcyb6ZaAm7sMilxYKBNW6mex0t+Nluwz+aaECrWK8A3Vn53e0o98pI12FQwjUJpnJE
         GhMSiVrcEEIF+JHy23Gqouz31tlByRGmAfFnxi55U9HtUNhEvF+JuNN7VpCOf5k0TQ8s
         lnC0F1yqUCuLyHo5hRdERlwCYapLtL6FTS9GN3BnjAWi+jyXDbTPsc4uZrQYztKd5iZH
         3wuCFr5COO+7s4hyUxPZtQ1K35mpOVBb6JsMZvrNYvvquqqCJDrBBrEe3f5H56SxO7RH
         gSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HGT2HeGVD/Jr+ubaKRB0o5Xpp+A7fNhogq7R332vnmI=;
        b=I4STt/cYGJvoTqzWiQh8r0lxk/MpgPDOnNfQ6FhQjQlsuONG1f3389jjfcVpYVB4t0
         R7nnq6p6ZMFt4UXS0/sRnwIs/vOJuuY2NI8YWqjFDfbMozE9jUQkdkYV6XJ47V+nnyVL
         ZxI7/+jub60pQukTqsSTHHBDMVs8HIA/UrRK+89KOZM1MuE2VeJJvIJYjExVBDfkQ5gR
         iHydy6VfYIRHGMhW4/6wreodWpZfJgun45C+Mw5YyrmDxvrXC2RAQ+CM383/msbpNyhF
         1YrqOpgsydWrVMLZNZ7pjd0G9iyVSe3PstdukT/Y+yHb07ATEBNWYszrdJnkXxlSUf5R
         9nqQ==
X-Gm-Message-State: AOAM5300JXt0ew0Y6KXfE1g91yc8v6i/mRdswjI8dtax4aJuhFbGA8MW
        JSNxDj5cIwmKTH+jDauaWBpnMg==
X-Google-Smtp-Source: ABdhPJyFWNyVm+TasYV8cmw/GbIneIqGSrxmWrnoQknXe8WibRp59S0EvU4S/167J/tCvrk05oKmzg==
X-Received: by 2002:a05:600c:3397:: with SMTP id o23mr163075wmp.10.1623852695334;
        Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 11/11] arm64: dts: qcom: sm8350: Add dispcc DT node
Date:   Wed, 16 Jun 2021 16:11:07 +0200
Message-Id: <20210616141107.291430-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds the dispcc DTS node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b270fb94da8c..76660d84f838 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2020, Linaro Limited
  */
 
+#include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -1298,6 +1300,29 @@ videocc: qcom,videocc@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			mmcx-supply = <&mmcx_reg>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.30.2

