Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D15C76196
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 11:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbjCPLsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 07:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjCPLsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 07:48:14 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A8BBD4C5
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:48:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b10so763178lfb.9
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678967290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8GvNBQBOjUbh8CJPXC+mRTtX9SoQfVpi90euwXQiEI=;
        b=L0Dxfj5mNNVmOlMshydPkqOOTRIcNX5eXeF6ne27WWnOCcEoyfLxNxhVIFXwyA4Q8v
         ORG0VDxBzkDN+SWZ5P/mA9TRWgJzIfP53Yl97YM43S0e/IElT3pHoxLnFGocgp19jyrO
         nmE3GqFxu914oDyy5SN7yfjryv05dLXCEe1alIxPh2smEViMEEy3YbQqZ8rL/o8xGOg4
         siSU9l9X/7KDcu/n9ENAbcPxMboJJbsZxYSrX6imWfY9RrkajzqB536xXUx9U15lI7Nq
         kFWOOrbPWmafEYLp5hSeub1BAK88DXlt/eaPikiu5Eh+MkHCEE9TyfcIoGnZ7v5AiZfA
         dXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678967290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8GvNBQBOjUbh8CJPXC+mRTtX9SoQfVpi90euwXQiEI=;
        b=8AdJyTTaXzeMxopnZ0170GWnCrx6xO9CSzV3hiubdp2J1cnQs1eCjeYPd3b04jqwbG
         pZ8wgQ96WUTf6MCDuj6ar7vsjVu4Ws4qT+7pHOUgRy4ghNkU3jxAXGNcGWXlHGU5qB8b
         XNYW75KDG5E00d0asHDoxm/gppbWQILwky+EHVrrKzUSUJ/dXkgLGx+4UveWqptvlhAG
         tVjT8iCpy8YdHQYFYxbxhyUTZ2MoGk91sZf8EPjhQM4iHdS9ba6d4bHjdD5RYWxUKBUQ
         YCHJigdKU26jvjtNhBiMKKm7QGgZTcm+EaRWjccAYmHEaIubiedYbIlHeIRm4BHzGGdQ
         G8hA==
X-Gm-Message-State: AO0yUKUN1DiRbNqvVFtrrjLRPQGM6EcMKLI/VTM25z/gH26nHDbZKfLQ
        XfINtRdFnokWIZPcVLjCyNi6/Q==
X-Google-Smtp-Source: AK7set+l1TQDfWWp9NV4YWIhP/qe9lYBcHHi+89vyD/jtvfrOr0HzzFcVMFK0VcFx5b0OVkPUxtxdQ==
X-Received: by 2002:ac2:430d:0:b0:4dc:537c:9229 with SMTP id l13-20020ac2430d000000b004dc537c9229mr2981972lfh.30.1678967290124;
        Thu, 16 Mar 2023 04:48:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512390e00b004d5a720e689sm1198443lfu.126.2023.03.16.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:48:09 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 12:48:04 +0100
Subject: [PATCH 1/2] dt-bindings: clock: dispcc-qcm2290: Add MDSS_CORE
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org>
References: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
In-Reply-To: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678967287; l=717;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QVkgMuM0suK3F9MZwR93hGwmALmGShLw10sPRQ7MLB4=;
 b=aWRWQCLMzwSxzaWyn08aGPeuvTru0dhOo+rHT4XTi4Xqrf2E9MbfCzPxXO5ouNd6yZKn/vQaf0zk
 qXr6L5aMB21+FwV1gp+kzK1EYVajYFxmG7W6dbNAB9lOLJWc+VdA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MDSS_CORE reset which can be asserted to reset the state of
the entire MDSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/clock/qcom,dispcc-qcm2290.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
index 1db513d6b3ee..cb687949be41 100644
--- a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
+++ b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
@@ -29,6 +29,10 @@
 #define DISP_CC_XO_CLK				19
 #define DISP_CC_XO_CLK_SRC			20
 
+/* GDSCs */
 #define MDSS_GDSC				0
 
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+
 #endif

-- 
2.39.2

