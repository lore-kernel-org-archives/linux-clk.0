Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B79FC04A6A
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjFYUZ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjFYUZz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:25:55 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441BDE55
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:53 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso16249661fa.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724751; x=1690316751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRhN5z1vU2RAXK0BYSOU9fT7Q2zkxmGWrbBmOJPqu/c=;
        b=QEq0MlSoDhCAgK7Ad/4bzzhE7sVEzWwEGM+g/ud1teYXtHZlgjUh/JmMpA609z5TEw
         d94US60qBZgOszxy+uxxiqG8UaVd27VGAnO1nQV2K19y8CGdG5iPjdsVuMYwYzoAw7Om
         UJdgMxtGqpCpnUUFaPHPQ6Ww5Y46enCG6KG5cptLoZl7c+nbAjja2cu9/DJtOPZGzeEg
         jw8cU3WwG/7O7QwomowSDBINedRaKhmo21cnr6EpwWu6tEruTZxKB3YxEevtDy7IpHHr
         n872IDfNr4Z5gWmilph7BrWvewu6bEqXApZG3MY7G3U79bxOuU9mGNBpNAsVcqBK2gu/
         zoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724751; x=1690316751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRhN5z1vU2RAXK0BYSOU9fT7Q2zkxmGWrbBmOJPqu/c=;
        b=ly/XRCl1lb0ICJVBfv8kW0xo5kmDP1/vgb1ZylqBNbndl/K2iJHJ9FSmGqOcVw4dsn
         gaUKPAGATXMCobeRtKfvweF1aMvMpwVeSo+VKrCjT4XN+VNyWZrUUDoLrNgaBKyYQfdU
         oizGQqfISb+0jQKDoEPDnF0IVH+jEf0KFNcnN7i0OZEm+CC6yWjXL35dMkeKx3Sz7YUD
         rXlRReW5u+ZmqHkX96FlOjlPoleV+/7gYLqVSjuK1QKtuhFznc+vBqjsoK75qx+MQdhW
         KEA7XGBsMGD+uKrjDQMVwNOhw5BLP0a8ZqWPXMKWTPa2Xi/EAlkCUB16EX/oNOhRZeP6
         5mrA==
X-Gm-Message-State: AC+VfDxU5913AOUkWODjk5EF7OcEDYejiBFYnTRV34xL+Oz1O06VB0mQ
        VBI3vYtGOZ+8Q0LlO+xz/gaV2g==
X-Google-Smtp-Source: ACHHUZ40qDwP1FylA6mHXt3RFgKjl1b/4Rndo841EDArO8bFNBKhDIw0wD1jFUK6fR/KiD7L7c4Sxg==
X-Received: by 2002:ac2:5b83:0:b0:4f8:75af:e917 with SMTP id o3-20020ac25b83000000b004f875afe917mr10801640lfn.41.1687724751573;
        Sun, 25 Jun 2023 13:25:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 03/26] dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
Date:   Sun, 25 Jun 2023 23:25:24 +0300
Message-Id: <20230625202547.174647-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device can optionally provide a voltage regulator supplying the
CPU core, cluster or L2 cache. Change the boolean 'regulator' property
into a proper regulator description. This breaks schema compatibility
for the sake of properly describing the regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 84b3f01d590c..a2d871ba8c45 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -47,7 +47,7 @@ properties:
     minItems: 1
 
   regulator:
-    type: boolean
+    $ref: /schemas/regulator/regulator.yaml#
     description: Indicates that this SPM device acts as a regulator device
       device for the core (CPU or Cache) the SPM is attached to.
 
@@ -96,4 +96,17 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    /*
+     * Example 3: SAW2 with the bundled regulator definition.
+     */
+    power-manager@2089000 {
+        compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
+        reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
+
+        regulator {
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1300000>;
+        };
+    };
 ...
-- 
2.39.2

