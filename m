Return-Path: <SRS0=bWzc=VX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004C7C76191
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 13:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C22BC22CE5
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564149314;
	bh=iSt6GWVmi+fpAvXm1Wkw4oTple+1SFW8tj+x+5LwXHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=YsmLUNZYZiNF8JyXmuCSeh7oIvQJKuLXu3m8YqiEYiQyTXArsObMObgpM2/DxLbVj
	 LvaW+198BSKNQCn+4/lB5lzpifURoTLkG7agR6g/D6HdkVNG71Mk4v/dGiY2rml0E3
	 3qhWXbIqs8MqdNVuLGL/PgXSFqi2GqDqDk2sYiIo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfGZNzJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jul 2019 09:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387943AbfGZNmi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Jul 2019 09:42:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4C9C22BF5;
        Fri, 26 Jul 2019 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564148557;
        bh=iSt6GWVmi+fpAvXm1Wkw4oTple+1SFW8tj+x+5LwXHM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i3L0s97J20I/YEt5psc4nrtUlohLFtODH0xfGvfi/i/+YDD+uIh2S/L5NtVdQIm7m
         /5AO15lALJBLLwN53AFd5gEH7DGiCt+eHUqeyPL3gTZ8v+CqWyEYgRFuSVW2keDbrA
         +xGy2IO3B6BewzSuX1rjEWFupqjJF9khQqF/7VFQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Chunyan Zhang <zhang.chunyan@linaro.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 14/47] clk: sprd: Add check for return value of sprd_clk_regmap_init()
Date:   Fri, 26 Jul 2019 09:41:37 -0400
Message-Id: <20190726134210.12156-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726134210.12156-1-sashal@kernel.org>
References: <20190726134210.12156-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chunyan Zhang <zhang.chunyan@linaro.org>

[ Upstream commit c974c48deeb969c5e4250e4f06af91edd84b1f10 ]

sprd_clk_regmap_init() doesn't always return success, adding check
for its return value should make the code more strong.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
[sboyd@kernel.org: Add a missing int ret]
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sprd/sc9860-clk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/sc9860-clk.c b/drivers/clk/sprd/sc9860-clk.c
index 9980ab55271b..f76305b4bc8d 100644
--- a/drivers/clk/sprd/sc9860-clk.c
+++ b/drivers/clk/sprd/sc9860-clk.c
@@ -2023,6 +2023,7 @@ static int sc9860_clk_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct sprd_clk_desc *desc;
+	int ret;
 
 	match = of_match_node(sprd_sc9860_clk_ids, pdev->dev.of_node);
 	if (!match) {
@@ -2031,7 +2032,9 @@ static int sc9860_clk_probe(struct platform_device *pdev)
 	}
 
 	desc = match->data;
-	sprd_clk_regmap_init(pdev, desc);
+	ret = sprd_clk_regmap_init(pdev, desc);
+	if (ret)
+		return ret;
 
 	return sprd_clk_probe(&pdev->dev, desc->hw_clks);
 }
-- 
2.20.1

