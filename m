Return-Path: <SRS0=sOJR=XT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF3FC4320D
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 17:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 525E02054F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569344528;
	bh=PnbnIcgZjtEdYqUlBBBWYErDr6FSx8IYXnn0vmGA5PY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=f+wya3RRfB6DJjp804gMpb44FfgPvjLs8J2Kub93xlcVSCOJKgrX/PQoBawYIzMq+
	 6g0xJhrQtvaoDjJwCfM1qlix+GYyaYzalLk2wNNpePpdwvHJ3M5YEsGXuQcVKQzEtu
	 KLR9YA6VALAdG4YIzC2IazxsJqiwUamhFbYwTkRg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfIXRCG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Sep 2019 13:02:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2632862AbfIXQnB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Sep 2019 12:43:01 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B206221783;
        Tue, 24 Sep 2019 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569343380;
        bh=PnbnIcgZjtEdYqUlBBBWYErDr6FSx8IYXnn0vmGA5PY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ribl/6x0LQ4jIgg2QXveUXUxegQrT1S2hwPNeHr8OV2M6QrtddKHldNP0UOT3fOQJ
         rYlGwZUxlxiuiRfS75KylF5nTngrhbQAVHAFfMwKj9C1aMSfJdyT0C7az9aM91HUCL
         TUWIlhN083ZIeL+/jLdhEw/qlkzeC0cba4JfI8I0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 29/87] clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
Date:   Tue, 24 Sep 2019 12:40:45 -0400
Message-Id: <20190924164144.25591-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

[ Upstream commit 720099603d1f62e37b789366d7e89824b009ca28 ]

The MMC2 clock slices are currently not defined in V3s CCU driver, which
makes MMC2 not working.

Fix this issue.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 9b3939fc7faa6..5ca4d34b4094f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -502,6 +502,9 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
 		[CLK_MMC1]		= &mmc1_clk.common.hw,
 		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
 		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
+		[CLK_MMC2]		= &mmc2_clk.common.hw,
+		[CLK_MMC2_SAMPLE]	= &mmc2_sample_clk.common.hw,
+		[CLK_MMC2_OUTPUT]	= &mmc2_output_clk.common.hw,
 		[CLK_CE]		= &ce_clk.common.hw,
 		[CLK_SPI0]		= &spi0_clk.common.hw,
 		[CLK_USB_PHY0]		= &usb_phy0_clk.common.hw,
-- 
2.20.1

