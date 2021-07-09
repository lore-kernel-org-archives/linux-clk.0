Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EE1C11F76
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A29613CA
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhGIRfA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhGIRew (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 13:34:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8B7C0613E7
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 10:32:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so14981694lfl.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+l6RNZfO6t53h33tKaqwIC7dbp1+6FXvY3b6ZyHCbIM=;
        b=kQuxiBVKZRCQhRmh45OAszosxWefqx6abf0JSPJUbxbD9VD1vshSdblR4to5B1zeIM
         gd8P/SUQNBTpNjdAGm/Vt/WxQYMdp1eyfknRL6zQz2yYIj8SjED/S67WvXdGuFsHcucV
         yP7AV5XY9AkTDI7TM3U+dXuVLX1325XamDBt0rTAkgGP2JDMyPzB8GXg6cYbjBGMEMBA
         cfWkwwa5VIvDB/nR3p/Mnpr4zWOd+f7R9OEUH0nlcdlJJit2FFVL11Wi+mdCgOesS+JZ
         1Em+7pkqqScZifBTk7Jm6onIvpzJUbHEAe9vNdZgnPmHzI+OrF/rfvb/1XwAtWGOm+YA
         nW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+l6RNZfO6t53h33tKaqwIC7dbp1+6FXvY3b6ZyHCbIM=;
        b=GIuL1Y6xrfFTQGCb2A3uo7uOlyWJgKZD6RmXfooBm2zi8nliYZaJbhflDzf+DZM9wE
         lDu+EA6DB4ar/jGTjJUADj5/onNnTkydMveXzeTUq4CgQwwWCanxQWj4Q42aNNtRmNgk
         fMf/Ax6ZhmYeeO1SesYj6nORDDGQ0DKdaD7qVKkCtfAZFx3eKGb7OtR3yrNe6pixx91B
         BwJUyx/ZP/DVkFwNaMMHSxxGgXygjmJnB84MViFozGb9bn+2FypR+3n8O1C8mho41Git
         8KHi78gFWU+VzrFfex7Q8ptobF5dRLeHfuJx7K8Kx2VqJvRc7yhJeKgpm/ax2N0zi8Ge
         0RYQ==
X-Gm-Message-State: AOAM530YdqEZU/+s7KgItDdmci7cUspFvhYpKLXOpTq3hNqQsWPEdyok
        ZyieDJ/NPNG6lW1Wud0xBHBlIw==
X-Google-Smtp-Source: ABdhPJyYC2SMo3GbiZe2sCoQeOOag4DBODidkGofQbLQmNSpc0jDQUBnJbh9tjna+TVj5nncPrh8Xw==
X-Received: by 2002:a19:6d01:: with SMTP id i1mr30576206lfc.422.1625851925764;
        Fri, 09 Jul 2021 10:32:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:05 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom,videocc: add mmcx power domain
Date:   Fri,  9 Jul 2021 20:31:57 +0300
Message-Id: <20210709173202.667820-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On sm8250 videocc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,videocc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 567202942b88..db4ada6acf27 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -47,6 +47,11 @@ properties:
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
@@ -61,6 +66,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
       reg = <0x0ab00000 0x10000>;
@@ -69,5 +75,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

