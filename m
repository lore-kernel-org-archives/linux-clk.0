Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB249C54EBD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240928AbjAMMMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjAMMLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:11:45 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58EB7D9FF
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:08 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id o20so875857lfk.5
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZDEolcQGnwFUL0b6SHhXtES+/x7b+VoQjgO/oUXinA=;
        b=Y3c2aTu+lBZqLf1pQVj3HOvZZCtBBotxEjVIzeC4sx0LsyrEBsF2icS/6sxA0B1eLy
         vmGi42Lim8Zbft+SBXAu9r7k/0swA6HMfml2gx31iSvREWVYdu5yBYIbnMDlbTJDZRmW
         RqDvOvNdE3hT8aC5gxB3ctSSk9J1IzOQkQEPmYdM5qFdSpdG0Nm8HQXZp0dqR6p4FSpV
         1mU2VpOvMWKlGmRzJZzJpBVax5IhRcA2vW6/DfwF38tf4KOWGmCoNLBDFzkBPioHYvQ6
         bZygaYe0At+62GYN+QqkjhdWY90ZOkA1tk1/vIBo92EDSbz5vEamj+BHs/87GQlzXYG/
         OQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZDEolcQGnwFUL0b6SHhXtES+/x7b+VoQjgO/oUXinA=;
        b=7jH4i1+i+bm/rupadgF/iWASYHNHpGIl3FTp56FBku2kkLVU0o/4vwsYPUkhOWup6x
         SblJHz0a5Uz2EMmyMnWjUoxxpDbxJ4swAA9NRJROovg72QmfAGfKvafD7lVJdXP+BVhA
         QJ8AOi+uDX58fLMUqSIQ5D4bpvxsHPuEN0HkcFNizmDIXh9azQXNudPR0+RrGUniaKTm
         7FuHvffn1d0GsNz3QM23rDVB562owuj89OcSBbVcL8vDCoSh1Yp4HADO/DxHkN22lqGG
         xS1SamWEnoIihTCFFQxbpaMEdM3h5dnS1fi5Yzcd2ydU01mi0j0kAXl+EVZjtX9R7YkB
         r6Iw==
X-Gm-Message-State: AFqh2kqaPqoCKTukssNHs02MKPHwnMZnUzysC+FmDGgL4mjFNW/ahlcy
        A6m6fj2vK4rftuEcbpcVaQb2hQ==
X-Google-Smtp-Source: AMrXdXv8GG9odTGIrhCZqfj1TTqxoGwIdULKDVy4O/xURU+JJ9F0/EC9Jd39q1WPUgU0fGNG/bSphA==
X-Received: by 2002:a19:7008:0:b0:4b5:7d49:4a05 with SMTP id h8-20020a197008000000b004b57d494a05mr20313749lfc.0.1673611567319;
        Fri, 13 Jan 2023 04:06:07 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:06 -0800 (PST)
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
Subject: [PATCH v3 01/14] dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
Date:   Fri, 13 Jan 2023 14:05:31 +0200
Message-Id: <20230113120544.59320-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MSM8996 CPU clock controller can make use of the sys_apcs_aux clock.
Add it to the bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,msm8996-apcc.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index c4971234fef8..fcace96c72eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -27,10 +27,12 @@ properties:
   clocks:
     items:
       - description: XO source
+      - description: SYS APCS AUX clock
 
   clock-names:
     items:
       - const: xo
+      - const: sys_apcs_aux
 
 required:
   - compatible
@@ -48,6 +50,6 @@ examples:
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
 
-        clocks = <&xo_board>;
-        clock-names = "xo";
+        clocks = <&xo_board>, <&apcs_glb>;
+        clock-names = "xo", "sys_apcs_aux";
     };
-- 
2.39.0

