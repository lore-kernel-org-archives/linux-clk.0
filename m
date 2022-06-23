Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD5EC43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiFWMEZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiFWMEY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720154926E
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c30so23019246ljr.9
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eLo0cmj8iEhVelCOHSSbw79s0qehpremV7AWxy+/lLQ=;
        b=tcTGwolRBv0D4qD9ejpmCeDs1hoaOeSmTcyx4lu6JHFxpbx4pM0D2TZv/6vemKt2ga
         jed1TsXSemb7bDoHCe4Uflr9k1oX7vMkFRG5XSxrSxFVfB/MvughH8zna/mCK4Xemn9c
         omUbRcPyySluNVhjn5tvH/PrIaHyT932/S+k49hRZa+V7Snbc0dGa4nzImRoVFQBuk8G
         GRQPHKKy4DQW6QTAsVo2XbV6uwUN4YXJWW9N/v5cre54uIwuw1h7MauVgW3cmlzJlmwO
         FIhqPkkWi5y+hb9tSL2BUS4z2FEFJ6CBusFgTOqEr1Ic8LGPfPKudT6Wm6gbWCOwjp+k
         jDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eLo0cmj8iEhVelCOHSSbw79s0qehpremV7AWxy+/lLQ=;
        b=BQiGWaJTE2uFACOMgW3diFN2uOWkssuLkzaUSu9U1BgAuPVTTjgSyQU8b1ZaAOm2hP
         R39V0J+PLtBBGiGv8zoshq/IARELfpI9zADsxo4+mXywmHtmR2bGho0YS5rH3BdmboAB
         9f3ubV9cU5nCvF/CKTDBGiz2llPro+iuIsGPhngGpBJFgClj8kfRqvCCESeSblcDZ/pI
         0Y45a3nSuwbIiL23Zsx28L0SgOXbB8Jcn9AahiE5ukb4OIvxV/aIFvvT1VVhMD3dXFH2
         LsJX0ElG2xcFLzBjSMtk7dFmKcfmkq98HcptcJ10lgr9aBU5SY82bq+2gYyat02efN1+
         DleA==
X-Gm-Message-State: AJIora+vVaeZv23OXHJFgtzzS+5Zf+Ds5G08lruflm9kEvaBcU7PtgSY
        3EMh9BWxhf2VHaqxhfLB8IPJUA==
X-Google-Smtp-Source: AGRyM1vhm4tEf25uqRF7DTxCNaFF4kdl9eUiq3K6lXVVrAMG+iaWY8gJoIKfW0f0Qeatk1pBR+Wsyw==
X-Received: by 2002:a2e:b6c6:0:b0:25a:93bb:f801 with SMTP id m6-20020a2eb6c6000000b0025a93bbf801mr1502777ljo.489.1655985860818;
        Thu, 23 Jun 2022 05:04:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
Date:   Thu, 23 Jun 2022 15:04:05 +0300
Message-Id: <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on MSM8960/APQ8064 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index d02fe6dc79b5..c13243682365 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -82,6 +82,37 @@ then:
     - clock-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-apq8064
+              - qcom,mmcc-msm8960
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board PXO source
+            - description: PLL 3 clock
+            - description: PLL 3 Vote clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: DSI phy instance 2 dsi clock
+            - description: DSI phy instance 2 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: pxo
+            - const: pll3
+            - const: pll8_vote
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: dsi2pll
+            - const: dsi2pllbyte
+            - const: hdmipll
+
   - if:
       properties:
         compatible:
-- 
2.35.1

