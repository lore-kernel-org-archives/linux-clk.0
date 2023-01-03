Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29802C54EBC
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237881AbjACOz1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237944AbjACOzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:22 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD914FD19
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:21 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id s25so32092751lji.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Blotrti0ge/4Qx87QAt1BInr5zZfEl1NfBEa60STC2c=;
        b=pjS6LufsM2bG7VD3mO60vlYQY1iyPLGx4suMUisX/Qx5iP/ksDtuEfbf0YQTlxvPAW
         xw7KouJgXQL0BKSo/ZPMLH0+NZTgqY3l8XlqKDbKngAwWKurTzllm4hogjAgMjY1NO8c
         mZlDPYA2QC1fNOJJIZh0mjq9NsNoYYYKNBasZoBMTU5+JCOMkpO0Opa0fIqewwpZRm8S
         4sM5YfJ6HYdmtqpbZVPWWeWi5sgcX2wMtTLdyrkd7rMgx+9RWB1ldoUMHE+Ol69rILx0
         /U/+J+1OacPpMMxqKmfSvM70tMxuXxdomM+SNimibhGV12rImnJRq454nFehlSZliSJi
         VuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blotrti0ge/4Qx87QAt1BInr5zZfEl1NfBEa60STC2c=;
        b=ueTgEXONAasqRluNjfdG7Y0DVAbdGS+Fmm3epdj+2ZeIc0VjtCswpwosecCGXvs+t9
         haLAe8YzOarhB8HCjyuWNELaNZrv3WeACg/mfEpXqUtvE70e/CLF1ZulfKNUO/w2E9/5
         cryE2DlLnofS84XJORwM3QV8R0W8e5SKQDfOTnzFRJgfdh1cQ+57wujQZEWRR1UbYTJT
         86i5tNeLJtLo/5y6/R6gyir6ZNMRAzjRs33PBk//8pB5CPyYmxqYoTDmjrjdDb1BEE/z
         MozSjq5KtINXkbCCoqox7n5F1chRg9fOXosJwSD8MRGJjznur+btN8F/h2NMOWPz0aSM
         JrMA==
X-Gm-Message-State: AFqh2kpQ7xZEGrZX1mUWxgQaFfYxsDtmhIMrRJqCUl25UuLRj1BSpWXc
        xkq1TeYOAIJDhMzg2EZMAA1E9Q==
X-Google-Smtp-Source: AMrXdXsdPi2eY33kbYrPZyfTvVMpiOXQpYXyiRtWklqA6siDuvNAg3rD2wjrf7/3XlHn6EQXLtkgeQ==
X-Received: by 2002:a2e:3111:0:b0:27f:d8c9:3f30 with SMTP id x17-20020a2e3111000000b0027fd8c93f30mr4783454ljx.45.1672757720150;
        Tue, 03 Jan 2023 06:55:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 03/21] clk: qcom: dispcc-sm6375: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:57 +0200
Message-Id: <20230103145515.1164020-4-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sm6375.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index 5ce9198ad611..caa1b90a5ff2 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -252,8 +252,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
-- 
2.39.0

