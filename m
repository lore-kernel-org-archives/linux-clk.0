Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF9DC54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbiI1PA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbiI1PAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14F32F033
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:03 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bu25so18900473lfb.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qM++dOOdxNq2arb6uMckrS2brFOjaJGV3RM2kNir3B8=;
        b=kO4OdXiaoIFCxO3qD8o2DHgPuB6DOnejXQhxA0lKvO4OTLdTS9lpVMnhl8qU9FUbrK
         q3ofJjqcy+1+F8stypHzRnFvrzJn6YDjlgQ2jpD/+UuINqPqYAJUkvVbXhP63u26z81f
         Gi1Uh3yh7DOlVz88Mb58kbeCjCYqF6hCoeH5o8tPosPW2qg2KMHgvpIuOyeLQnOjA0gX
         rU4cHTOCi8+7gtT7s74cWb1A7mBah+JMW82Aeb7SCoHd0Wu1sSlg6Wf9XflMeq0oKbW5
         yuV/UXFGuTVak7p6h+JJoJVmagTtFG20s8lUJE/j+t+IXxhJbGMDxYfxy01fdXtr0BwH
         z5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qM++dOOdxNq2arb6uMckrS2brFOjaJGV3RM2kNir3B8=;
        b=Wb8hQokegLFbWIn9zrujqXCn5PRROjg8JR7C06Z3YwaQLCH7NMZozw7HU4XDcAqgdx
         ZaT58mUSJeoy6GnqkWl2kLcqEycaXG4VpOfy6PVhZDJK0Y7kpvtGtqo45JCXAaZAejPw
         buIN9Ty0/TqM5BcXREfyMf/LnP9cChohJoR3jzifDG53xj9nJHdLykV/TVzfCss5Y3/U
         +JhTQ1KOW1Ia+XHtT5oGiLqCj/IuXzurKlCvLUpsQThI2hvuo86LMI67eUkldmFj50s4
         c8ej+p8NU5ikKsx2o8ND2E/azjBmrNY8wQgUwKIQOAdzjE2hpicpJqwLjYZp4qXrFmFc
         uRGQ==
X-Gm-Message-State: ACrzQf3t12USwWejkzIkZ0X28bkYiKaL3/4hqUPmvDIinQ2yw2r3WVl/
        RLdGT9BVaiwIytVabRvT+rOldA==
X-Google-Smtp-Source: AMsMyM5dvqccT2NsgQuQ02tsXZBfzXh7YPjCAI+YQBt0m87zrJfxxKh4u4SnBtrkt2BRBlPDpDkrBg==
X-Received: by 2002:a05:6512:cd:b0:49f:ba50:ec6 with SMTP id c13-20020a05651200cd00b0049fba500ec6mr12861483lfp.654.1664377201324;
        Wed, 28 Sep 2022 08:00:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
Date:   Wed, 28 Sep 2022 17:59:49 +0300
Message-Id: <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on MSM8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 03faab5b6a41..78473475c68d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -99,6 +99,44 @@ allOf:
             - const: dsi2pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-msm8974
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 voted clock
+            - description: GFX3D clock source
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
+            - const: mmss_gpll0_vote
+            - const: gpll0_vote
+            - const: gpll1_vote
+            - const: gfx3d_clk_src
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

