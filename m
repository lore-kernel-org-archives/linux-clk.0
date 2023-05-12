Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581A0C7EE33
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 21:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240341AbjELVSG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 17:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240368AbjELVSE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 17:18:04 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FE1172A
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f14468ef54so11865882e87.0
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926250; x=1686518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzmUcAFcZdFCEwI+FLrPfYHPtwRzIfK4E9usXEvVYb8=;
        b=v38/vxzK5jaH75RzK63E2BXlZYOPxXPIJ0jBgXpA6YlIA8dLH3OzwUsqnAKMMGBvRn
         ur/s9AUlgIPmjlEgbG+EJjUMQOkrdswspoT3haonzgdVrO2n40cz6iSj/Ceb5laNZNaG
         BOil7XnTsOh8ie2bQsYdLf87cdRCFVQgsEfRLDfCkRZA+Smr/ir/NylbkW1p6vz6KpzI
         SjqSTaIapJRmqHqWdJZIT40uPj3kDQ9fNu8YcyqRUlzTG4OgmE1heYMFruZoujwrnpmA
         Wf9p7X9FnQXTViWWy7O9Ibe7fmdrwFhZLjHgQnkrXZrvJUpXtMTN2+QHVsdO/yzv6r4c
         7g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926250; x=1686518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzmUcAFcZdFCEwI+FLrPfYHPtwRzIfK4E9usXEvVYb8=;
        b=eyvOYtkhR/gJyhSmqE4O3NCNead4OTB6+OjXem2JKm+aR4f8/dMhGdagAVRSGnuUKc
         3EQNTT8DsFc2CXL+/s0zpogSbYd/FuJ+u5scty+zTPdcZ6/vkfj4wZPUI4Vj2a5gGh8X
         FxdVd1eyHUQi3F4idymAzVAOkFx0p2U5UkjDfSEjtFbXYe4neVo+CTl7xhxgRzbl2Gz6
         hIsQ0DlUCj0pC3a/4azK3y5AB9wYJI1e9oYM38z0X98DoktAaSQx8cxOyppXk7YUrt/P
         OkwgWielzKUUYoWlSBdgH+bOjbTDmib/Cd3I6sCDBhgQwttU0p6/hmTYW90CiG+z7B4l
         pSqA==
X-Gm-Message-State: AC+VfDxrHiwT20ws+dDvb2t9crViarmlRz0U3agBMF63otrLbBscpAdv
        y5Rn+LyCvHj1y2Q6D1sqCR2xtg==
X-Google-Smtp-Source: ACHHUZ46eRDo9P9WxhvyKJ758+LgKJZGN65bHVVNFUh3vag6+Ol8UL7FiZ/n5sMeglC3RRwCsR54mQ==
X-Received: by 2002:a05:6512:142:b0:4f2:5001:62a7 with SMTP id m2-20020a056512014200b004f2500162a7mr4378317lfo.60.1683926250657;
        Fri, 12 May 2023 14:17:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:30 -0700 (PDT)
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
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/10] dt-bindings: clock: drop qcom,lcc-mdm9615 header file
Date:   Sat, 13 May 2023 00:17:19 +0300
Message-Id: <20230512211727.3445575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The header file for qcom,lcc-mdm9615 and qcom,lcc-msm8960 is the same
(as well as the drivers). Drop the qcom,lcc-mdm9615.h in favour of
qcom,lcc-msm8960.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lcc-mdm9615.c               |  2 +-
 include/dt-bindings/clock/qcom,lcc-mdm9615.h | 44 --------------------
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h

diff --git a/drivers/clk/qcom/lcc-mdm9615.c b/drivers/clk/qcom/lcc-mdm9615.c
index 8d243e880d95..c17caffdc349 100644
--- a/drivers/clk/qcom/lcc-mdm9615.c
+++ b/drivers/clk/qcom/lcc-mdm9615.c
@@ -15,7 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/clock/qcom,lcc-mdm9615.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 
 #include "common.h"
 #include "clk-regmap.h"
diff --git a/include/dt-bindings/clock/qcom,lcc-mdm9615.h b/include/dt-bindings/clock/qcom,lcc-mdm9615.h
deleted file mode 100644
index 299338ee1d88..000000000000
--- a/include/dt-bindings/clock/qcom,lcc-mdm9615.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014, The Linux Foundation. All rights reserved.
- * Copyright (c) BayLibre, SAS.
- * Author : Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_CLK_LCC_MDM9615_H
-#define _DT_BINDINGS_CLK_LCC_MDM9615_H
-
-#define PLL4				0
-#define MI2S_OSR_SRC			1
-#define MI2S_OSR_CLK			2
-#define MI2S_DIV_CLK			3
-#define MI2S_BIT_DIV_CLK		4
-#define MI2S_BIT_CLK			5
-#define PCM_SRC				6
-#define PCM_CLK_OUT			7
-#define PCM_CLK				8
-#define SLIMBUS_SRC			9
-#define AUDIO_SLIMBUS_CLK		10
-#define SPS_SLIMBUS_CLK			11
-#define CODEC_I2S_MIC_OSR_SRC		12
-#define CODEC_I2S_MIC_OSR_CLK		13
-#define CODEC_I2S_MIC_DIV_CLK		14
-#define CODEC_I2S_MIC_BIT_DIV_CLK	15
-#define CODEC_I2S_MIC_BIT_CLK		16
-#define SPARE_I2S_MIC_OSR_SRC		17
-#define SPARE_I2S_MIC_OSR_CLK		18
-#define SPARE_I2S_MIC_DIV_CLK		19
-#define SPARE_I2S_MIC_BIT_DIV_CLK	20
-#define SPARE_I2S_MIC_BIT_CLK		21
-#define CODEC_I2S_SPKR_OSR_SRC		22
-#define CODEC_I2S_SPKR_OSR_CLK		23
-#define CODEC_I2S_SPKR_DIV_CLK		24
-#define CODEC_I2S_SPKR_BIT_DIV_CLK	25
-#define CODEC_I2S_SPKR_BIT_CLK		26
-#define SPARE_I2S_SPKR_OSR_SRC		27
-#define SPARE_I2S_SPKR_OSR_CLK		28
-#define SPARE_I2S_SPKR_DIV_CLK		29
-#define SPARE_I2S_SPKR_BIT_DIV_CLK	30
-#define SPARE_I2S_SPKR_BIT_CLK		31
-
-#endif
-- 
2.39.2

