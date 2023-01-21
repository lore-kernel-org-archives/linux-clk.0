Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE62C004D4
	for <linux-clk@archiver.kernel.org>; Sat, 21 Jan 2023 19:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjAUTfv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Jan 2023 14:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjAUTfv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jan 2023 14:35:51 -0500
Received: from out-244.mta0.migadu.com (out-244.mta0.migadu.com [IPv6:2001:41d0:1004:224b::f4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D167B18156
        for <linux-clk@vger.kernel.org>; Sat, 21 Jan 2023 11:35:49 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1674329150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gko113jOC9a2EwUmD2parDNR6d3vxA2nTyF78mHftxg=;
        b=H5xs/8BqLkR6xS0ZSMS8o67s0C3qCgO3z6C+IIO6GeifI/ZtaIH2T0B/zeP3VyG/osSKKM
        23N1vPBPSAP9V3g1jOXVHEO6oy4t59Srm0ajmxJKsF6BCQmtrGxuNnpfC7PVs+jWci2ETH
        gH5Wko+BX87WYeZ3Ggbcc9QiECczcJI=
From:   Rayyan Ansari <rayyan@ansari.sh>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rayyan Ansari <rayyan@ansari.sh>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 2/3] ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
Date:   Sat, 21 Jan 2023 19:25:39 +0000
Message-Id: <20230121192540.9177-3-rayyan@ansari.sh>
In-Reply-To: <20230121192540.9177-1-rayyan@ansari.sh>
References: <20230121192540.9177-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the XO and Sleep Clock sources to the GCC node on MSM8226.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index c373081bc21b..42acb9ddb8cc 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
@@ -377,6 +378,11 @@ gcc: clock-controller@fc400000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>;
+			clock-names = "xo",
+				      "sleep_clk";
 		};
 
 		mmcc: clock-controller@fd8c0000 {
-- 
2.39.0

