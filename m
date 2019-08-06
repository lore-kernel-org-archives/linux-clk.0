Return-Path: <SRS0=W3Yt=WC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA278C433FF
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 21:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92B2A218A4
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565127987;
	bh=mTa9ObJI1tPmKslY7UHxoXGKBG5f58d3ovgEkn6DzO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dzW0umuIM3jHIc2eTRdorqe5Ezn3C0JN65k07nMcj+k/dl/7X5dWlJP63bF/NkHuQ
	 ldnmn6NlBBQ1NdcHb4G4rqQEOBMsAuLppaVZAB0kbRXzwmfaDkUhBPp6rV87LQzsxG
	 D8jQkQSIloQDpmNNgXSG7eUvEraPG+bksjXcps2Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfHFVd0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Aug 2019 17:33:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfHFVd0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Aug 2019 17:33:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9409121880;
        Tue,  6 Aug 2019 21:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565127205;
        bh=mTa9ObJI1tPmKslY7UHxoXGKBG5f58d3ovgEkn6DzO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vn3i3jpreZ/qfnc4jMmfhmohyAm6EoW+bZ4DJfD1a6uY3s8JXG2+UN+rlRpbRXJkk
         h+9fsGSnp6mtk03iD1j+KANlP/ZTucnFmGkE36BZLrkMfIxlK/nzifDR/HLZ1lWl6i
         LS9rS8WGfrWs2/iv7LhTtf2EFAhIYxPjgM+ChB2k=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 04/59] clk: sprd: Select REGMAP_MMIO to avoid compile errors
Date:   Tue,  6 Aug 2019 17:32:24 -0400
Message-Id: <20190806213319.19203-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

[ Upstream commit c9a67cbb5189e966c70451562b2ca4c3876ab546 ]

Make REGMAP_MMIO selected to avoid undefined reference to regmap symbols.

Fixes: d41f59fd92f2 ("clk: sprd: Add common infrastructure")
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sprd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sprd/Kconfig b/drivers/clk/sprd/Kconfig
index 91d3d721c801e..3c219af251001 100644
--- a/drivers/clk/sprd/Kconfig
+++ b/drivers/clk/sprd/Kconfig
@@ -3,6 +3,7 @@ config SPRD_COMMON_CLK
 	tristate "Clock support for Spreadtrum SoCs"
 	depends on ARCH_SPRD || COMPILE_TEST
 	default ARCH_SPRD
+	select REGMAP_MMIO
 
 if SPRD_COMMON_CLK
 
-- 
2.20.1

