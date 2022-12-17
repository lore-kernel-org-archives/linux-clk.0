Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55E1C3DA7B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiLQAXd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiLQAXE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:04 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5297C3D1
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z26so5868405lfu.8
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q26N2ebdHjSmg6lFwMPG3I2+MVr4zlRoPhhTX8eU5MY=;
        b=JgYP4a6ZJXC1F5QlDGnPywq4VKhVW11fGsJNB9fT8TM0ABhJGDoM/vhmCzKf9E7ksb
         6q8bkVUuOMBXm1//4akLW1ndclg25kjr5mC1l7nhhy8myE5avMzAqSVzovRYkYkF7bn1
         aSRJcJO2xzSoRqSv2VyOTVGgMNl/PMzjAOkydT2WYntLTa+279RTs96oG6nzVB/PGDOU
         VGWh0A/EWlrovKROzjUED1tkRbneMSQ0drADcve0z5bvmJd+K7hbvwbXYGh5qGScQony
         0rs4SOcejnjZ7JqKt64tHyNasCQrIMGOqw223E5g2AkUY290LP3vrP74fG/opD/b9jIj
         LdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q26N2ebdHjSmg6lFwMPG3I2+MVr4zlRoPhhTX8eU5MY=;
        b=HNdn37PUAsMzM2dUYmlIjw/AK2qks+r5UixmmAf9i4VCh5wkyKL3f68FlTuadkurcz
         37wy5RnGbh1p/V+ad6SOiUk8gNjgs3zbmO8pvdTFtUhW/OJns2dZ26RlvAGxmFHiQk7J
         d7sKy3u57vYwyMHKasrbgzbwmSAiMYLw9fdgMxvRlBw6vW2DKm2oiHZBW5kwW8cBr/YN
         60SSygaJ8mS9EpGbqoxHGaUHAyw742Em9a81esmIsMVuBhKCosOJ/q6K0BxNvjU/Irsz
         D4KvcIrmmfBEddtyQDlMo6LAwz7ZvDfwzjiIQ2OrEUQnmeUZI/q1HcHIJ8QFETWRyqMB
         8ajQ==
X-Gm-Message-State: ANoB5pmHyNN2R5eM3vhe+jTDDoqVHXodHyMPoYjy82syP6Ebes+bupYC
        o5Z5uSQBEF7Ki6r/2Ay8JkE3Mg==
X-Google-Smtp-Source: AA0mqf6cIFeIaZSq4hgDHiCk9+uApDHmljYl6bl7J7GhAAROvi0Y/uHoVLQcbgBeq6lfIduCF1vPDA==
X-Received: by 2002:a19:6405:0:b0:4b5:b268:dbc8 with SMTP id y5-20020a196405000000b004b5b268dbc8mr8147588lfb.45.1671236253790;
        Fri, 16 Dec 2022 16:17:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:33 -0800 (PST)
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
Subject: [PATCH 03/15] dt-bindings: clock: qcom: gcc-qcs404: define clocks/clock-names for QCS404
Date:   Sat, 17 Dec 2022 02:17:18 +0200
Message-Id: <20221217001730.540502-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the GCC device node to be used
on QCS404 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcs404.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index b70901e0d5cf..b2256f81b265 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -20,6 +20,24 @@ properties:
   compatible:
     const: qcom,gcc-qcs404
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: PCIe 0 PIPE clock (optional)
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: HDMI phy PLL clock
+
+  clock-names:
+    items:
+      - const: cxo
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk_src
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: hdmi_pll
+
 required:
   - compatible
 
-- 
2.35.1

