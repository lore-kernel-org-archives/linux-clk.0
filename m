Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8AFC4332F
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiLDMpP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiLDMpO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:14 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD6415A02
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g7so14587488lfv.5
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HnTKdcrxnAz+sb0dB5OHjDvQBTQAWcn0pTFeKRVRTM=;
        b=Sy6TtEI44i91cQC2gYhosDzJ/M09jQydFEWnD9EwbIaguVi73ppXsk62J/JDEazFsU
         kLMMVYCxi7KHbVauSMdpFxUNERv/Wuqim0qIeW2hFfQW7DxXjXw/gSRjeJNv4SyaEavq
         wUjLH6pcQYbxORkv8D79uVFJtaZVGhLyeTHc7Vob8TsYStUAgsPcxaaH9cGO7JEzWNUT
         EyOX3cbxAz/SNC6WQW1vPZDxzsOGcqZnhr0rjq2O1kWso0uvxw3ijcSTzzuq+BTrhPij
         A5pFHvpSpSry7KzeB8j0lJLZptUPDzqaIgu8Ajjha/RMLu9dIeqsCOrqosxtReSJiElZ
         uojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HnTKdcrxnAz+sb0dB5OHjDvQBTQAWcn0pTFeKRVRTM=;
        b=WLiIze0fLUySs8yNPOXLQz4nW4Sdj7GFtEmlsHAlCE1rLQAdMp1+hmhUD1ziOwBJBO
         D20KijGpuowAwpC6kWfSW09bfY82kMpc3rIBsYwCeAZp4VQFJNjcrjmSLkZKRiUjr9Tt
         7IgIwCLqoKwX5E7o2RV/9ZePEWgYyn9CdwAXnpEmf1PBGyce0SZDk5fBYvjdpCUSGBS1
         ijMxbiK6yIncBbRb7KxaeuCZOM5VxCwiR5WPsgSUBUTLDEI4Oyc6PTUsHAnROCtSj8N8
         6Te9oXxRvTU/c5HvbxQ12upYDFNv05GE/1AhNhFmd+CwoKfllDZX0yiYeKDE5oOnzn/q
         6PoA==
X-Gm-Message-State: ANoB5pn81FV7gMU5TbaZ2rzuPvfZ+db3Kh3YjcfZqmJQYpTnfyAan8kR
        TZpaZYKNh2H69Lz9FPmlr8zBZw==
X-Google-Smtp-Source: AA0mqf4QDUKO+cm/pkPRNLXSrrrhZxCCWpvzu3TyhvKhO2MeL9YBZ+hWP9KmOCUvKIp1ZFAnuJqtBQ==
X-Received: by 2002:a05:6512:36d3:b0:4b5:7536:41ff with SMTP id e19-20020a05651236d300b004b5753641ffmr265010lfs.292.1670157911546;
        Sun, 04 Dec 2022 04:45:11 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:11 -0800 (PST)
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
Subject: [PATCH v4 02/11] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
Date:   Sun,  4 Dec 2022 14:44:59 +0200
Message-Id: <20221204124508.1415713-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on MSM8974 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 7d034aeec804..e6d17426e903 100644
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

