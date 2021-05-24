Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F028C2B9F7
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 23:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52D346142A
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 23:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhEXXGF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 May 2021 19:06:05 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:46495 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhEXXGF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 May 2021 19:06:05 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 May 2021 19:06:04 EDT
Received: from localhost.localdomain (83.6.165.117.neoplus.adsl.tpnet.pl [83.6.165.117])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 469B53EAE8;
        Tue, 25 May 2021 00:55:04 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: smd-rpm: Switch to parent_data
Date:   Tue, 25 May 2021 00:54:55 +0200
Message-Id: <20210524225456.398817-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to parent_data and with that fix the longstanding issue where
if there wasn't a clock precisely named "xo_board", rpmcc would not play
along well. This started to show lately when "xo_board" was being changed to
"xo-board" so as to align with DTS naming spec.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..9204aae1867e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -39,7 +39,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_name,					      \
-			.parent_names = (const char *[]){ "xo_board" },       \
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = "xo",		\
+					.name = "xo_board",		\
+			},						\
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
@@ -54,7 +57,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_active,				      \
-			.parent_names = (const char *[]){ "xo_board" },	      \
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = "xo",		\
+					.name = "xo_board",		\
+			},						\
 			.num_parents = 1,				      \
 		},							      \
 	}
@@ -73,7 +79,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_name,					      \
-			.parent_names = (const char *[]){ "xo_board" },	      \
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = "xo",		\
+					.name = "xo_board",		\
+			},						\
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
@@ -89,7 +98,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_active,				      \
-			.parent_names = (const char *[]){ "xo_board" },	      \
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = "xo",		\
+					.name = "xo_board",		\
+			},						\
 			.num_parents = 1,				      \
 		},							      \
 	}
-- 
2.31.1

