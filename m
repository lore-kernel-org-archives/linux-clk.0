Return-Path: <SRS0=iEFu=5E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADA7C4332E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 05:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2353820724
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 05:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvT93Q2H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgCSFkq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Mar 2020 01:40:46 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45028 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgCSFkp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Mar 2020 01:40:45 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so558179plr.11
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2020 22:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cyCIYRiG58oI2Jq7ZJtWmwccOTnDPz2E+ahBUJwhepg=;
        b=RvT93Q2HIVa2wQjAavOrQcjjvBzoTD2d/Vi0v4ILPVwAzX0dg8fy+LstszJeJ9LYsG
         h9Urt8EI4rk4+e+JOpzUihNvclfFm64LFGjzHeJcniNPXN0peBt+C/ibQMaALx8sQD57
         3PRx+NHS2yn3f097HiMTm8+qbDWAyTyHFLatvInITefZQ3pMOrsrYk7Oj++eHChUG5tD
         +KN0ICuFOTKxbEUJIGQmAsNH6J0MBbMjRdAXsvjYCye+2g0ymTjeM3oqw6cXinUmNni3
         Nma7XDkNIdwNBj70L4W7Ro3j8nxaMs8rq2kOlT0ehEWqTQhq8eelvuXlDq1su585cyIo
         cXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cyCIYRiG58oI2Jq7ZJtWmwccOTnDPz2E+ahBUJwhepg=;
        b=EqqU1pLXr+fJa9i1EpfyumzmjF0aPOF0NfMZI77BPMcPPTrVIjKrdG4H4xtLiqKq4R
         mUIpqy29WPAp95ogk4fkzpMS+mKy4vqrVbo9KmSw/rUBY4Dq4F1zq5ezu8omiQ6WMwvE
         AmqwDho/x/DbFvF9ZKKv44vb2/WWNt4K0gVdQphUMIMhBlHPS2slo2Q6qe+e5KaPCsEd
         NQg44e8lXwIKdZP7zm6TKDWdSh9XEzqUNU+2uKouuAiJSxQKRq2a04XkCKkbkVas+amm
         DEg0+qAC6qJlXU/lYHGTEOi/loleIOPfKLWrM2/Etc0A7dnBt0Ss+GPLF6UNv5Hvw9mP
         kmuA==
X-Gm-Message-State: ANhLgQ0UHXubBbPfWL89h+SCJUQy/RatAF86b+Af9Lhrm5Itt/yYaDDT
        n6SWYVfgWUGyoHaKHT+rhP5S7Q==
X-Google-Smtp-Source: ADFU+vsVQv/9+mfD/f1ED3jkHlTd7vOGHMk8SR9Qw3XEQH2G5U8b3qmKmp8Edz2JQuozbGE0tbBmxg==
X-Received: by 2002:a17:90a:2663:: with SMTP id l90mr1852159pje.188.1584596443916;
        Wed, 18 Mar 2020 22:40:43 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/4] clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
Date:   Wed, 18 Mar 2020 22:39:00 -0700
Message-Id: <20200319053902.3415984-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPU_GX GDSC depends on both GPU GDSC being enabled and that the
VDD_GX rail is powered, so update the description of the node to cover
these requirements.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 4 ++++
 drivers/clk/qcom/mmcc-msm8996.c                        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 85518494ce43..65d9aa790581 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -67,6 +67,10 @@ properties:
     description:
        Protected clock specifier list as per common clock binding
 
+  vdd_gfx-supply:
+    description:
+      Regulator supply for the GPU_GX GDSC
+
 required:
   - compatible
   - reg
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 6c7592ddf8bb..fd43a35db13b 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3064,7 +3064,9 @@ static struct gdsc gpu_gx_gdsc = {
 		.name = "gpu_gx",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &gpu_gdsc.pd,
 	.flags = CLAMP_IO,
+	.supply = "vdd_gfx",
 };
 
 static struct clk_regmap *mmcc_msm8996_clocks[] = {
-- 
2.24.0

