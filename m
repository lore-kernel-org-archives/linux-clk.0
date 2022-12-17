Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE04C4708E
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiLQAXd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiLQAXD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:03 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938E266C2D
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:34 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id z26so5868372lfu.8
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWDEXJzpxC4huaA0slWAfF/NQqnpK+eVzsXesechI68=;
        b=ZM+yJDsO4PF6SLgMkRXKqOLBmkr4aePNEveh3MLwWck2DRedVIehlz+t321+Per36C
         Q4Gb7s/U5GmJ1xkxycHgLZdBQn32HrV3PXIQD7vTZEwkQVmjGO6H7s5I724DnIdLzsXX
         cdQNc2i72/DW7QV8PjUOdqXgQJEvJnHj2I97KnoVeTrTeUrxqeBbi/SsaFxs6Ihv+4b4
         tym+YGhIgfULSnP15kgZ8PIeK8lHVMjol1WuAgjkUkisA3fEY8wBezj3OzdxdKwRgVbw
         aXTWsrPEHvgdRWXsKH/NrE4p+gfv9P4mv0+C9LuxXrGuV+ddt/g9+WraqyFDKEBlRmxw
         PEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWDEXJzpxC4huaA0slWAfF/NQqnpK+eVzsXesechI68=;
        b=gWmBmqdXSUol1HHE35b73VOUR+7224gpiaTmPqGzuoYK12GLwzRJmXCvsufF0R2jfF
         qnKq04pf+RjP+a9j2a9nJkgRWw7/PsnJnWuVQJMJJxXSHxqm6+tThuXFd+i1L4Qbzy7M
         a46YionTIV4GSLJn6GKY49N8Gz+R2/ddirkK/vdVkRSCLhMsGJU3CkA1kwc42KQ7myu6
         TQSyOIHm0Fd2EqQ3qNeaS++tDg5z4oBfzf9tJo3PzJieuJnUmfLodkttby5FQ9nsfD/Q
         +XUNjENx+ORaR0afI6WHcIKbwVLt9CpMtbtWdB+MP+Jev6jpskhymcjm8s0vPswJC6Oh
         orpg==
X-Gm-Message-State: ANoB5pngbxwgRjtvoK3D7zlJ20AcVO9AGG0XPybFsoS/f/jkVoyTJSMR
        zLeW4uJATIzUGZCHv8VJm77EgA==
X-Google-Smtp-Source: AA0mqf6L/thwkt+x+ppQjT9ni0s1uXIDIr5UKDKwpKCb2/rgfqzuayJaDX3ZCrQqSwl1nvqP1vxo8g==
X-Received: by 2002:a19:6719:0:b0:4b5:7374:90a4 with SMTP id b25-20020a196719000000b004b5737490a4mr8947691lfc.49.1671236252968;
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
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
Subject: [PATCH 02/15] dt-bindings: clock: qcom: gcc-qcs404: switch to gcc.yaml
Date:   Sat, 17 Dec 2022 02:17:17 +0200
Message-Id: <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the gcc-qcs404 gained support for GDSC and requires using
the #power-domain-cells property, switch the qcom,gcc-qcs404.yaml schema
to use common gcc.yaml.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcs404.yaml       | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index dca5775f79a4..b70901e0d5cf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -20,26 +20,13 @@ properties:
   compatible:
     const: qcom,gcc-qcs404
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -48,5 +35,6 @@ examples:
       reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
+      #power-domain-cells = <1>;
     };
 ...
-- 
2.35.1

