Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C8EC7EE25
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 12:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbjFHMxl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236610AbjFHMxb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 08:53:31 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7763030D2
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 05:53:23 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso3660215e9.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228802; x=1688820802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkiJ1lamn9YAQsXMt6pIlRsr7SwfYoQpGX4MukexgX8=;
        b=BgicEj6Y6pHyifovoeJYIwtjRyz4IJdqnXuKHyHtL33sDLVoZ69dyXsvzn8UH4UXwg
         vwu8iLE9Ggg/g4ILZ7CedeK3a89dNaSE/lyBEhwASMXH0/LebsirfFnEabQT3ZB0vTfL
         Jrms9O3kehKrHbvuNx94J7uXXfRDfnN6r6f8mJZuKhul8hwy3yNmcGmCLgAlDNrjgu8q
         y+dtMqOotVcfyClTxdCwKQzPnaxSNoJjhrP9CseXPpVwHuIAg8mBnMQBLqxjiGUn7kWj
         GMUBSJ8I2eYVaHCIK3d4JP31JIskvk8l437ygt95GQqhG2fLv0K1l9SUXnLNRwKKmlhY
         Bw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228802; x=1688820802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkiJ1lamn9YAQsXMt6pIlRsr7SwfYoQpGX4MukexgX8=;
        b=QAgaYbwMJYMsk6lVMVASXsMwUqJPl+TSzXbcuJRm9WB9zvLSE1w6MBfaM33gd8z9+p
         PzjDXP99PfxFzLbwJ9cC4vvpyDE1k6w6FtU0IXyXbl9jHQMp0CYNP6UDQYinksNBywgW
         T9HLCqtkEE3MT06udBtCXtYurH6YpSuWOjjJcK/e21NXY2SfVFaSSeoHxB/Il5qR6BFV
         eyggoOeq3NDZFufjfOx+VJ3ofsHb17rz27MZ21TT193XPofRHOaAu5X+SN400iCscO3e
         qNzqoWfOyCPhWY3gRFJPszLeruf92wTfozu6vjbDTHJv2WlvanHZhcU9zaQdYj+ecVwt
         mXLw==
X-Gm-Message-State: AC+VfDylCkrztpvscBuhi/ewknGzZOAv0lBGxnCvwpbMpYa5o1/BB4Lh
        Yxu0dgpYapwMoA1A2Bkr+MZfjJspukGn0f1c6f4=
X-Google-Smtp-Source: ACHHUZ5eKXHzmzk1Fq6aUUpNwytNXJWMfefzfRRRgMtxfFlW9k9gLinsbokDwFGgwO0R5df/7RTtjQ==
X-Received: by 2002:a7b:c40b:0:b0:3f8:1a:6b9f with SMTP id k11-20020a7bc40b000000b003f8001a6b9fmr272735wmi.2.1686228801988;
        Thu, 08 Jun 2023 05:53:21 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:21 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/6] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for SC8280XP
Date:   Thu,  8 Jun 2023 13:53:11 +0100
Message-Id: <20230608125315.11454-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml          | 10 ++++++++++
 include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h      |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 047cae91f443..3326dcd6766c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -19,6 +19,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc8280xp-lpassaudiocc
       - qcom,sc8280xp-lpasscc
 
   reg:
@@ -39,6 +40,15 @@ required:
 additionalProperties: false
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,sc8280xp-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
   - |
     #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
     lpasscc: clock-controller@33e0000 {
diff --git a/include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h b/include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h
index df800ea2741c..d190d57fc81a 100644
--- a/include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h
@@ -6,6 +6,11 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
 #define _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
 
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+
 /* LPASS TCSR */
 #define LPASS_AUDIO_SWR_TX_CGCR				0
 
-- 
2.25.1

