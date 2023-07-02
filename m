Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D0EC04FE0
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjGBRnS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjGBRmz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:42:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E166E5E
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:42:53 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69f216c73so53860251fa.3
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319772; x=1690911772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=A8sk0OqTujjxdlawmS0vVbaaMAgof3AMnwqI4XTA1+yx+ZTAb4dFLMQzZmrCaRmoZU
         B6fnyDqECtmYY2x7iOVQV9MqEkmnoHkRSsjKL493qjjCbF/udjoH+PH9JAk2a8qFh++T
         lASK3456CcgN5qS0LT0VVPiB4+HJBkWQqc3Jxo057kJjkAmzvAkyVWfvaNWdxx1ds0gN
         jPzVSKfBjrWNYzudoFXlwK8jeMfL8NnTbSogWV+DKJW3Mi7Am0iYbWnOcCHTIlYG2BhE
         TuqkPjmnLKeT6TxBFX5ciOsa+vNmhVzuZYvgjft7M00bbKomo+rDI3UJmzVCeugL2Cl2
         dC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319772; x=1690911772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=Nc0RS/8ZnCCzVxHLFdnfjQzpjds8AlGs283n7W/dresExvDkJ6NolGGl9aTAOSqriS
         BgFSufFLjxnnuWVyVyQtzXuzMK5Nog+/aYK+N1McH+gxwqrEiYo2fkm/HNR7Gze8Dh4F
         sWj5SZ+sG7gioiWA6abwWhtiaWYyGhWL1/7KyAWxjHptN77FjthqI896hZsQY0T0uaVn
         NVOsOomv1ARiutfjpfoBIBnA78dYYH/AKg/CPbiDm/zlwvSQLYrQD0vhLwkjpjd5yAYn
         81PxcK9arP23x3SoMSOx6e22+/3JJFe99zyngrW3auarLRUO5TfjLgwywRFxYdUoxDQl
         lylQ==
X-Gm-Message-State: ABy/qLb5+MNljpoDl73a6tKJQkzeh8GXve66c8q49hvURdVuT2DV6hcK
        4UoWDONSVEyMOy3D5bEOW9tusg==
X-Google-Smtp-Source: APBJJlGTFvuJJ9r9y+g/OUGeFvITjap5CXUPpRSEXhi7z938e4QK2sSQWSoD41CdGoXNGm5byh9B0w==
X-Received: by 2002:a2e:7214:0:b0:2b6:97bf:18a9 with SMTP id n20-20020a2e7214000000b002b697bf18a9mr5040200ljc.37.1688319771784;
        Sun, 02 Jul 2023 10:42:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 04/28] dt-bindings: clock: qcom,krait-cc: Krait core clock controller
Date:   Sun,  2 Jul 2023 20:42:22 +0300
Message-Id: <20230702174246.121656-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define bindings for the Qualcomm Krait CPU and L2 clock controller. This
device is used on old Qualcomm SoCs (APQ8064, MSM8960) and supports up
to 4 core clocks and a separate L2 clock. Furthermore, L2 clock is
represented as the interconnect to facilitate L2 frequency scaling
together with scaling the CPU frequencies.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,krait-cc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,krait-cc.h

diff --git a/include/dt-bindings/clock/qcom,krait-cc.h b/include/dt-bindings/clock/qcom,krait-cc.h
new file mode 100644
index 000000000000..9d181873c414
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,krait-cc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_QCOM_KRAIT_CC_H
+#define __DT_BINDINGS_CLOCK_QCOM_KRAIT_CC_H
+
+#define KRAIT_CPU_0		0
+#define KRAIT_CPU_1		1
+#define KRAIT_CPU_2		2
+#define KRAIT_CPU_3		3
+#define KRAIT_L2		4
+
+#endif
-- 
2.39.2

