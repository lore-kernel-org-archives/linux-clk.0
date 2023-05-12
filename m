Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9449C7EE23
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbjELAch (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjELAcg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1FF59E8
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so7580245e87.2
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=fkMyWui9qjhtPN3UucqAj0YDgghgrr7ix+K6WBtwGUceg+JTjgwZf0kFsEUDhQTmB+
         slvZ0dv8xZEOhDXZvZggMIDjv7ECm7yozeC17rIBrcTeFcZX/taGr122d3qJNVcsYEli
         oWnvmn/tgmko30sV5mlCWFfp7Nqi7wvm7SSBHaGUlSfL2YZGDyZSsDK8LIrYY2r0aI+v
         y1NEZr9Cdfu35HCjOBEHoyAO8Tfx/q6L0PwOqsza8z7NV4hpvxNo3XZofrm83nHQOgT7
         uTMgvMOaKUCyJxC9DtBLEQ7x9v3NmoWJ6Ak0a0VNCysLFdSscxEnEne6RRI9Nhm7/Kim
         /AZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=TOxsMEOQqGO/oEKDU53bzC7E11pIVY9j+kRlxkF+OZgHelZgtsBugm+gr0mCSQMtdz
         t2yxE9BWiZclcyVG4uevzsl5jzOFBRT/L7uaUSIFhjIY7bZHCqvpVZL7V0vNmSJtflHE
         VsUTGQ5jwHN7w1idk9vLxb4aGZo5lj9wFKT/xWwoTGQR0EPHi/F+t1rgKouPN9Onq468
         PloOLO6VV/esMIDAwO+M+4dHoBMcDBr+gScPEU+Dvu9Dc0JNZFRNdBlvrNWJc4c1ZIVS
         PV0o1KFI3RQ+EgA6oL7qAHveDyXt0VnXOUC33K/Z9AZBbyDUuhSW49JG3tG4jPBBtjvC
         euDw==
X-Gm-Message-State: AC+VfDxLEkXKkNpdAGRda97GYtEk6wQ5m3NQ1ImwQHetHhGQE4E5ckLI
        JC7/PcCOtxbqFzlycezqx0+HlA==
X-Google-Smtp-Source: ACHHUZ6s7Y0KFS2o3h0R8qGGin1sTFHn0NyW1jVuQeQQDAHY9SEThMUg+YfbmkchsoShgGIEG3R20g==
X-Received: by 2002:ac2:4a75:0:b0:4f1:444e:6c5a with SMTP id q21-20020ac24a75000000b004f1444e6c5amr3023901lfp.8.1683851552416;
        Thu, 11 May 2023 17:32:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:32 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: clock: qcom,lcc.yaml: describe clocks for lcc,qcom-mdm9615
Date:   Fri, 12 May 2023 03:32:21 +0300
Message-Id: <20230512003230.3043284-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Describe parent clocks used by the LCC on the MDM9615 platform. It is
the list as the one for msm8960/apq8064, with only difference being
pxo/cxo replacement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

