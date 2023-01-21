Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58763C25B50
	for <linux-clk@archiver.kernel.org>; Sat, 21 Jan 2023 19:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjAUTfw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Jan 2023 14:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbjAUTfv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jan 2023 14:35:51 -0500
X-Greylist: delayed 599 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 Jan 2023 11:35:49 PST
Received: from out-142.mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E441815F
        for <linux-clk@vger.kernel.org>; Sat, 21 Jan 2023 11:35:49 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1674329151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S77AubuYa5OrTV/jgUtcL1ihA4inmRuRojyuL5xTg7c=;
        b=VcUIKAbCCwF76lqPhKxnzahYGPvIJyilHWNo7O/tm6XMF+3uSBVNSoRIx1uhdSKCPa5aIk
        JFPl1n2B5KZalZ8HsM9Pgv+SI0QAPqRgGsxF6/E7iChTcmBsngbb0zoz7Kju43RAeuovck
        5iw9qrtGGzbN57YqEx743rww1KTVv2A=
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
Subject: [PATCH v4 3/3] ARM: dts: qcom: msm8974: add correct XO clock source to GCC node
Date:   Sat, 21 Jan 2023 19:25:40 +0000
Message-Id: <20230121192540.9177-4-rayyan@ansari.sh>
In-Reply-To: <20230121192540.9177-1-rayyan@ansari.sh>
References: <20230121192540.9177-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change the XO clock in MSM8974's GCC node to point to RPMCC.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 834ad95515b1..31e9721b571d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1057,7 +1057,7 @@ gcc: clock-controller@fc400000 {
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
 
-			clocks = <&xo_board>,
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>;
 			clock-names = "xo",
 				      "sleep_clk";
-- 
2.39.0

