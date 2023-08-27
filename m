Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92680C83F1B
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjH0LvL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjH0Luo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:50:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F6D1B1
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5007c8308c3so3625414e87.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137037; x=1693741837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=kVrCWnDlujG4mHtYucB+dfb+lZ8IoCUgXize2o9ICAfAWnp9uyyEB8CUU76ZXGeMY+
         fNyOJzNqMAawRUbImkbTI4VZrlzJZHHrnGZSCjbMAfB0GOwu4+khYb37OBIxwBPTEF2n
         uE4o1Fn9Ib6GdiaKozkNa+jaGiNfnsvmrp3Z+zNlc4JcHEURLr0fWrF3ndQgzz3lxYhS
         XPn1kR47nv169Wia2E2zfZvTk9zr3W8ZeLLBHCXKKr093UQRei405JlDP50Av85F5cXo
         2zgLmy9JuPsuvB+8lhD6MBHjwxxmwMLtevLevtUNSZVA16/4zkVA6gYpFi5C/Oa1boDr
         G9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137037; x=1693741837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=Tig4h+JRE81Ke8MnpPWhDmE31uVugh9m2Yc/I5DHkctbfcGOmFT5Sjqc8ORNfvt9uP
         8tWKskkrHIp2ZaMjfy5W5nzm2rUfxXibBKl4/iIX1Y5sgrHF8Vhm8bgfzx5vENG29+O8
         l84i1NSPiX7XwG7VcZxXBC02JmYjVALXbOLZtfHLeLUD6zdhaEGCoW/jypJ+vZdmonbi
         syrpk+KXpChPh7XhirvkMrThnZ8rf3G/9Xcx5fTN/cKaufow5frdC/YymJ25+7J7XLDR
         8O2PU7jhMJwjQ4IyfuFo0Y3tZsFbCAKNDQbPQXY8rTDMlh89EZ3lA6tjP9PjuCHJHMFp
         EC7Q==
X-Gm-Message-State: AOJu0YzB3DW9v2CpDA8TWACucM8P6Pe7B7jp5ttaElqS2Orua0kNq7R1
        MozwP5Pa+pyy8eDYJKFwnwgRVg==
X-Google-Smtp-Source: AGHT+IGt2xgmWwOY0CUsVtOQyV9nxdtxLsPQavPhWLMXNuZlLE1bY4JF0pl4U12XqJVuGZD0wQUyqQ==
X-Received: by 2002:a05:6512:114d:b0:4f8:67f0:7253 with SMTP id m13-20020a056512114d00b004f867f07253mr22826824lfg.49.1693137037268;
        Sun, 27 Aug 2023 04:50:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:36 -0700 (PDT)
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
Subject: [PATCH v4 03/23] dt-bindings: clock: qcom,krait-cc: Krait core clock controller
Date:   Sun, 27 Aug 2023 14:50:13 +0300
Message-Id: <20230827115033.935089-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
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

