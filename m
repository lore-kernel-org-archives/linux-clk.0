Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4804CC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 11:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FB2521738
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548676580;
	bh=f3lxgKhF5Et41sfz+Bweyn0o307QENkvpp62lR482mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xQTgYGYdXBd22uanAciaayVDpHUCuMchnhwX2lb4xsqx79vofktRa0eXdfpvw9Z5A
	 13kQ223rGNBXWamMh5Ws8xeyRc5Anl/brad2cselj9NgsyE6Iq2G6WyPsNADEHw/Pm
	 AMvsA5G4kCxZpiCW6aPR4zVBQ1bYuU7APU9GPu2o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfA1L4O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 06:56:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:34250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbfA1L4O (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jan 2019 06:56:14 -0500
Received: from localhost.localdomain (unknown [106.200.228.251])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A23B21738;
        Mon, 28 Jan 2019 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548676573;
        bh=f3lxgKhF5Et41sfz+Bweyn0o307QENkvpp62lR482mE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=phE01TLNGPIl7vvyPKyB+ZNrL+FuPEpohMrRjK56EOMlyjGRzIY4NK+LaYRYv4uV0
         z5tD0QMSqmV+dJvNVUcCk4Ss3JpQ59j0InOUopDtMprO3s6tLfiNpC5Cdm8HIlUYdB
         fiY1gZlVtj915/LNvCPyMn51UESyZVZTYKaypHpo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Khasim Syed Mohammed <khasim.mohammed@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/2] clk: qcom: gcc-qcs404: Add cfg_offset for blsp1_uart3 clock
Date:   Mon, 28 Jan 2019 17:23:59 +0530
Message-Id: <20190128115359.30039-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128115359.30039-1-vkoul@kernel.org>
References: <20190128115359.30039-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The CFG/M/N/D registers are at an offset of 0x20 from the CMD register
for blsp1_uart3 clock, so add it.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 64da032bb9ed..493e055299b4 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -678,6 +678,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.cmd_rcgr = 0x4014,
 	.mnd_width = 16,
 	.hid_width = 5,
+	.cfg_off = 0x20,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
-- 
2.20.1

