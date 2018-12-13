Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373C4C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 04:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 019FC20849
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 04:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544676581;
	bh=1966haSkD7Am1iqQXIyrqWOSsOF2F1QgqNW8FGvHJtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=neMBkCrjAhDYJkRrvzEfVTGPsPLyMZIPeXJxG38Msm88tLsUdoYzDKNI2NtigvXHC
	 q4Aq1h2YemyG6oOQ6BBEtHPeiKxhqBQ1Gcncv5Yq8/t4bbIPC1erBOc+lVQvM6uzIg
	 fH42cILGwAs6XIagc+v2QhLOs1LxA2X1F1WAbkgQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019FC20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbeLMEte (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 23:49:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:42814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727872AbeLME3w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Dec 2018 23:29:52 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1E8A20873;
        Thu, 13 Dec 2018 04:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544675391;
        bh=1966haSkD7Am1iqQXIyrqWOSsOF2F1QgqNW8FGvHJtI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T6x8CwLHei4T0jrGRJnMqV+lVpZT3N7rnlEqFmg6u1zdwpwGbiGD7ndjj1cniTo9o
         AR7pLVgRYCuHkUoiEx3Z3zS5MEADTdQO4m9KzyXxYB6nIbstcMjp7byh6yJ8O4HM7Z
         /TKbCr/bHZlFoHxAUquaeZZu1TYK3Ouh6Kkss0XE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 37/73] clk: mvebu: Off by one bugs in cp110_of_clk_get()
Date:   Wed, 12 Dec 2018 23:28:02 -0500
Message-Id: <20181213042838.75160-37-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181213042838.75160-1-sashal@kernel.org>
References: <20181213042838.75160-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d9f5b7f5dd0fa74a89de5a7ac1e26366f211ccee ]

These > comparisons should be >= to prevent reading beyond the end of
of the clk_data->hws[] buffer.

The clk_data->hws[] array is allocated in cp110_syscon_common_probe()
when we do:
	cp110_clk_data = devm_kzalloc(dev, sizeof(*cp110_clk_data) +
				      sizeof(struct clk_hw *) * CP110_CLK_NUM,
				      GFP_KERNEL);
As you can see, it has CP110_CLK_NUM elements which is equivalent to
CP110_MAX_CORE_CLOCKS + CP110_MAX_GATABLE_CLOCKS.

Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mvebu/cp110-system-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 75bf7b8f282f..0153c76d4a20 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -202,11 +202,11 @@ static struct clk_hw *cp110_of_clk_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[1];
 
 	if (type == CP110_CLK_TYPE_CORE) {
-		if (idx > CP110_MAX_CORE_CLOCKS)
+		if (idx >= CP110_MAX_CORE_CLOCKS)
 			return ERR_PTR(-EINVAL);
 		return clk_data->hws[idx];
 	} else if (type == CP110_CLK_TYPE_GATABLE) {
-		if (idx > CP110_MAX_GATABLE_CLOCKS)
+		if (idx >= CP110_MAX_GATABLE_CLOCKS)
 			return ERR_PTR(-EINVAL);
 		return clk_data->hws[CP110_MAX_CORE_CLOCKS + idx];
 	}
-- 
2.19.1

