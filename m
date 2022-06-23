Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D4DCCA483
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbiFWMEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbiFWMEi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686884B436
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t24so20727358lfr.4
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4v06pir8BnrBBj0ls39eeym2+zaCxMALQgwSDSsGCU=;
        b=X555fxSbDxrZ/6MCXqe5e46ShTfmWHcALxDAYr0dEE+Imn2jzLWlbdqbTphVAWO2WZ
         y4VGGgiruzIXa8MC2XiayZz2q+LUTsBIZuG8YUEaCv+0MV1qk9VlG/BIdS4SzeSOr+5U
         iOp5Nz/xf76vP1bO2hNR0HVscCpZtlg+i4q8FDxDrURUfog6bJLdbr+1SZNvCe6MU89D
         qJ5cW7bLMlvMNTTdaY4z63rNH5GeM4amNH/1XTmTjLaCXwLifyP5dD5G9gqy8NCm21pK
         aOuajA5Dtns7XOx/aGMY4e1nevJ/cLys9/iMQs7cAhdqRt5OCdZdvl8ylkwgMgJQzGkp
         x7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4v06pir8BnrBBj0ls39eeym2+zaCxMALQgwSDSsGCU=;
        b=hAbQdNTsunG8VIgG1DbGGzb1MrUBZchnS9GRtOd441WjC1eezE1uRHO6gukhxFpyNL
         d/I1XHnaxYa7twCLcsu7Lv6fZKt6aEzMPj9NGz0HMzG4JPn4+TpN52wlZ0d33KGm2ONA
         wZyu3sLnCDYCdYC3bF355XCsa9YhsOD+IZS5B7eeTxOyPIZcACupX0gW9OrCUHNfzX/E
         j49UKV4COZ0DCk3AwPc+fOxILbNEKzibymKempc0FGYC3RvcwUUX0a+NfBvwPK7vqTry
         +PEf5ew6rienbGRbmBHsM3d0JqZwKMQ+qn+O7Lo82R9Dzco0FAgnxldN+Z6crSVUELxt
         OWAg==
X-Gm-Message-State: AJIora8Arb8QafdA/h+Ypb5ziftbg6E1dxwYDt9ayHZTd76M5QRsh/P8
        8H9omEgLb5sDmL55caZ/ZjBScw==
X-Google-Smtp-Source: AGRyM1u16w/dCwSh8ku2jFBX2Bo79H8keNAp4wo9dIxNAU9PbQpArZOt7sEcbqpxdXflkdhCczQlpQ==
X-Received: by 2002:a05:6512:3f1e:b0:47f:40e2:9fd8 with SMTP id y30-20020a0565123f1e00b0047f40e29fd8mr5398055lfa.110.1655985870502;
        Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.29
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
Subject: [PATCH 14/15] ARM: dts: qcom: apq8064: add clocks to the MMCC device node
Date:   Thu, 23 Jun 2022 15:04:17 +0300
Message-Id: <20220623120418.250589-15-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-apq8064.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 9ea279f04a78..87b92cb95e77 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -861,6 +861,22 @@ mmcc: clock-controller@4000000 {
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
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

