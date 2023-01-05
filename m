Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43066C53210
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbjAENlm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjAENlk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:40 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4282A33D5C
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:38 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b3so55084807lfv.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7X5RC/xt3ztwEpoWTfHOaHTrslfeBfNNQN9mrWDrY=;
        b=BUENKSe6EOHsnHRXqgMXEiaeLcUF8+hRbMqq/8KbXJ1zK2HKcUJsp/2P6VRhN/L9pm
         mMJvBCGw5D2/he4NVHh4ha5qY5wQTUZMZgZt5LQB+o7vk4uEiWXz5Z51KktQPtC0ItbU
         qvK534xjtxxHmQubtWZnHwRuvJcF7xV1wmR/eDJ0/jpyb5nzu1EdtNySerazgaZ0WhBh
         gNG79kipD+FvP4q+3mNt3IgaVKp8vVJfrngjDthQ0c5NeqME7o0SG0gg34ivvmt4AsUV
         LvWJPhbQrnbNVKpUKzMo0zXlLLOnj2Gi8H9uvm+rZqueFUAsFu3PCW3q4oMBK/eeSyul
         aATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7X5RC/xt3ztwEpoWTfHOaHTrslfeBfNNQN9mrWDrY=;
        b=N+PGfH/T1xuUu+cVv1dG/uXvZQFTsb9quTW0mOuVn5tLl1dRY4yh1K+egX5mCDwdB9
         AP7crxJ+vCNdNIELmYvq3HWj+eU3Krh7p93COnGO776e2FEU4O79N3heBNYdnw2Bt/G4
         BiZCe0VNpdjhjf6uSSwfmSDN/kiZAfzaBoCCgHGYjZrwBBBMMeBseXL+HjFPUfT7Fxaq
         k8Dp+fv5qifrADqf5RQ9X5F75wsC1ucgXKPOPC74C0VFejZyVHGN/zY44b2IDxmtikAt
         /TdmGhzfgHDGuVi/Yt/Y6JpKyhrsC4i97zn6g7VJoFyXh9mXSSqTm3KgL1JQxAJGKsr7
         XK8A==
X-Gm-Message-State: AFqh2konOtPKG5kkvz+EbK30J44ym4acXXo44HxozhQEny88g7xcSyUE
        B1JzkK+prz08ZWyixw9nc/xjvw==
X-Google-Smtp-Source: AMrXdXtKwoNfZpnEcWQpgFeIdcrYRCNNgRMvE8E/54uTkIvb3tWgt4IXZcOgK4JASLudWiGPh+IWjw==
X-Received: by 2002:a05:6512:3f1e:b0:4c0:91d0:e7ab with SMTP id y30-20020a0565123f1e00b004c091d0e7abmr15810791lfa.28.1672926096379;
        Thu, 05 Jan 2023 05:41:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:36 -0800 (PST)
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
Subject: [PATCH v2 03/12] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
Date:   Thu,  5 Jan 2023 15:41:24 +0200
Message-Id: <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on APQ8084 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index e6d17426e903..c7a3cca5b126 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -32,11 +32,11 @@ properties:
 
   clocks:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   clock-names:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   '#clock-cells':
     const: 1
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
2.39.0

