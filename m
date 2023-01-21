Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA7C25B50
	for <linux-clk@archiver.kernel.org>; Sat, 21 Jan 2023 18:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjAUSHi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Jan 2023 13:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjAUSHh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jan 2023 13:07:37 -0500
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CC78A70;
        Sat, 21 Jan 2023 10:07:36 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1674323940;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SshiHNjLh4suJfnrPV1IW4d4G3gE+WdOTlE0ZcKJrqo=;
        b=lLn34I2aHKBHqd3epikBQ5TpiZ7dy4x98ofnzSSOkz04Bq+ltS5U8XiQNjjrLxAcy+y1vU
        lk8nA2eEon3PkLNUWKn8dsEgl1lWoUojgW4Sm0IKjHnDq1rUTq3mIaCg8Oz+9D1ky0UT9g
        qA+IKeKMsSTMwZ3h97jUxPLQX9Z6pkg=
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
Subject: [PATCH v3 2/3] ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
Date:   Sat, 21 Jan 2023 17:58:36 +0000
Message-Id: <20230121175838.755636-3-rayyan@ansari.sh>
In-Reply-To: <20230121175838.755636-1-rayyan@ansari.sh>
References: <20230121175838.755636-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the XO and Sleep Clock sources to the GCC node on MSM8226.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index c373081bc21b..39b0ad7cbae7 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -377,6 +377,11 @@ gcc: clock-controller@fc400000 {
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

