Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A7DC433FE
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 19:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJATEF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 15:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJATEF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 15:04:05 -0400
X-Greylist: delayed 565 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 01 Oct 2022 12:04:04 PDT
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6686D356CC
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 12:04:04 -0700 (PDT)
Received: from TimeMachine.lan (adsl-dyn13.78-99-1.t-com.sk [78.99.1.13])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 3AC351F541;
        Sat,  1 Oct 2022 20:54:36 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jamipkettunen@somainline.org>,
        Paul Bouchara <paul.bouchara@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: qcom: gcc-sm6125: Remove gpll7 from sdcc2_apps
Date:   Sat,  1 Oct 2022 20:54:31 +0200
Message-Id: <20221001185431.493440-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This removes gpll7 clock source from sdcc2_apps as it caused issues on the
device during testing

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/clk/qcom/gcc-sm6125.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6125.c b/drivers/clk/qcom/gcc-sm6125.c
index 0bd6bc54079f..9131469abde2 100644
--- a/drivers/clk/qcom/gcc-sm6125.c
+++ b/drivers/clk/qcom/gcc-sm6125.c
@@ -1153,7 +1153,6 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
 	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
-	F(202000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
 	{ }
 };
 
-- 
2.37.3

