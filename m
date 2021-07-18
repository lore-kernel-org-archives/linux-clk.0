Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986B2C636CA
	for <linux-clk@archiver.kernel.org>; Sun, 18 Jul 2021 10:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D95F611ED
	for <linux-clk@archiver.kernel.org>; Sun, 18 Jul 2021 10:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbhGRKwI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Jul 2021 06:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhGRKwI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jul 2021 06:52:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030D7C061767
        for <linux-clk@vger.kernel.org>; Sun, 18 Jul 2021 03:49:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b26so24301773lfo.4
        for <linux-clk@vger.kernel.org>; Sun, 18 Jul 2021 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=t+HDcrLUacRbP8DNOo5e+GGGeA4NvCD16BJ6c9ka/ZJCd3Nrv0m/OPSnhoca/L5Igj
         NWWteA5rbOi21sMd5M2yzB7oPIJPe1s+LlUlQTO9nibj69OR/n//T/n52ChJmo8kA1Lw
         Jj7WfAhY2T/S9uCN0pnCx6Y1EpU9+90hCQgo+Rqqkuz6RZ0PZiXgoprRAJ75NE5dGKWn
         5Hin+Sxz3IVE5JWELvfTEFkpkjYPU6Y4+cZPS5JW83kuF9XJR/Z3aHM1UY5PBgb9lnWT
         tWhmhCMwLAo/Orn+ldJhB472Aanj37ZIkjs/pg3O+Eman8HYvduy0fN2WdSimiL9JFq+
         XTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=kgDubi5o47SbDFL6bRz7VQoY87RNTnxslj5/6qjp9s3YiRvKXUjj3orZuSNocEf4Et
         b9xgY1sNSsEsJ9UIIalMxTb09TiEsoiCW1AOo7YlrR9HVSbQTBl6XktzMT1wX5n+sPxX
         CN0sRYF9p95cJmJjtBxuAlHqi0uv3dRwgJf9DbcrSl6cW8jOi0hSdw1ljUy4d20lR/Lu
         OrSF5zhUTHhQPxb+luHX6H7uUX0j4uQk4b4qwMXDZlEBEiy9DJ/rgGHkWddK2XHAswrG
         OSKM0Zs2LjpXdA23F3mthcUsTAEr5DQasOLnzF6nFz6IMzNmmmG9UQzZTQGqyICoWA+W
         oA/g==
X-Gm-Message-State: AOAM530gA1qmbtRr5ewb4JEqjHnn3a6RWF2kDpJGZlyqQkOGovSy7lD6
        5uu9dOV2zg7zsPe35ricJF/wAw==
X-Google-Smtp-Source: ABdhPJxc2vkNluaAJwBoTzZVkGdqt9L9Rob3X0LlWnRT1n/e0yx/7dEc6/8BDRbSN5dRTl7uFfdk6A==
X-Received: by 2002:ac2:4206:: with SMTP id y6mr14382336lfh.206.1626605348335;
        Sun, 18 Jul 2021 03:49:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:08 -0700 (PDT)
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
Subject: [PATCH v5 1/9] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Sun, 18 Jul 2021 13:48:53 +0300
Message-Id: <20210718104901.454843-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
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

