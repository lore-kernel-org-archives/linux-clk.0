Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511B1C7EE2D
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjEAUeP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232818AbjEAUeN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F053435B8
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:10 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4efe8991bafso3986286e87.0
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973249; x=1685565249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCXshE3LSm11sHVAf0ozYtKAYbdoivwwYotK5GTV+xw=;
        b=IhjJFVvfnzmdwOgCUfOtEhLjgjlAAwtDudc28E1A7bllZtjDvsUSA0VUrAnFnJ2sL1
         T6WKxGlBsBlMnL5nXRPg+/mCfGvbxFLXZDy3al0H1YnOMbn2RJlI2xqxjLpWKu56cWrP
         Y7WK6Y6rb82kAcUmf8OueqmHrHa69sa45AhS/Ir7gBJQjYSyTu2b2dUl4MFS6OMANdp1
         kDB71fKiY4w2wYGwTCR9HApBmoRvbstlCjWQe1ovywq3iahDrD5R1+dz4/TrGSw39t2l
         CGI4abGI3U4Hh+wrNbGnyAM4wYH+CvqWM4oR5NcIJdd68IW6G3905UJwM+xXRr59794J
         uF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973249; x=1685565249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCXshE3LSm11sHVAf0ozYtKAYbdoivwwYotK5GTV+xw=;
        b=O0OOVGgWAuUyuJGu3m1aBXb64SZqXzDwMAIP7ARmxZszVq3AoBy+V4Nz4KDSlbl27W
         2OvlSpUhc8K2T0aU/ghm2X3CaZfO5EsssvS6DQ8u3v1E/niM6D4DkN4KvWGq+1/ax3B7
         YWDTHHhuVFRkUtGNBjtSvB8mwhBLcATJd1aGs77TY2xNILXiNZs0sf1YcfqyQlJSZWq0
         H7Aee/X0VHskf+2LJCQbyCT2eU5TVghW5tv8+exjC1LQvMVo9sbE/clryfcyeyuzRMce
         1Xo8a0vA14TX082zcFp4As9oHZYz6vDfaH1FflgON5aW7sbWu1gkuGNGNQgXOACPqnG9
         /wIQ==
X-Gm-Message-State: AC+VfDxeAXoHYxjpoiRnv1ozUgYsrIxmVuulzj7265EJRzfxDpKvfh/L
        jDC4bK/iXSvbeambSYCs5FLfzX+fCa8Owac0rfg=
X-Google-Smtp-Source: ACHHUZ60TqRdbs2aCYrf4EKbhZ9jTcqbs6GNXfuhCdQz1GYbvzzy5/B0XeiWxbWv3af4TPVMZYCMYg==
X-Received: by 2002:ac2:44d2:0:b0:4db:3847:12f0 with SMTP id d18-20020ac244d2000000b004db384712f0mr3501433lfm.50.1682973249157;
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:08 -0700 (PDT)
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
Subject: [PATCH 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Date:   Mon,  1 May 2023 23:33:59 +0300
Message-Id: <20230501203401.41393-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gcc and lcc devices have been switched to the DT-defined cxo_board
clock. Now we can drop the manually defined cxo clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index c1742113b0eb..a28df201e87d 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -26,17 +26,6 @@
 #include "clk-branch.h"
 #include "reset.h"
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "cxo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 enum {
 	P_CXO,
 	P_PLL8,
@@ -1618,10 +1607,6 @@ static struct clk_branch ebi2_aon_clk = {
 	},
 };
 
-static struct clk_hw *gcc_mdm9615_hws[] = {
-	&cxo.hw,
-};
-
 static struct clk_regmap *gcc_mdm9615_clks[] = {
 	[PLL0] = &pll0.clkr,
 	[PLL0_VOTE] = &pll0_vote,
@@ -1731,8 +1716,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
 	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
 	.resets = gcc_mdm9615_resets,
 	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
-	.clk_hws = gcc_mdm9615_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
 };
 
 static const struct of_device_id gcc_mdm9615_match_table[] = {
-- 
2.39.2

