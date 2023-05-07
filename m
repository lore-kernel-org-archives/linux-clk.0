Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6352BC77B7D
	for <linux-clk@archiver.kernel.org>; Sun,  7 May 2023 17:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjEGRxk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 May 2023 13:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjEGRxj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 May 2023 13:53:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F7E2737
        for <linux-clk@vger.kernel.org>; Sun,  7 May 2023 10:53:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac88d9edf3so29733641fa.0
        for <linux-clk@vger.kernel.org>; Sun, 07 May 2023 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683482016; x=1686074016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfjD+nhpwNlgeLxaYqdhE5T1OFGvqPPFvhrWYJ9f1lc=;
        b=Enin1Yq86SSr21WwjrXXnKTANl+Bbo917juyLyLF2mpeBJSDU5KPaxrHcjchVliFID
         dCgMNsHYRBAwrSFUu+10EZ1BBlJTtO8E001V2ogMRcNVZIbiBKgJaAmJfNT/aHa8aTQh
         9mPSG69Pq/gKo5ct7n08EMhU6b1xF5vVOSOuIPtJ7rpxvPpEZ9tyryOgSWa2x6ppn8EX
         +Rc6M1BwWepZLqYe0v7/jvb137/1OnRHiaVb/TZGWGtHBkqKvWw6ssRgNu5k/oOJOXHL
         w4bZ1xL9JvsQLCD81HzjchzQyg2Glch70GetQ8LiJtyf1p0/Nx1JGLNcK99p+LWRoepT
         Hc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683482016; x=1686074016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfjD+nhpwNlgeLxaYqdhE5T1OFGvqPPFvhrWYJ9f1lc=;
        b=J/23HgcC1GiyEiMsJCqI0Zy+TVsAZqyYzRwAZ6EaOVYllpR2C27FApxur9O7q5aQQE
         qh1Qt9SI4e11Yc736jYTdSMXUbb6dSRc3ogmDBRrrrZyqz045xOnclw+Y6LR/JFzMEXy
         FYz4eiSCf+USGOFZBi/8ZK+SOV4J9Vr/42PYc144tO3aHNRp53cL/a6CMYOtn3TM12GX
         uFcYac3GKEgzM8GHn6CeLvdVMEhbwKR318yaDJk6WeXVPmLsvuFIgu0BCp5EL/j1xSvh
         y//lIU6PXK/UTjtKfSCsEcLlM9hkdbYY4Ro/z/ddnGDYLvE6LE9TIdEb3yacGteMgUdw
         hEng==
X-Gm-Message-State: AC+VfDzQzB4Qo54OVa0mzA7qg76qQOd+JfXEYoO822sR/Tqoj8TilyRn
        EnSP1NWjWwk93S+SeJnLzzazyw==
X-Google-Smtp-Source: ACHHUZ5WTuEFXd09rjrEA3r6HUKx0bUzbhV88Honm2eb1pIyFFx/J6O1o2CaH3LPo3RwIKgdFFzyGA==
X-Received: by 2002:a05:651c:1032:b0:2ac:8283:b67d with SMTP id w18-20020a05651c103200b002ac8283b67dmr2317372ljm.25.1683482016320;
        Sun, 07 May 2023 10:53:36 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e9850000000b002ac8e6d54b7sm883616ljj.42.2023.05.07.10.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:53:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
Date:   Sun,  7 May 2023 20:53:34 +0300
Message-Id: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The mdp_clk_src clock should not be turned off. Instead it should be
'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
using the clk_rcg2_shared_ops.

Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 4273fce9a4a4..aa29c79fcd55 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -485,7 +485,7 @@ static struct clk_rcg2 mdp_clk_src = {
 		.name = "mdp_clk_src",
 		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.39.2

