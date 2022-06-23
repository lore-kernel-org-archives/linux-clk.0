Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0CAC43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbiFWMEq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiFWMEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:41 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741B74CD74
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id o23so15904939ljg.13
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ZSA6xHQZ9aqASlGuBjY/Lc+K6EWssVTLnudC8h7Ugc=;
        b=jEPdaVuSYHVAXI7PQcfhMs4Y48HYVRpwDx3OONIo7QHh2qHN6THTxsy+0wO7neM4QW
         lSbhb5hAp+p/xUydOV8w+tOmQUkPGz50ayN71VkENvO0xhls1Zy+D64YB27CTbuBjTb2
         tCydXhELrmdwaNphsLdp0bXh9N76gERgiaDfGKgM4anRcgHCMlrAXODA86MxZDFlh/Ky
         hkBXBMDLzPTiRzOxKZJaiZukIbfEI2deubmkajDchSWwVGyN0JnDMNOHMKag2/Iiaon8
         eh+qRooEG/E1BlNqWRUW+wIpholTv8Xldpm5Bt/wB3ADYORn1cT3PoIR4Spkroa7o/6/
         Ev4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZSA6xHQZ9aqASlGuBjY/Lc+K6EWssVTLnudC8h7Ugc=;
        b=fwNJICf+Dx7NOPqnJg+P2fqB2ovEH9chLZONgNAZeUzAjjLOplSH+L+MuRjkkCYYzk
         KyZS080JH8hvPy0k3TYur37+cZenxxaNb61ubPn1OEBtFFi5YHEha9YejYLBBfgbgf8B
         U0IO6a6/ZzUE6zgd1geotUSFR2G3EViroB4NmYse76UC+AUYBaB8SkGMkquGBgR1wlGh
         yq7y93D8TrEK8DFcCpUF8eTDE5CdYk1X2vL9gYrmEmwADBuxZvD8RW2m1gqN5yfZgCmW
         Vt2LCYnChL1MV80i9OtmQcdAfmJ+gOGlVI5qzvjkAzYlAJ+WXz6GcqK6bvelKaUmVISd
         u+HA==
X-Gm-Message-State: AJIora/BR0RBTZHRNAseBvz/VSzh7puT2GcuzBTg9hHv136fEyrL9tSq
        1lyW4Lx1gs9WNdG8PyJ26WR2yw==
X-Google-Smtp-Source: AGRyM1vyTttTf9/+DOHZEFqBUI8Pj1xvEChHdF/WQ4rT74eb+M5p7WPr4E+2gOh2gRvp14Eyf/lSGg==
X-Received: by 2002:a2e:a78a:0:b0:25a:8c6a:f3c7 with SMTP id c10-20020a2ea78a000000b0025a8c6af3c7mr3421276ljf.218.1655985871235;
        Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 15/15] ARM: dts: qcom: msm8960: add clocks to the MMCC device node
Date:   Thu, 23 Jun 2022 15:04:18 +0300
Message-Id: <20220623120418.250589-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index c7058da58be5..b65659801b6e 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -164,6 +164,22 @@ clock-controller@4000000 {
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll3",
+				      "pll8_vote",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "dsi2pll",
+				      "dsi2pllbyte",
+				      "hdmipll";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.35.1

