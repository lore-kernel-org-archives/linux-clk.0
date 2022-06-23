Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9561BC43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbiFWMEX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiFWMEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:22 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC125488B7
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t24so20726442lfr.4
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIy4u57S7ibMX7sfPw0gzUjAoad86ttAMvUrbbsBV2U=;
        b=mFn3/ul3aXhQvZT/bGigx9qc2wxp+kCQRIj1QzPWq/HXSnvX6PSeQNEq30vzd920RB
         slpvBXXsKPXRmEquQHSqHICKsFX6hwpuZgkxd1AF96ULFDqqyVuY7nyhXPTjNcpR3Imr
         EwRLnCHgIIJ+pcgVrmi+83jp2lXOLyQthyX9yuT/8KTgGGt7tE93c6qpqBl0gNAsavsW
         O8iLf2oeTj1k2qA0icfuVd2ZE8XtDe9jzVKJW9RQj/deniwebivdgznkqYXZ4cYCf8Pb
         3X5UcjX8C+jI0l3x3ty20EPFlFni/v0NAsjU+bQykerhHAlSAM/upnElQ9ImXAFhJ94/
         UMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIy4u57S7ibMX7sfPw0gzUjAoad86ttAMvUrbbsBV2U=;
        b=0sKTkLF+qE784gBPZhoz3/KoCIGhYWqGSa7wVweSmtHorwT86YIMpffbte+uPfP2ew
         j5hrP59bZgvhjxDEcKK2tXiZOnFYiaCwWabROGdF0shvC8t3N2HZZTEOrypZa9MOt903
         LnoxzLgqztVoQVwRKweX2SYNe3371qFwN1UOxyVjVArLIK3EOWBUD6pGQ1bayPND04X/
         fbMVOz6i90pkM4Op5ZceHqom7wuhjId/jPRiMtS1p1PqIaOWfSU4uTFypEqHszZUkvPk
         bDYR5kolm3M34TLb6XLz7r0hjYlz2YkEwGd9ExnaxCjrtTShpWQoTuXsXo4mSHFili72
         bWwQ==
X-Gm-Message-State: AJIora8H4Rv/poKQ+hJ9VtgAXZj3jJrorQm9RXA5x3FSfBeAU5W4FSXY
        Ikd2adeJ7Frq0bJ2UDUcdkTxfw==
X-Google-Smtp-Source: AGRyM1taiE/UXE33Nf7CAafJTPJVaJJtOq2OEr1eAE7Li65pKOXmZJFtWc8ogXA4oeb/Mh18XdMbmA==
X-Received: by 2002:ac2:5ccf:0:b0:47f:84eb:a1ff with SMTP id f15-20020ac25ccf000000b0047f84eba1ffmr5132399lfq.456.1655985860100;
        Thu, 23 Jun 2022 05:04:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 01/15] dt-bindings: clocks: qcom,gcc-apq8064: define clocks/-names properties
Date:   Thu, 23 Jun 2022 15:04:04 +0300
Message-Id: <20220623120418.250589-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the GCC device node to be
used on MSM8960/APQ8064 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 3cf404c9325a..6b4efd64c154 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -38,6 +38,15 @@ properties:
     description: child tsens device
     $ref: /schemas/thermal/qcom-tsens.yaml#
 
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: cxo
+      - const: pxo
+      - const: pll4
+
   nvmem-cells:
     minItems: 1
     maxItems: 2
-- 
2.35.1

