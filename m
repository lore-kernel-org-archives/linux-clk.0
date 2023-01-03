Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D22C53210
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbjACOzW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbjACOzV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:21 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8A1FD0C
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:19 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s25so32092649lji.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f7Q8Ej3DlZV14zViS3TK1LhXbsnOpnbgzTShiMYtUo=;
        b=kOpnFoqwOXUm15m9UsWg8qqIPy1lchV8PahHl+myh1yYFZsT3oymenK9XD3AurTCgh
         z0M/dGN+1we4/WYbqXcsrIwyO71XT3DM26k+ONAHXz3v3MH6t8D0L+mICoIWVAMX2uWH
         Ytjy2CiRQ8g+I3zmHGG67LO/BDx1ViLcMQfo7LX4T8xh9eA36Q2bsV3RWTCxux+PlzR0
         y9KdK5FBB2Cdb8RJ592+/RrHoqpc2CZH/AE0ON9kpFdqvtPZ98VhuTXDxWwuNZODoNW7
         2sTeR72xL2+2Co9kaoLm35xiKO1wrc6UcaooP4Q0sX47kvhOZDhE7u391kQkX3znx1Kg
         UjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f7Q8Ej3DlZV14zViS3TK1LhXbsnOpnbgzTShiMYtUo=;
        b=ZaAWlGfAZKe7BT4jOnwul3o/RjQcfge9SJ6PT7IUyM4IeF29lTdXT1lib/sgmkGTUf
         u1TH6LaR2J/pMNorIajHhfAh1t8Gp+pW5XwdPyYmlOoMpNILAWNVUld3g64fMqozfOGP
         npc9+3U1V8nQmvF20BhPwcmTXvV9HET5PKuTg+ehTUbNGfC596gi2Tw7LaozD8eWL3GQ
         oMMyPvQZVfOOZ0YzkoV7lOrur1d5oeZQwDRNPhtpJq97N1Q6iU7QrPkNSU6uFtgIkuXR
         ErtTwpyYC6pUhYK3bWb9H4CZ6m07o/OIaL69ew0QSReBqvjBlS/2yL4YuVA7VWqfJqo5
         wDGA==
X-Gm-Message-State: AFqh2kr5CyESgV9T/2ufDravg21hVl/7aJNR+LleoFrXz0cvnzS6QsHm
        FXEQ2Ys0bm4EZ8FUhV06TPmFXw==
X-Google-Smtp-Source: AMrXdXsX6s1looOAXWapnq1IcI5oIVK61gr3g9y7cEAS8lacYhVc/l+ue7CwWCY2sOdTXcJpPt9yTA==
X-Received: by 2002:a2e:b0e4:0:b0:27f:b636:94a1 with SMTP id h4-20020a2eb0e4000000b0027fb63694a1mr8869423ljl.21.1672757718236;
        Tue, 03 Jan 2023 06:55:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 02/21] clk: qcom: dispcc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:56 +0200
Message-Id: <20230103145515.1164020-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 5d2ae297e741..9536bfc72a43 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -351,8 +351,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -365,8 +365,8 @@ static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dp_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
-- 
2.39.0

