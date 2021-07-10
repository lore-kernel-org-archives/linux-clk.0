Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4845C07E9C
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92BFC613E1
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhGJBfs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 21:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhGJBfp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 21:35:45 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CCCC0613E8
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 18:32:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h19so17135ljl.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0H3/IhfxiYnQQh4KKn72LcaVRG7SSAFeeIagA4xcAo=;
        b=fd6JtjJmwsMIJAhK+Zn2EnRadcUGaMOz8HtfCU+5EqKqxVuOHKdzDXPeN+lUf2p6da
         NwI1W3jAX8fHwgj9tv5Yx4KfO07G8Mzv6ltCLDpt98nOQpBP3k6rCRF7cZX3MlMfsSt+
         jMJ4KfJwNYwM0gxLWuIykybI09eW2JG2Fya+PUYuSQcBITF2dYa3/GWl1O4ABaAqbleA
         VzPp+NptJiqU410m/Y3u4bsfyArCnx6wnkisvfzqHgRYfoMTZdBW9cw6dJ1MCpQjr5bK
         WH4PbHWfi9Up80D6Ihq+WaQl68BT6owWbC/NxZcHMf/kwkme8CV3M1BBnOQc2mtrZ7RQ
         8E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0H3/IhfxiYnQQh4KKn72LcaVRG7SSAFeeIagA4xcAo=;
        b=g6UUm25S5aB4ewPggkwkSeyVb4YMjpu3Eb+n0lnRyaYDPAiP1YL89+tMrkREhn8hyH
         7QK9zskuSAB4m5mkDm0DEBlHTuGgucsycnunl+lZLJNojal5s7hsWXARJWP1yzqsbXeG
         YXsbuRmsh0gzBSoF/8sPDsZJfOPcBPT715krEaczwFHv+WzetcxecxIS+xrYkXkn5+k4
         OH53EOKbq+w4EPEdif4k3eskk+VaiRbn3umfjxHEP4iA226J5t1Rrc60Y7/yAUyWbf9B
         pnn0n2gBJ381UkhRHYg9OEzSAeP4X4kdfJz0xnDD76rS/PcwGpoZXI0OR4bk+iNvW4RW
         Bv4Q==
X-Gm-Message-State: AOAM5309MSeM3r4Otqm5bMlah7dUZeQ6LKXF7RTcqWrME3vyelViQ5aV
        xurO0byJGx60uWbAKkbqIdA8pA==
X-Google-Smtp-Source: ABdhPJzYUb1wnHEHae2ODLu9t/zCnybfKtd/ij0LHh/JqdfCQjk1W+3fJYKRc4KfLQyJEiUCxBVTHg==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr4223128lji.201.1625880778334;
        Fri, 09 Jul 2021 18:32:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Sat, 10 Jul 2021 04:32:51 +0300
Message-Id: <20210710013253.1134341-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch dispcc and videocc into using MMCX domain directly. Drop the now
unused mmcx regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..2a468b85dc09 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -271,13 +271,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	mmcx_reg: mmcx-reg {
-		compatible = "regulator-fixed-domain";
-		power-domains = <&rpmhpd SM8250_MMCX>;
-		required-opps = <&rpmhpd_opp_low_svs>;
-		regulator-name = "MMCX";
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -2362,7 +2355,7 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2627,7 +2620,7 @@ opp-358000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.30.2

