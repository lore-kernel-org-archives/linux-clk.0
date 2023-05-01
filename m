Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E24C77B7C
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjEAUeJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjEAUeI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:08 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306902710
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:06 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso28911551fa.3
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973244; x=1685565244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6pwZPYafkVn3VJcImsGxRtQe9a8LArqEXLVR3gpAsE=;
        b=HpOv5vH2ozdsE0yuJQImLODjhbc6FD9xdzjd2Bdnqu4LJSZPcHfzYfo5yHtWnHDRHs
         GZEJJ3104sY8ctK1GkoMc2ONgr0ejtorvokFZnhAkUM8nO6RvZA5MGQSrBEJ4to+Ig4W
         2U25mQb3qHZA90gJkGUwBla9OSb3sYHeK+fOsoV2sVd9WQKdiG0mGfEc8AcWsQyrO1Hi
         tFaqET2pCgCmVEbtPV31v1pGgVTBepqIvcAyTPYvPsWzb0RXC/l82T2CZtFwBvSp+84c
         NX+jEtMk9TSJ8YxuDP5Ly6KmuraOUpfCEvyD+BkVfzu4ZxbflEHD6JnMy3z1JsEISQ8D
         8anA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973244; x=1685565244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6pwZPYafkVn3VJcImsGxRtQe9a8LArqEXLVR3gpAsE=;
        b=NgM1SMlcOC88USo5yYGU86aTDx8DeRKsf61uY+siO6ct7PleXt258Zss2kF8WiE8G0
         TrG84ozqLjUSerHzxmf+5XtSMQG+jowLy87lV8lJ2ZGPJT/LIPSoCjgAiHc2G+rPGpcv
         V0cAywwwiXNbdFbk6vcChwbYiDzGCEfMyS/ItRA6N/67BdgucDuEjPd+yIQx1f2sjzYA
         IC1zC2mce4pbQgIcXiX/73hM2M6i7gV4voYINR5cLsc6Nni/JJI97AsWVdib9e6MAsyB
         h/bjsfaWfSwPx0xr8GScRuLmZ+ucH5zgob4b7AcmX/9zBB1onu6AjcyWqP2v9rcfTUEP
         YdmQ==
X-Gm-Message-State: AC+VfDzEK64YuvZsRzj5fMTHgZIVyXr8qhiz3PD2UOBGJYQgBj4TzsGt
        URv/eKovIOcwahAWLp8a3kUpbg==
X-Google-Smtp-Source: ACHHUZ6UbBO/jGKTlLgz1bOH+yksekj7YIQ6Xo9XUHLiLxhFW+ReP1rTS93f0yiVIvgQCgK0w+W8RA==
X-Received: by 2002:a2e:3e0e:0:b0:2a8:a916:6b1c with SMTP id l14-20020a2e3e0e000000b002a8a9166b1cmr3913312lja.4.1682973244527;
        Mon, 01 May 2023 13:34:04 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:03 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH 02/10] dt-bindings: clock: drop qcom,lcc-mdm9615 header file
Date:   Mon,  1 May 2023 23:33:53 +0300
Message-Id: <20230501203401.41393-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The header file for qcom,lcc-mdm9615 and qcom,lcc-msm8960 is the same
(as well as the drivers). Drop the qcom,lcc-mdm9615.h in favour of
qcom,lcc-msm8960.h

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

