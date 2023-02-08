Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCFEC6379F
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 09:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjBHJPm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 04:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjBHJPM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 04:15:12 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4051D45BFE
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 01:13:50 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id gr7so49558998ejb.5
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1uGzmih4+XMC1ZM4vKWiwVaIYhgM6+xBaQoDbrWO7U=;
        b=eUSojWA5vsVoS7jzaotrGXamGrceiL0MzZc0LM6sDjTdS6w7iANxGPT17wSGO0mcfC
         CabmBZiWdesqMmuwvRn1ooav4NqBoDNHx5u/lGmmFdzaVRf5nzBzdfJgPezRyBOe9H2F
         HfRnrtPQznIJR1TFtRiS4/7gheyHn1dYIPE/1zXcamzeJgakg2HEtTLuLGeNotAwoJgp
         0Br01MADkbHFFfuIfber35XmWJk10rFkzFlYufnl4wIc0UYbxAsI4Za75GrVXTEglPLF
         Q08zXVVFH4/8LUU35WBq2ldTJeheO3edhcC0DzkCIYGSaJmzSjar4pEXBJlC8InS2+oE
         TirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1uGzmih4+XMC1ZM4vKWiwVaIYhgM6+xBaQoDbrWO7U=;
        b=2RNdMxx1ahhJhRlnXm/SYKITRdR3hr9m+6iKeEhUmgAkbshUOCRq37kpecN8QoNYkQ
         ILbmwy6zhaiM0n9rZ+vtvWlRE2bndjhtNXWdNBUxQquL2p/kdY/8JoJ/2M8eGMCiKLsy
         HdQkXeL7VIxlGEiCMQaBKUbczgIYsLk+T/Sj1IZDO8a1fAVCz58+EJHh2h1EsukPkENC
         1wYzNmiAXSWulO3Lj9f9wConTnrjSDp4xz/OWtr/gA37+WNJwDaXacoA5A5L0VO5+T6B
         w6E85djdDq1C9MrYO/q6xFlE2odhPG0VFUoJiG3lYPYIfAdtkoZIrTJTSLQS4efF1LVU
         rZRQ==
X-Gm-Message-State: AO0yUKWmQTuQPLW3HEbS5hxN3PTwsih+TzAP1JboTyhkcDeHuV7dAfnQ
        Bc2z1SRvn2ASf/iFRxw4+f/ewqhYLD80BUKG
X-Google-Smtp-Source: AK7set+yYhaJxZaPCO+HxKU2LRX7NXQLrKK+DFOHRNvs73d8qgCtwV0QODtCus8q6sDo9R0WV6GGKA==
X-Received: by 2002:a17:907:c683:b0:887:d0e6:fa28 with SMTP id ue3-20020a170907c68300b00887d0e6fa28mr7936532ejc.1.1675847627522;
        Wed, 08 Feb 2023 01:13:47 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm7987279eju.220.2023.02.08.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:13:47 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/10] clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
Date:   Wed,  8 Feb 2023 10:13:32 +0100
Message-Id: <20230208091340.124641-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091340.124641-1-konrad.dybcio@linaro.org>
References: <20230208091340.124641-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

HLOS-controlled branch clocks on non-ancient Qualcomm platforms
feature SLEEP and WAKE fields which can be written to to configure
how long the clock hardware should wait internally before being
(un)gated. Some very sensitive clocks need to have these values
programmed to prevent putting the hardware in a not-exactly-good
state. Add definitions of these fields and introduce helpers for
setting them inside clock drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 55b3a2c3afed..b325f943c3e0 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -4,6 +4,7 @@
 #ifndef __QCOM_CLK_BRANCH_H__
 #define __QCOM_CLK_BRANCH_H__
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 
 #include "clk-regmap.h"
@@ -41,6 +42,8 @@ struct clk_branch {
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+#define CBCR_WAKEUP			GENMASK(11, 8)
+#define CBCR_SLEEP			GENMASK(7, 4)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
 						  struct clk_branch clk, bool on)
@@ -63,6 +66,18 @@ static inline void qcom_branch_set_force_periph_off(struct regmap *regmap,
 			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
 }
 
+static inline void qcom_branch_set_wakeup(struct regmap *regmap, struct clk_branch clk, u32 val)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_WAKEUP,
+			   FIELD_PREP(CBCR_WAKEUP, val));
+}
+
+static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branch clk, u32 val)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_SLEEP,
+			   FIELD_PREP(CBCR_SLEEP, val));
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

