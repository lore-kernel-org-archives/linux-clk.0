Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7EBC11F79
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 470CE613EB
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235141AbhF3Neb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbhF3Ne1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 09:34:27 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F80FC061280
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x20so3325039ljc.5
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1GDsnRGky4n2WSFWX6nkRzIkPArqTdunnzWeNZQG3A=;
        b=bQGflZQkDcyr6mgCmHJ8pSZ2SwAFyb1Km0sWhPOjKc504hvSRWVVkagL9gZmkLq1nX
         DQillDABvOW4fTXlK5gp401kBjkFzoNEXLiMO1I6uC3ZBK+R1xiqelD0XosOUBvf/V4D
         k3qYfcYZdWcIkfMfuSOwfJcNTEEw9TAsn3ur7XtbtFTuDhDbf7udKBQJNFUq5XmWp9f1
         dPi+YBWNSJn95IQy5ExcIZ8OTkGIn8sfVX7bvPKxHzWmClpW3oTmwwosj4+5E5mjCwCb
         BF6tw025SP2sr8XqQKehZej75PkxgPK1gkk19W/24ax7JiSUr+RyCYJ8v4qRLJ9qSEAO
         3K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1GDsnRGky4n2WSFWX6nkRzIkPArqTdunnzWeNZQG3A=;
        b=WVnUcxOaO155Jyt562ERjTM0jIchIQHCHAH8VWfVYtK2dGM2gIbbVFlnP8UxSPVZma
         1tRAk29wvUvW1VtsOzVhYcyLBKIzV/XThZ7goa7n9CKwlvAvy/+jzFCqL2GzXdZ9Hic1
         Dd/dTcyrIOf5VYh6On4E5Rl9yU3nX/c2LVlZWHtjWjtOpH3jNSBvTYmavh8QYlobVPRo
         V8Jn4QAxQy+Q7oW7b4niNEB4DLj7GoKMy8+SoVtFXRD5MZPjCJhlsJJz4k2t/50FrgrR
         BFyTmv0Y3RFFprwLnUXfK+INeScThEkRiceeLOcLXpra7ovczotpIAHLctmfsNS3NXAb
         7ulA==
X-Gm-Message-State: AOAM532w11wd4Rsqa5o3UBq3pnrQS1PnJBd9VCx3TwffO7EoluCEUHd6
        wFrvDd1VEr8PAjZAyxEXla35Og==
X-Google-Smtp-Source: ABdhPJzKXMQbhp8sBCe4Vzvvt530pA5S7BmDq0hsbBP5ydHyLGBnQQVNBDa+J2rnViG9oc6PUfgvdA==
X-Received: by 2002:a2e:50b:: with SMTP id 11mr8090463ljf.220.1625059913891;
        Wed, 30 Jun 2021 06:31:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:52 -0700 (PDT)
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
Subject: [PATCH 2/6] dt-bindings: clock: qcom,videocc: add mmcx power domain
Date:   Wed, 30 Jun 2021 16:31:45 +0300
Message-Id: <20210630133149.3204290-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/clock/qcom,videocc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 567202942b88..22421173e1ca 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -47,6 +47,16 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      Performance state to use for MMCX to enable register access.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -56,6 +66,15 @@ required:
   - '#reset-cells'
   - '#power-domain-cells'
 
+# Either both properties are present or both are absent
+dependencies:
+  power-domains:
+    required:
+      - required-opps
+  required-opps:
+    required:
+      - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.30.2

