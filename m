Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEECC43219
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 17:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiKDRrK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 13:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiKDRrF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 13:47:05 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D14209AB
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 10:47:03 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id k2so3513319qkk.7
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B76QcE1/cLW/pcKht8EMd2NMIgXAeFrVP9tClHGb9mw=;
        b=QKdI0L3xcZN7I6N+9krNHxAUHNhCmt4X9NwbrHH48F9ycDuFC/ryd+8Rz8LkFZEcEM
         2X94kbeR72+ukoHXFRMyQsD+cyNeG8jxm1MItKifmURNK/YKnFzdbZtJFrV8Wi+cUUkY
         daFJt3abSmR8y5Qt22lIFq3+THoUmL4/bdt939fKxCMP5VKUtNXB9HCrOyV7jv+mY4Ef
         z1izr0gXxC3o9XH1vKwu588CNqVk7qHHGjWN6vZlHOJiSw2qT/THh3XWlAue5xPiZFDy
         PMMgnbQ8q0nV9AwOKEq4ScD71xTs0iQ6aKQbvxWW+s6E+Mf9roX8+k0Qq16YAzcoHT0p
         TrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B76QcE1/cLW/pcKht8EMd2NMIgXAeFrVP9tClHGb9mw=;
        b=raSnpwXYwuJU1C8SYG8lBw6jS7RNj9kJ/YstSW8USU8k4ekNEGJES8QkwJHNVze2lh
         zl9EP7pz3NuCCHF9GjwrPRomgfb8zd3v1TAshVbpeZ4P0F/TUjDBiDrnDR1kUFMS2/cq
         t/FdVrNMXUNIZGOzCgOs3NYYGL2O9qi10G/wwqjbRwZ85xCN5bDYhj42uBnp1M1Et6Jo
         c6Uyq8QRmjmlVnB5QSeSgQ42N5YZQBe0PZNy/xY+r15HT7FLsypuMPzgg2Ic2uWSAgON
         aLAIDVFa0ZFpm1PG5WYE6IadiVxJPlBtojUddlZ4f+jWE7w8KaV2ZvYghDBoK0SdJkcq
         c5Bg==
X-Gm-Message-State: ACrzQf2JFyy5CdLbIYl/xBeBrlMnlHBmnNlRv90Zq6qI0sgVq0EO/uzX
        dKCHk+JwYnBsleiBM/4ji3IveQ==
X-Google-Smtp-Source: AMsMyM56w7jEpVAEYgRY5UQQmitJBjOa+UfOhdl9MY/a8BxJJKXM0raZmUTQtNgTrWlRR3y0x7YyyQ==
X-Received: by 2002:a05:620a:2984:b0:6fa:6636:d4e5 with SMTP id r4-20020a05620a298400b006fa6636d4e5mr10888890qkp.622.1667584022168;
        Fri, 04 Nov 2022 10:47:02 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006f84ee3a4f3sm3432908qkp.48.2022.11.04.10.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 10:47:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: qcom,aoncc-sm8250: fix compatible
Date:   Fri,  4 Nov 2022 13:46:54 -0400
Message-Id: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8250 AON Clock Controller compatible used by Linux driver and DTS
is qcom,sm8250-lpass-aoncc.

Fixes: 7dbe5a7a3f99 ("dt-bindings: clock: Add support for LPASS Always ON Controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,aoncc-sm8250.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
index c40a74b5d672..59b0d3f571ef 100644
--- a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
@@ -17,7 +17,7 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-lpass-aon
+    const: qcom,sm8250-lpass-aoncc
 
   reg:
     maxItems: 1
@@ -50,7 +50,7 @@ examples:
     #include <dt-bindings/sound/qcom,q6afe.h>
     clock-controller@3800000 {
       #clock-cells = <1>;
-      compatible = "qcom,sm8250-lpass-aon";
+      compatible = "qcom,sm8250-lpass-aoncc";
       reg = <0x03380000 0x40000>;
       clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-- 
2.34.1

