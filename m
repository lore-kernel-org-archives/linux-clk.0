Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3D9C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 15:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378209AbiD2PQv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 11:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378205AbiD2PQq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 11:16:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B415BD4C4D
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:26 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id p18so9430134edr.7
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+4ICOXn1NGB+W/pvp37gYyyl9Rne1IW3j+B3PtGKuY=;
        b=tyXrIVQyP8BKE4Qeo30lYqIVIon4mWE2t5kV9pOrtLwaLoyHTez53dyMViCYWmHu7p
         x5a/+09Bp9WOjwDAVYZxss1lYvo6UC067Qq2x8L78yj3EXiSsCYgWYTImj6ryBEs8JTG
         0l9ey8acmSLT06FYVMfN8A9QO2gALRdUyT59vnF3VvB4JDdK9VFis9JiUm9YebGZCTp9
         5hGocKavutrSk+tOJiFP0CR7Cmlo3RvTdeZNREtG2p/5AHYG8/fW+WeozKwn8yWgvDrq
         /GF6RsUNoVg5pzTUaqlXLhHiAFDxlHdsvGeb+qyFN8gR3To5tSlcrihDE0yNR8N+9lMU
         4COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+4ICOXn1NGB+W/pvp37gYyyl9Rne1IW3j+B3PtGKuY=;
        b=OVTezJG7HNc1id4UVu1OjGCNM2XirP5IvdWGm32YnEB0Fyrd9T49OPsgTPIo/eGHhV
         S0X36oBv2YivlPqtZxVzTQjRt+p3lByd82vZXMGQGEvm2l3/NFxbKEfgc4BTZkl49Bt7
         LCMCFdymmSIbFuBLNBuKdZd2SCespoZla22VzXR6sgPav5sYNsMzR+30wykHxKWDj3RE
         ADMAZLvuEJskaPstq3DKoUB6OsVBzSB9aA82lQQXcsUIvR6gS4ZBXolb2wiMYtui6geq
         cxHQDOu+l4jKZ5l8HM92MtevVlFc4HFmdbDgVHS3RlEUAU5/P4psThmwx1M4n6w6MF9B
         86Eg==
X-Gm-Message-State: AOAM532rAmrIytt1xzuei02WBfQuGsvWpAbvEcl4jZot5fOj3OfzZFm+
        cAI9UlIss2AgzBE75t3Mz2Cn1A==
X-Google-Smtp-Source: ABdhPJw+elzBB9/MX2cnP6ewv0SbsAy9X4Mfsmi57vSFBLkyX4Fcklh/lfFAF3/6ySJ1aZFzru8d7g==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id i20-20020a05640242d400b004165caca9a0mr41834497edc.86.1651245205335;
        Fri, 29 Apr 2022 08:13:25 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 9/9] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Fri, 29 Apr 2022 17:12:47 +0200
Message-Id: <20220429151247.388837-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c49735d1b458..252fdef927cb 100644
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
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2533,6 +2535,29 @@ usb_2_dwc3: usb@a800000 {
 			};
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
2.32.0

