Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19532C47083
	for <linux-clk@archiver.kernel.org>; Sun, 23 May 2021 21:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB315611CE
	for <linux-clk@archiver.kernel.org>; Sun, 23 May 2021 21:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhEWVRe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 May 2021 17:17:34 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:51877 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhEWVRd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 May 2021 17:17:33 -0400
Received: from TimeMachine.localdomain (bband-dyn255.178-41-232.t-com.sk [178.41.232.255])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C762C1FA70;
        Sun, 23 May 2021 23:16:04 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH V2 2/5] rpmcc: Add sm6125 compatible
Date:   Sun, 23 May 2021 23:15:53 +0200
Message-Id: <20210523211556.731976-2-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523211556.731976-1-martin.botka@somainline.org>
References: <20210523211556.731976-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a compatible for SM6125 and assing correct data

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
Add commit description
 drivers/clk/qcom/clk-smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..8200c26b968c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1070,6 +1070,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
-- 
2.31.1

