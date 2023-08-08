Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE06C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 19:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbjHHTS6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbjHHTS2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 15:18:28 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB41115BA7
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:41:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5234b80e9b6so847407a12.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512869; x=1692117669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UuNhIPZQtVYzGmtMAw0xH3Mxdy93w7NQpbLuvaKjSg=;
        b=b+pcF6wEmQNpOmdpmQe10zeV0PJ5V1lYBMFyjn/2LI/2B8YZynXWB4a25KlUFRNwbj
         uzC3lEPjZwZF381Gbs3kp8JG/X5y2P6W8YZS2UEptAwui3gJ3073GtSAxlqU+AtQiVZ/
         10NOJ58yDZobmHKm6QbKFxbxbJP0EDnjL6qvpzsYQeWcnq8YIXPo30F5azcOdASJjO4R
         u3Jdz9ig/C2xKis+C/fPCIr+3fXJL18gsX6tr8NW2g5X0AsUH/Fnp2BC7vXJ3xrtXV6g
         nvIt0eUV8jLvcHS+9YW/xKyNoy5W75ZS1Buv2U2i8pTXvG+eYGnlFj41Uwc4kbGe+pVw
         MHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512869; x=1692117669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UuNhIPZQtVYzGmtMAw0xH3Mxdy93w7NQpbLuvaKjSg=;
        b=EehKE0OJpylQHyXUxZekoy0rcOYgtEd+6LVj0ZNAu532wHiM+Kr/kZyC28w3/dpacA
         EZ9h97ia5PGVXh6Xlq0Z6xuz1u4nAXegbBWVhuUTCeuUnjEmT/l1wdg0xv4LvLM7M7d1
         J97MGLvp6zoB6mHmiBubdL2q+XN3uOeFEhBPoSS356H3V9LyqrqMyCRGtvmG3U9siwo0
         1sVtZ+7QJOgfm7YMJSdQF3eSmHJ9nVxn8Vfmqt9TxubzpJjsK5ORbdnA1ujwsaMGuchg
         n8/lT1uvdgnv2K/AJxKqeNKQ4z09DpOj6tSLngLL+SQw2PNiNOIeTqqfbA0WhYHBvXB5
         jf9Q==
X-Gm-Message-State: AOJu0YyG2YRdoqwazWji0D50o4j6Cb0IiLCD7B9XXzXuguVPvE03gkBS
        cjaDBFBDNOmqEU5ZoHWTAndp3K82AiaouKdW1Wg=
X-Google-Smtp-Source: AGHT+IHe6NP3MzfgZSWbkR7jxRMoFmcA9NIiePawh4EYEM7Q9mrKbCLB6JP4QQacs26mWD9MoLIIVw==
X-Received: by 2002:ac2:4ece:0:b0:4f8:5604:4b50 with SMTP id p14-20020ac24ece000000b004f856044b50mr7020474lfr.64.1691487899167;
        Tue, 08 Aug 2023 02:44:59 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:46 +0200
Subject: [PATCH v2 6/6] dt-bindings: arm-smmu: Fix MSM8998 clocks
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-6-34273e275c51@linaro.org>
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=2406;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GiTo3aHVWSJqXeRVvBwFrjMpXiRsIg5liCVx9M1P4EU=;
 b=Nxs8hOuPBNmdHqXrObFj394Ryc0kynWXqn1i40tZ53Cb01Hzw6WwtFi+3X0Jcw4BcgOd603j0
 ZWoh4q6XnKVBZvu54Q3HrIhvJNMsEM/z8rSRfzNPESDS1/k+Iq2OYtg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8998 was abusingly referencing one of the internal bus clocks, that
were recently dropped from Linux (because the original implementation
did not make much sense), circumventing the interconnect framework.

Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3a31a979709b..cf29ab10501c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -270,6 +270,47 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-smmu-v2
+    then:
+      anyOf:
+        - properties:
+            clock-names:
+              items:
+                - const: bus
+            clocks:
+              items:
+                - description: bus clock required for downstream bus access and for
+                    the smmu ptw
+        - properties:
+            clock-names:
+              items:
+                - const: iface
+                - const: mem
+                - const: mem_iface
+            clocks:
+              items:
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for memory access
+                - description: bus clock required for GPU memory access
+        - properties:
+            clock-names:
+              items:
+                - const: iface-mm
+                - const: iface-smmu
+                - const: bus-smmu
+            clocks:
+              items:
+                - description: interface clock required to access mnoc's registers
+                    through the TCU's programming interface.
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for the smmu ptw
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sdm630-smmu-v2
               - qcom,sm6375-smmu-v2
     then:

-- 
2.41.0

