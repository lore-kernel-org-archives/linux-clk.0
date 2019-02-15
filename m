Return-Path: <SRS0=KID9=QW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5527FC10F07
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 02:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D0FA2192B
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550198576;
	bh=XX8gkTWfydJ2h2LV3tckAphKi35817hiwi8/g5LwD/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tvvy7+0ofStO/KMOPs/34BMlzZ5Wnnalk0rQdCJ308cHh8vy08obfJ97RXGg2Voak
	 LiM/5px7VQ7/FNYp/VIHcQi7hfVwkeWFnMITv2NHjlPB9boZNpvnou+Cg73woDgELm
	 Jzid5CLFmnAVReKK1S6jaDjjDgDcqCLsPxy9Lznc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbfBOCJI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Feb 2019 21:09:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:49330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731501AbfBOCJH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Feb 2019 21:09:07 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AAFA222A1;
        Fri, 15 Feb 2019 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550196547;
        bh=XX8gkTWfydJ2h2LV3tckAphKi35817hiwi8/g5LwD/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NPlXVMDGxp6gZcK5A+5KQdK3vLNCFHrfnuKAAD9MkQcAniv4N/BPl9mnDLBfznlmh
         xPEBtFb+BFpI0CWitpgKRoN89PClMDtiScmnsJdSL0EUYamgQYQVqevc2WLuxZOydX
         aTCX7Ly9AaK+wKPxJUMCilsQyUfU7ERmk+ur/XWk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 07/77] clk: tegra: dfll: Fix a potential Oop in remove()
Date:   Thu, 14 Feb 2019 21:07:45 -0500
Message-Id: <20190215020855.176727-7-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190215020855.176727-1-sashal@kernel.org>
References: <20190215020855.176727-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d39eca547f3ec67140a5d765a426eb157b978a59 ]

If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
should just return instead of dereferencing it.

Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 269d3595758b..edc31bb56674 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -133,9 +133,11 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 	struct tegra_dfll_soc_data *soc;
 
 	soc = tegra_dfll_unregister(pdev);
-	if (IS_ERR(soc))
+	if (IS_ERR(soc)) {
 		dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
 			PTR_ERR(soc));
+		return PTR_ERR(soc);
+	}
 
 	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-- 
2.19.1

