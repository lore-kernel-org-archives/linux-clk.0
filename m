Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E524C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 26 Apr 2022 10:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242778AbiDZKOL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348457AbiDZKNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2022 06:13:24 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D2422BE6B
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q14so21162707ljc.12
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aqpv+MsraYmAMNWLkARIliibZ+YyOcALvDsEFEi8Sgw=;
        b=Fbc3VR9sFt2gzNsdu1qRY34I7dNBHhEavjo4EoxtDEIPoyfwt+HBDOljTWASj0kZ3u
         5LuLxbpnFqSpYvFOkMwGb+pwGwvKQfNnjoCepxXubyPjMH9stI+S3ZfzZ+wx8BJ0SUNU
         nVFZ9NyWhTQw/wCNVUJQjpYrtFba0rPqIegEMVE7fHJIp8dcaFPqStR01NmGQamDrk8F
         pyKEZ4X2MqJtHZVT2ZnHKbXgSBhiSa91YkVBTq5PU9N2NsLC3nUoTdE31gzIVhxGjvlT
         HM68JF5uQi5a6WljlSO/qiyrhDTK/C5G8EpTdoJlb0huzVdUo98FPQnGPFlDpStlFEpW
         BWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aqpv+MsraYmAMNWLkARIliibZ+YyOcALvDsEFEi8Sgw=;
        b=4hA7WstsNaXEucMFOULhFaDEZ7zXCyW2AWJ2mSkqr+nmt8Q8IW/beg/B58AZvaBMwu
         vAXwNRXF5+ogIa6ovKSafLp/Vlaoq/4hLjpAgXL3PMDpEhJ5V6qnysCG4QAcUzkSjoV8
         UuZ37lZlDtQlSBQ7KjqTzvyXRybOfvDAn46NfkqZUwCqmbGApaCw8/sg78Qm0WOPK+4H
         qQFrBb5QSvliZjbDdSwcwjKpRaM1OUlQ9Ma6n1YOwpeFqAJZq61tLub5Hp72c4OtKJn8
         swSHozltbcII3YtlAUpSesx4LEjh8HtHMANMZ59XDvxv5cHsdkl8F7QJcDeDn6NSJysF
         TRKw==
X-Gm-Message-State: AOAM5320OU2ZCFvsiBdffYE7woDXQhVk40FBVSGs6PxcoHY8AmZjJq7s
        kxCe6kXDBlpx+FmwdNlbL+ZiDw==
X-Google-Smtp-Source: ABdhPJzQIFvoHDDbUzZA1glQx6vzXXSepDbgZjA5QEZ96AYEuu6jJ00WgexUTqYIwDrQ75CVGTaA1A==
X-Received: by 2002:a2e:8617:0:b0:24d:a185:76c9 with SMTP id a23-20020a2e8617000000b0024da18576c9mr14013870lji.312.1650965774112;
        Tue, 26 Apr 2022 02:36:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512131700b004486c863c8esm1684232lfu.257.2022.04.26.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: clock/qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
Date:   Tue, 26 Apr 2022 12:36:08 +0300
Message-Id: <20220426093608.2957210-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
References: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8960 shares the design (and the driver) of the global clock
controller. Move it from clock/qcom,gcc-other.yaml to
clock/qcom,gcc-apq8064.yaml.

As the eaxmple in gcc-other.yaml was using the msm8960 compat string,
change it to qcom,gcc-msm8660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 ++++--
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 5 ++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 9fafcb080069..bd7b04c75e50 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
+title: Qualcomm Global Clock & Reset Controller Binding for APQ8064/MSM8960
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -23,7 +23,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,gcc-apq8064
+    enum:
+      - qcom,gcc-apq8064
+      - qcom,gcc-msm8960
 
   nvmem-cells:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 142402f29d98..9c69083bd93e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -47,7 +47,6 @@ properties:
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
-      - qcom,gcc-msm8960
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
       - qcom,gcc-msm8974pro-ac
@@ -61,10 +60,10 @@ required:
 unevaluatedProperties: false
 
 examples:
-  # Example for GCC for MSM8960:
+  # Example for GCC for MSM8660:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-msm8960";
+      compatible = "qcom,gcc-msm8660";
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.35.1

