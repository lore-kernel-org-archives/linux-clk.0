Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D4C7EE24
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjEAUeI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjEAUeH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309FD2693
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4efec123b28so3963889e87.1
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973243; x=1685565243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3EsAWj9dP8IUk71au9cQSRbwH/Oh0w5YOlr/cVzUIs=;
        b=uudomC2tQ6u0Pq3iagtAIzU6uuatzORVCmoU84223IfPl3JHdpzg6ZClxMfWkkeStF
         KPlxE2TVUxikWW5BkMIUy++Wz82g0Zuib8Gt7j4Y8I4xBMdGLu4/Vyp4KvOHYFVhqSSL
         IreDEisHuZ8q5vUeM22NrtgJ66GoeImic6hQIg0r/ePof3/AhRyKaBaI51uxQT5baomg
         mloaTQ1KxiOAuZDt9oqWAI+lwrFYg4g/oUeXgBws8L0IMtF+jSaKI/RMEVK0Pzl03Zu2
         cTcii8qShPApgbNXh16smCxyStDx1W7zSx93oFc8yt2XZ2YhrAo1OxNn9R6/YBrtlw8v
         XVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973243; x=1685565243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3EsAWj9dP8IUk71au9cQSRbwH/Oh0w5YOlr/cVzUIs=;
        b=lw1FgZZQDKWWLt1GWs1mueBpa9Zz+HIu7wZqi0SjOoOHuVHshZdHxRdvqSCg/yQ7Lu
         4Vurlx4AC85zcbJTdNIbksB08fpF5B2biJqpk6DUBuUw2dTarcRrqkGDrgBEtkMUfm+f
         jCuCSdkZmm84AdGeS4sK/0ibLBqUaj0Y6/CTQfYdFeVukP3fB2P0QF18hRmKstk31i7t
         PwyagPKzeD2gDbBw9l36T+Gk+rc10XprH/WIPPYitoCXfn/hPYc53cpcbK5FOG4wUY2N
         pDI/of6juO9NeadJTNaP3FkC98yVt4CRDGzT7XEFJyu9lHcvgvYguTZ73+uCtxbeNfTR
         Te5Q==
X-Gm-Message-State: AC+VfDwAiCTfH6Ayi+VovI1F6+pJ/uOVMMMsJp14y5S8VeIeJfQUPPTf
        AXOffZRiXcvQgFSB/jV/DzcnLQ==
X-Google-Smtp-Source: ACHHUZ6coxt6m300xK5kmMfvgeaZPlg/GIwzhpZKCDCYPxC/Wl24dMwHprCk/GYX++274/wYPSa1eQ==
X-Received: by 2002:ac2:4c1b:0:b0:4ec:9fe9:fea9 with SMTP id t27-20020ac24c1b000000b004ec9fe9fea9mr3618712lfq.56.1682973243470;
        Mon, 01 May 2023 13:34:03 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:02 -0700 (PDT)
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
Subject: [PATCH 01/10] dt-bindings: clock: qcom,lcc.yaml: describe clocks for lcc,qcom-mdm9615
Date:   Mon,  1 May 2023 23:33:52 +0300
Message-Id: <20230501203401.41393-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Describe parent clocks used by the LCC on the MDM9615 platform. It is
the list as the one for msm8960/apq8064, with only difference being
pxo/cxo replacement.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,lcc.yaml   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
index 8c783823e93c..55985e562a34 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
@@ -76,6 +76,40 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,lcc-mdm9615
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board CXO source
+            - description: PLL 4 Vote clock
+            - description: MI2S codec clock
+            - description: Mic I2S codec clock
+            - description: Mic I2S spare clock
+            - description: Speaker I2S codec clock
+            - description: Speaker I2S spare clock
+            - description: PCM codec clock
+
+        clock-names:
+          items:
+            - const: cxo
+            - const: pll4_vote
+            - const: mi2s_codec_clk
+            - const: codec_i2s_mic_codec_clk
+            - const: spare_i2s_mic_codec_clk
+            - const: codec_i2s_spkr_codec_clk
+            - const: spare_i2s_spkr_codec_clk
+            - const: pcm_codec_clk
+
+      required:
+        - clocks
+        - clock-names
+
 examples:
   - |
     clock-controller@28000000 {
-- 
2.39.2

