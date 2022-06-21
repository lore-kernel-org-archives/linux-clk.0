Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD7ECCA481
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 23:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiFUXep (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 19:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355060AbiFUXee (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 19:34:34 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E3030F5D
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id g8so13857486plt.8
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ViEFcKjroQXvwBGepxaEQeL4Q+Xf8p05t8vesOONSwM=;
        b=iOIeFKS1PDNNnEKTQ8DM/+fsNaaVzzQfZlWTkM4SC+6zPlpmnT9VqwCHD+OtHDxbS2
         f2UOsP7lPVsfJbYwLAtil9gq2RnDBR5wcz81MpZntsQ555etBAmE+LbxT6cyVnApN22U
         BxngAJICMfBz2+EqJOJgVogunEW0KBlODrekdbqrcAgBA6SSKOuA+PEelKLKvMJZZFmg
         /7gmaYjRfWExSJaW68nQmasr2sUgBKcDiAvoh8JRnI+/Hq7BQ02tJkHeVQcI3hd5kYF8
         AWPF9ppLjp4a2UTMZqD0MdLYMwjmzz/oiCuiu+U8G5t8EwfQvILbyFD3q6Ikw+21yZXY
         dCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViEFcKjroQXvwBGepxaEQeL4Q+Xf8p05t8vesOONSwM=;
        b=YgJtejtKeDAko/6+lSctIw83ntyxxbf5YiAKo1JsRyoR/1o4X0mb87aGQqf5Nw7Wkg
         LRieb2p9Wrodcue4Evf2s4hluSDwyrP7kFDEAWoNynt7/5752grjkkEnESuBW5U+Ex+f
         NQv3Gyp4i8a7FhgYFiRYjf96DBn7agFPhvgDG0QRyrao7P9hmporg3JEmPNVB6Nye91z
         CTxxhARdpprTZNjlqU3UB+xDnwkWqxvUed2PJaCK5qgtHCFkkF8cul8DKPZaOZl30dRj
         zSYYr5iNxptSDli1M1sKV3JWPT+w0IOlLYO1WhQScAbhTZDLtNC/wFbobB8ZAXX2ua7A
         9jqA==
X-Gm-Message-State: AJIora9MasjtI1RAZ/EWGO/JuCX3GXFomCX13aMJinh/jCa+8sUO7hmS
        uUCEyWZwjrebmoQBZl60FTHvBw==
X-Google-Smtp-Source: AGRyM1uA3DgDswAU+ttXuWuvTdwhYhitUaUKJz7J9lYdhqUCo/NT6EpS1MtC/WtMklbduEikCBvKgw==
X-Received: by 2002:a17:902:9b83:b0:164:59e:b189 with SMTP id y3-20020a1709029b8300b00164059eb189mr30449024plp.91.1655854465221;
        Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm11297873plk.3.2022.06.21.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:34:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 6/6] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Wed, 22 Jun 2022 01:34:12 +0200
Message-Id: <20220621233412.506768-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621233412.506768-1-robert.foss@linaro.org>
References: <20220621233412.506768-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index

Changes since v5
 - Revert .fw_name to .index change


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52428b6df64e..99464cd1299e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2525,6 +2526,31 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
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
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

