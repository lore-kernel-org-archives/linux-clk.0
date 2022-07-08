Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1813CCA480
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jul 2022 13:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbiGHNy4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jul 2022 09:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238356AbiGHNyz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jul 2022 09:54:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F26E2A701
        for <linux-clk@vger.kernel.org>; Fri,  8 Jul 2022 06:54:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t24so36514788lfr.4
        for <linux-clk@vger.kernel.org>; Fri, 08 Jul 2022 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=tllR9CHKoo+1RaUDvcQwzF7LiqVYGALP3A/a/+Asc6x59lxzNkw5PlKJjIfbvWPAWW
         9CXmwKDcCfaPJiRqylRUxSywesFV5OQNxe7npy51hKnx45vQavBCLzyiRTpaCkErrz0P
         HfoAj7Ldxkz7UlDrza0GGMKyJbBaM3d4jB6V08jecF3hw5nDP85nxNzxop3CkYcG21O5
         eyLoP2ozjmLaTavfx4PT7YoowAPO3sOsbQQQzRxqqQgeROH0n07V6Mwa0Zwl4/gueiGO
         uMST0a8iIkM5g9jq+m2aeX0cjsYoTZHk28gKiDQ4D4Bp2hEvNOOFLb/08I/9OcieqO6O
         X2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjR+2F8VDVzWZtZbL2H5UO7CpeJEqxrSNDvsv43xJOY=;
        b=iXaBKKfr55EfpQVNGBryFVXt15KJfXxcTmnHqGfaDpyrcDunzxHH/ZrYEQpOsWjjbL
         EqIu1c0gu3L/cbSSbdawQWlUykqiOaNcU3XeCF5CNJ+9ErloeQsZbB2+QSscYFCTqPzs
         uYxhtzuSZ16P1mX0XSvELp7lqbHFxWzy1uXr6UQ1ubTnLVhzVQ9p40/lAdE8ZqJWOYzq
         X52QP7yZhIaM+Vv1YMOerhfW63Wo7f4CwYi7by+bqNmTnFGSisApHlFUFKHBCqjvLiuB
         KidAOmuaJLueDTs+GRUE4mlRhdMBXsGXEpd7UZM5Z23elIijOs/Zzj5xeJf6ta+DqmCB
         d0Zg==
X-Gm-Message-State: AJIora+lstraSxW1SafY8VS0HEMBoW1RmRGU3J2Dg9da6VTLw0mkvd7+
        Ngvnksebhcp0DpGZtWrMQ50IKQ==
X-Google-Smtp-Source: AGRyM1ueiCl2TJwWKsZU0JOxrMmww4iJVFJmo5yk2nZiJigX7CiUL+rANkwFfa0/dKx/t7m5rW6kcw==
X-Received: by 2002:a05:6512:228d:b0:489:2309:fd63 with SMTP id f13-20020a056512228d00b004892309fd63mr2682898lfu.232.1657288492993;
        Fri, 08 Jul 2022 06:54:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm7428352lfs.190.2022.07.08.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:54:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 1/3] clk: asm9260: use new helper for fixed rate clock creation
Date:   Fri,  8 Jul 2022 16:54:48 +0300
Message-Id: <20220708135450.2845810-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The __clk_hw_register_fixed_rate() is an internal API, which is better
not to be called directly. Add new helper to create fixed rate clocks
using parent clock accuracy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-asm9260.c    |  6 ++----
 include/linux/clk-provider.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
index bacebd457e6f..0609b661ff5a 100644
--- a/drivers/clk/clk-asm9260.c
+++ b/drivers/clk/clk-asm9260.c
@@ -276,10 +276,8 @@ static void __init asm9260_acc_init(struct device_node *np)
 
 	/* TODO: Convert to DT parent scheme */
 	ref_clk = of_clk_get_parent_name(np, 0);
-	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
-			ref_clk, NULL, NULL, 0, rate, 0,
-			CLK_FIXED_RATE_PARENT_ACCURACY);
-
+	hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, ref_clk,
+							0, rate);
 	if (IS_ERR(hw))
 		panic("%pOFn: can't register REFCLK. Check DT!", np);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 72d937c03a3e..659ef5a77246 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
 				     (parent_data), NULL, (flags),	      \
 				     (fixed_rate), (fixed_accuracy), 0)
+/**
+ * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_name,    \
+						   flags, fixed_rate)	      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
+				     NULL, NULL, (flags), (fixed_rate), 0,    \
+				     CLK_FIXED_RATE_PARENT_ACCURACY)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
-- 
2.35.1

