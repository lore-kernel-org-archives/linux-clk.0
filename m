Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D88C46467
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiL0Bce (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiL0Bcd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:33 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB2C2673
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:30 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y25so17825019lfa.9
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b23COTXaVaIoRrZxkSpWNQqWIRq23JBn94mfYoCafAM=;
        b=HJ17Wc4lKOCkgYj0EnLVU15dYXSI80SGUaAwUJWtlxppqucAqL3KynIQlAYCHrQx9+
         mtbcgxwt+DHskzVPrbbJsduxa2+04k1KJmRacBW9slWSIPZiSl6pNKnUXtril+6U1HWH
         5pr14iaLyS1X6gMqzzJWEtOUDyS8gy8EtzMKhzli8gFbdLyAvRoG9cw5MeETVzLH+35+
         K+dQS2W76ysyEh1IcX9+LtM52mtaqycDo9Pa08jovTEKjCbd5kh+/Uh/w+BPbGu/mV2m
         ju8L5+ovOV+xYFq13MLA3xuyzgr+m0QUSRPZbxMq98Twu/BdhsEkJ/gJ8X4c3eMZix5i
         KDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b23COTXaVaIoRrZxkSpWNQqWIRq23JBn94mfYoCafAM=;
        b=o2qYZKzypSza5eC0MBW/m96xRMIU1ANxNXJJj3Wtv5eA7Vs7LbvEGr2E43WRYQypSE
         /lwVDRuV9k1g316vqi7jFF5Sa17BMHaCoHFdqFXCOl/Q/LeUiX+MXCIGDzvLKrJd69Wi
         +Rpbgy7CfGZ9dmyAUQQM2h6B7q/x4GevPGxmwbt+FrIUw0n5Cg6GAwaF1KttgFHEc4fM
         Ewc0dCy9NlbZD5RB1geLjJLkCW03VDcqj3E2PjJzl5CLKcv+kD63Gr36qW5rNCGH7YSu
         p3Fk+VXhdpyEmKLYqr6krFZLsf28EdTuHSBzquyR+P8OdSVzESqRKu26zdKQiYJGA2QP
         Ld/w==
X-Gm-Message-State: AFqh2koJklUl318sCus+5X7nFNejNj4vo3CM0oGT0+wJ6tV6wWzSpcz1
        df5CqI2XjUzY98cZJOkWrFF9P/MMrUbXoZKcQEM=
X-Google-Smtp-Source: AMrXdXuOoM1SO5j8DVgm8SM7BhkZr7jvnYWrxDpa3FAvs27nn9UmpV7ZA2HjctCp2giWgoFHSbK36Q==
X-Received: by 2002:a05:6512:e9d:b0:4b5:5476:4c27 with SMTP id bi29-20020a0565120e9d00b004b554764c27mr7586025lfb.43.1672104748577;
        Mon, 26 Dec 2022 17:32:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC PATCH 03/12] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
Date:   Tue, 27 Dec 2022 03:32:16 +0200
Message-Id: <20221227013225.2847382-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on APQ8084 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index e6d17426e903..fd926df80c64 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -137,6 +137,46 @@ allOf:
             - const: edp_link_clk
             - const: edp_vco_div
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-apq8084
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: eDP phy PLL link clock
+            - description: eDP phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: sleep_clk
+            - const: mmss_gpll0_vote
+            - const: gpll0
+            - const: gpll0_vote
+            - const: gpll1
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+            - const: edp_link_clk
+            - const: edp_vco_div
+
   - if:
       properties:
         compatible:
-- 
2.35.1

