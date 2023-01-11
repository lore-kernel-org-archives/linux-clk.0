Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBDBC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 06:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjAKGER (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 01:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjAKGEL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 01:04:11 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942DA9592
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:07 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g13so21941414lfv.7
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI1IjcklbSGHdzMZQLrZQtp9sC0C8UYZ9TXhuVnVOeE=;
        b=UvNrwS1nE0zTNCKfCLOucEvCCNbFqK0zZ8jGnubOy6FYoYLOXpAexb+SXEbIuQ/mSN
         c9dVXv40vZWK6VKYBeJytoHqSjTw5y7byscETmHX5H/AhUJvNO4Vn685Mtszz5TMt8ZT
         lbjrn48b9lkMj2ZpNaOgWEBKrOdTJW7tH8OM+Pd0THftQlO7M0YogR+enWFbvWi8JioN
         TOUYAgtzfSIw3AJ0ns9WXfLjGZAxay0dLZHMQ7tSmvCb6dT9tqj6RannwOdPmkE+U/6D
         pbTQ6NFXULUwXd0VzcSfWNDqi5Vtgc6fgbBGGKKWOTelgki3u1iO5dzy5/zzKk7KpCf+
         YhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VI1IjcklbSGHdzMZQLrZQtp9sC0C8UYZ9TXhuVnVOeE=;
        b=rGs+AuO0Ggw+ZJIcRJ/+soADQ0iXmRzHDTVHcLjWDYIEWhpS8k8iuc5LjA4vjidx2G
         8/QvZmZsuVvUdrDoaLPJtLA8L2mEljXH55WYc9KAwLC5VX37swkvWynHFHnQ9FDyrsGl
         LB3UeX67LHLgMFh4N218CupajlfJPy90smk6nQR8M5djXbOg3hd5q8nKNlMdnUrGoH72
         yXnO4HuWzwLO8zx74Vh/7UNyS+ORJeVGY4gqBZwo+r9yYlTP5xaOM02aWQpeCRYYyRPU
         BuEYeU2UyoBPtCuhndqoHeZ+Q2FmQdnEjkbK8xapLqsrIHcq8brwiZK/KAPhPzsHsHQV
         uOrg==
X-Gm-Message-State: AFqh2kpkqQUkE1/VERiioPlemFWOgyffyX/sPqZlv2NxblqdRRmsNMYk
        hKogmq6xib4VVyxYv9CIg26c4A==
X-Google-Smtp-Source: AMrXdXudRo9G46nQq7ighKR3srBHJMPiYkzlOrkLLk+9ANLddeq20aigTdp0OQJWJ5BEf636mwwcTw==
X-Received: by 2002:a05:6512:130f:b0:4cb:654:5337 with SMTP id x15-20020a056512130f00b004cb06545337mr2539738lfu.49.1673417046012;
        Tue, 10 Jan 2023 22:04:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:05 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/12] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
Date:   Wed, 11 Jan 2023 08:03:53 +0200
Message-Id: <20230111060402.1168726-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on APQ8084 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index cf04d791093f..acf0c923c24f 100644
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

