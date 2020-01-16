Return-Path: <SRS0=DYql=3F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28681C33CAF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 17:36:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E98DC246BA
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579196174;
	bh=TTm/1xiXVzRgbqhITYxzac3zAfj+k/VG3pkN5qcTSUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NJgHo9mgmctuwlfZ449Z+S5P+BAXbNGDMPGBYxRtUvQ/ekq1/YcySP7T2fJuRamWT
	 SNbr5HW+FOyqudyY/GS6QV1XIM/TZIBUagxQXfEL4EiROTTBr/nh4R6w3AFwC6dHcV
	 N+kX1BH7fr49doiVlKvdYM2uePUHNbB25smVUBMI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405136AbgAPRfb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:35:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:49806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393082AbgAPRfa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 12:35:30 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26CD724729;
        Thu, 16 Jan 2020 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196129;
        bh=TTm/1xiXVzRgbqhITYxzac3zAfj+k/VG3pkN5qcTSUg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=no/7bI179iHlSsA4F/VlVu7gvZwdupzVdCLG4p6vNnBDGPQX5Jle6Wo+NSFqVjFv7
         0M5nEM/Cu6hJirhJYOdeqoEebfRdITvjSCQ2gbZ8w2I9Lj22n92GDxqLI4yCyAo6yR
         olvJOOTwIfaaupEim1Qi+UBPpXPZWqrFONdXKSmI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 034/251] clk: armada-xp: fix refcount leak in axp_clk_init()
Date:   Thu, 16 Jan 2020 12:31:08 -0500
Message-Id: <20200116173445.21385-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173445.21385-1-sashal@kernel.org>
References: <20200116173445.21385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yangtao Li <tiny.windzz@gmail.com>

[ Upstream commit db20a90a4b6745dad62753f8bd2f66afdd5abc84 ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Fixes: 0a11a6ae9437 ("clk: mvebu: armada-xp: maintain clock init order")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mvebu/armada-xp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/armada-xp.c b/drivers/clk/mvebu/armada-xp.c
index b3094315a3c0..2fa15a274719 100644
--- a/drivers/clk/mvebu/armada-xp.c
+++ b/drivers/clk/mvebu/armada-xp.c
@@ -202,7 +202,9 @@ static void __init axp_clk_init(struct device_node *np)
 
 	mvebu_coreclk_setup(np, &axp_coreclks);
 
-	if (cgnp)
+	if (cgnp) {
 		mvebu_clk_gating_setup(cgnp, axp_gating_desc);
+		of_node_put(cgnp);
+	}
 }
 CLK_OF_DECLARE(axp_clk, "marvell,armada-xp-core-clock", axp_clk_init);
-- 
2.20.1

