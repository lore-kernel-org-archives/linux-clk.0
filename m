Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324AC43216
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 651C86103E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhG0UUX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbhG0UUV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 16:20:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF598C0613C1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u3so23868233lff.9
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=uc6aI1bT4oYPAXdYes42FS0Izp1zNLRkiWaGnSYlwTVIVOsTJSUmch0aAT5BmcYlcE
         ytrOkbt2DiOy0FKyOcCFU+QB/iJe6Azcx27O4p4DElOfL9rh8oagFB3QRQyOwv6/ykRA
         VBUr9jguO2RzUwDjQ60ngQSZABJqc1xPbbyPCkpfHBGiVdJRGYuR4ks1ey5VdH2H3HwP
         4QDg8KYTIo/TvTnZDpGJDH+qyfCfrr4BDU8eu4keUJfMmRB3rDIGP6R0PasbOvffXzkU
         thDS7DIzY3kpx5HSg4cXVYslvWprRGRgaKWoEqZ5HXMlg2o1bt8UcQe4MwD0esSupeAp
         NF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=H2GrtfekLTu/7MmEvmH79sKKpjccSEIztRY5bh5ptNHyANr+MczUut6qxkeGm43Nyf
         OiOgOZ5XrjVQt48zy4SrXEd4cZy+hEcl3snQKSG9m9NEjPyBkvobwFDU2Dn/wmsdI955
         hAs/nNfhb54KhCOTJ/pYG8YALsAaBljn2vZc9rMe5urEsuUs1R+jROXKscitcpfPNYd8
         Vh1OThWrBN8b6XlS7Ntvys0MBo9CTcBUPY65L7SM5JKkELtRay+XEiNoVDRYI7abheiW
         MFGJ2pzwDqgKgfrzxX71uin85eI1+EN9gOlEmRps3WixL2u8IPzhTyZLujdM9fhrkO+V
         uVLA==
X-Gm-Message-State: AOAM531+9PsC9++7NuKuRj/GKMJqi78ZJTN5N4leuj/g20FFyZIxfV7f
        ohEgXNXZcvoxT6cuPdoxdu2uxQ==
X-Google-Smtp-Source: ABdhPJxtBIHimc4+h8RBOli+FFBmffq0wgOKwkP8OCNq2ZfDAhNfcnN+3ZvhYtUJ3OltmmbvPEAgaA==
X-Received: by 2002:a19:f716:: with SMTP id z22mr17747060lfe.13.1627417218148;
        Tue, 27 Jul 2021 13:20:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i11sm376502lfe.215.2021.07.27.13.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:20:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/8] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Tue, 27 Jul 2021 23:19:57 +0300
Message-Id: <20210727202004.712665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On sm8250 dispcc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 6667261dc665..6b3380cf1a10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -56,6 +56,11 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -70,6 +75,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -90,5 +96,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

