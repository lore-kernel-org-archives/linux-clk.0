Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637A1C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 17:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 281522147A
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548697235;
	bh=Wsbk8JVax5YUHkWy4GDS8CYRJ3+BPQyWJRCBdyga4nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=0LmjRF3fyVUEz0gB1urIWg+x6vP5JrFZBpjZm/g0TNblBzk89fr0iPc36rH+XMgBi
	 yxPBUNA1MDxAfhWGYWtyeceOqwCzFUQvoRagccCjWKWakkMgdPasrIkdtrFNmgTiS6
	 ybyPUiVSy8o5AiolGpBtlwCq/jQlqPGeWpfSdvE4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbfA1PwO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 10:52:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729228AbfA1PwN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jan 2019 10:52:13 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10BF020880;
        Mon, 28 Jan 2019 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548690732;
        bh=Wsbk8JVax5YUHkWy4GDS8CYRJ3+BPQyWJRCBdyga4nk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=atlvO6MUB0K8gHVTsToYqwkM11l73atcZNLRA1F1gCCrE29Heyrdms8np5wgM+T+u
         IGOSCjkTIfIpcTIkmXP/cVn8SovzStxorv7aiPDxJ7RzZ159tb0uGOD66oQamWzhET
         6lPMmhJUSF9yQGAJADuDf6JiwHqoikt4ye+roZfg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 177/304] clk: qcom: Leave mmss noc on for 8998
Date:   Mon, 28 Jan 2019 10:41:34 -0500
Message-Id: <20190128154341.47195-177-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jeffrey Hugo <jhugo@codeaurora.org>

[ Upstream commit 12eced09cd301aa7b1868a67c50a651c2aacd363 ]

Similar to other qcom targets, gcc_mmss_noc_cfg_ahb_clk should not be
disabled.  Any mmss access depends on this clock, and its been observed
that enabling mmssnoc_axi_rpm_clk with rpmcc results in an implicit
access to mmss and will crash the system if gcc_mmss_noc_cfg_ahb_clk is
disabled.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Fixes: 4807c71cc688 (arm64: dts: Add msm8998 SoC and MTP board support)
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 9f0ae403d5f5..cb714c3e2924 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2042,6 +2042,12 @@ static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_noc_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			/*
+			 * Any access to mmss depends on this clock.
+			 * Gating this clock has been shown to crash the system
+			 * when mmssnoc_axi_rpm_clk is inited in rpmcc.
+			 */
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };
-- 
2.19.1

