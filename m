Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A1FC05027
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 23:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjAZXDs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 18:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbjAZXDq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 18:03:46 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF48564BF
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:41 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id n85so1198214iod.7
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0817b8QuSi7hdYOROCPDeMWfXlDnjhdy6HTg+NWqT4=;
        b=mubW0yFBRNRRB/VvHHPAlaCWIMZKyNdR5xOeTOY8/ni1uYMXxzi7pzNV9t3cFgSW5Y
         FotiU4Btx110lE1+UCIYAUOF264i/LxOaU1iw2Obz6ZwBft2mxffoSdDJviHdGboHHL+
         5GgpbyoSHRws5IUhpudUPx2+THUuMODad/IAgdn3TW+EzQBsQe/inCevGHTbe5vduefT
         tGubaTNwUn9q2iSaOT6gDoIyfvPQbovlpb4EXSxJ6AyBNsN7cUnccXnBiiH6wbVw9muj
         Ltj/36xxHnkxK64B6dH0EocpbRN+0KFUMqTb4y7+NMZ8WJvjYSUskLoytUXSS3R7moQ6
         Onhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0817b8QuSi7hdYOROCPDeMWfXlDnjhdy6HTg+NWqT4=;
        b=Lvp2CwghMBWS0A7MhuAhdar/ZlX3xZBjE89+VuqZ7TNRfVoPwHgPF9mqMN3Xcu9WIb
         zv5/BOpS6r4WVsZydOm3aXpxFBz4vdAffn7dbCxJblD/zR4wcpFt6LtaSDslRJyQ7kA5
         NytruvLUjibWM8rycsugm+0juniChbeeauEBpQ9IEvJH8jKRVTTbKDatH4MHJmQzzrRq
         jiixaUNRMWvvxK9I34DpwwdVfjy53fZ7yjEz8Gbf37HQ5seJz+0Qq+lRFe/fnNkUBEkA
         YvTwYvG984OI4KRaYMhe+uzEvdZV5+arXwhuyLrrgpN7dQv/1qiwU2eve8LCzcub8pv1
         dtGg==
X-Gm-Message-State: AFqh2kqmBEijLu9NV11TSMCK9sdRpBBhfPm4BJpl1qs6H/Cgd5kU2rms
        /x4padaHMrCeNc7ysdZC06k0ow==
X-Google-Smtp-Source: AMrXdXtKAXX3oS9Pnk9NtCBhAAYZsbkGo0kVhxqgs6+MnSb6gGZedzmqEAIRil9QHRGoUCWCOyyeCA==
X-Received: by 2002:a05:6602:1253:b0:6e3:19f:b3c3 with SMTP id o19-20020a056602125300b006e3019fb3c3mr27906809iou.0.1674774221562;
        Thu, 26 Jan 2023 15:03:41 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 4/7] dt-bindings: mailbox: qcom: add missing platforms to conditional clauses
Date:   Fri, 27 Jan 2023 01:03:16 +0200
Message-Id: <20230126230319.3977109-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing platforms to the conditional clauses selecting whether the
clocks/clock-names properties are required or whether they must be
omitted.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 5f7770036fed..7d8de7a16984 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,6 +72,7 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
+            - qcom,msm8939-apcs-kpss-global
             - qcom,qcs404-apcs-apps-global
     then:
       properties:
@@ -121,12 +122,18 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,msm8953-apcs-kpss-global
+            - qcom,msm8976-apcs-kpss-global
             - qcom,msm8994-apcs-kpss-global
             - qcom,msm8996-apcs-hmss-global
             - qcom,msm8998-apcs-hmss-global
+            - qcom,qcm2290-apcs-hmss-global
             - qcom,sc7180-apss-shared
+            - qcom,sc8180x-apss-shared
             - qcom,sdm660-apcs-hmss-global
             - qcom,sdm845-apss-shared
+            - qcom,sm4250-apcs-hmss-global
+            - qcom,sm6115-apcs-hmss-global
             - qcom,sm6125-apcs-hmss-global
             - qcom,sm8150-apss-shared
     then:
-- 
2.39.0

