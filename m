Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BF0CA9EB9
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 18:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbjFLSav (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237611AbjFLSYn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:24:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04311E7D
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so5516281e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594279; x=1689186279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEi5qpheZl2BQaOFoE3kkQOdFO7lJ+DrcH7akRlwpqQ=;
        b=AEvWiL5CQwyLRex0IfiH5wBk6r1CyDyBAbbBy4kaWDDim0oBPXxRL7RBaZs2IBQ3l7
         qp1OmAADeoxQ1cd4KS86PhNBxxOTeyKk+GaThXC8kkv1TiHX20upsGR6momGd0MV2PQJ
         B9iDBnjjovOIxtQfvlnkOOUx0vcpQgMLTZGVG0PPL+BkXEyoPfNqNokYKY9oue85WsKQ
         iY8zouPXv9151NK8y17VV6LMGixxNhKYVqHRjPZEjf6eCt4BQnOKKf9fYb9JVJWS4yha
         8WaftODBStZM0cBCL/meWkOjVS6PRK7fASpa4MaN7DW1ASG+4tBfiX4HSJl1PulWit4B
         qDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594279; x=1689186279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEi5qpheZl2BQaOFoE3kkQOdFO7lJ+DrcH7akRlwpqQ=;
        b=FGKi78hxpdyNdl/oPRxE+1+XVxzVZogedv8zh8O8NedvpXZdZjSouCUeeUpWjWHx4X
         R27/I0ozfOtbT5NY3KQM3bY+bVhRh649ykRkYYUs5nXylNDPRkeSneDKUqXfp4I3Ypx7
         /r6GjNW+E/KDKX1G4oQe87tyeWA6/b7uHwYRtchrmMhWEl3clFIX5bFawfjx7bjp/XSU
         QPop57Lyz/879pjc7kM8s3BSOQ8PX+t7xQkwfBPFDVPceLEu2G9mq2A+k7h+oeUJAZhr
         Woi/pSZ+XDhezbGQD+HPE5wk1eLLJ4g8hXOMyju8C+SgVJChpTIu5XtwOHVduxh24lXF
         lx/w==
X-Gm-Message-State: AC+VfDwEb9C7T2AHrtcFtzjXF6XgTPRQNpAuBz7uP7l0pqR8qID6ppsE
        OvVue4Ruc1ggxHahkbeGEm2Jsw==
X-Google-Smtp-Source: ACHHUZ4bZaztu6nK3yAtGvQguTOa7RPuPbtOxAWj7/Qa6PBkgcWU4VecYqjPQYCJAV8ne18htJyN/w==
X-Received: by 2002:a19:691e:0:b0:4f6:26fe:9e7 with SMTP id e30-20020a19691e000000b004f626fe09e7mr4022151lfc.10.1686594279359;
        Mon, 12 Jun 2023 11:24:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:24:39 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:18 +0200
Subject: [PATCH v3 01/23] dt-bindings: interconnect: Add Qcom RPM ICC
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-1-5fb7d39b874f@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=914;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WkcyB5namzazMLShg6tQtS2xLtUOn1uXhB52w/vW+S4=;
 b=N3RAdLW3q/eh3dgOQwlZl4DhmB3Ou3ae5Bqj7LaNSkHzmsPzpF3Bjl4+5dmYaqTXuH0bDIUU9
 8/0JeuRSKbdA6VaeQeJ80kMWxigbimQTLMrI/7Hlq7pr/zmOK1LiUkK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SMD RPM interconnect driver requires different icc tags to the
RPMh driver. Add bindings to reflect that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/interconnect/qcom,rpm-icc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,rpm-icc.h b/include/dt-bindings/interconnect/qcom,rpm-icc.h
new file mode 100644
index 000000000000..ef61006c9c58
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,rpm-icc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
+
+#define RPM_ACTIVE_TAG		BIT(0)
+#define RPM_SLEEP_TAG		BIT(1)
+#define RPM_ALWAYS_TAG		(RPM_ACTIVE_TAG | RPM_SLEEP_TAG)
+
+#endif

-- 
2.41.0

