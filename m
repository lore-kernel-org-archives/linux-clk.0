Return-Path: <SRS0=MyMj=2B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6770AC2D0C7
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 15:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33C782465B
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576078315;
	bh=m2kHXdSGO2m2+0B8tCsvKfhEWUthbr301EBF8qZEnIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=aBV91Ew64KzoNrz6l93oOuSNKoE9SntBYYgzvm2Jv+nnAKwaTx+gFQU/f/b7t7IKW
	 yTpcJw079kUIWI11Np87xQpZYzsGfBQ5QA2IrTfC5Xq/h3IyQQ8Ks220pmX4q+a/HX
	 AK2BTkR3je9WehwQhXih10jqpu9VHAbW21/8Bxro=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbfLKP3F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Dec 2019 10:29:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387794AbfLKP3F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Dec 2019 10:29:05 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3457324654;
        Wed, 11 Dec 2019 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576078144;
        bh=m2kHXdSGO2m2+0B8tCsvKfhEWUthbr301EBF8qZEnIg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V6VWixn/z2ACXQDSSQKkMHVMzHKIjblS7HPNZIIj77XqDufXDcZHWT5U5Da06bMFY
         CiOkVKKNaqqiVQK4jVqXZ2mPPCmhikBl/mge/NdR5tP7y/mQHKlBOP9SpwR3OgEJOT
         Z/tO0r17dhN4u1OCrmOLzbBtQdjt/C0pPp2wsRpg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 31/58] clk: pxa: fix one of the pxa RTC clocks
Date:   Wed, 11 Dec 2019 10:28:04 -0500
Message-Id: <20191211152831.23507-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152831.23507-1-sashal@kernel.org>
References: <20191211152831.23507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Robert Jarzmik <robert.jarzmik@free.fr>

[ Upstream commit 46acbcb4849b2ca2e6e975e7c8130c1d61c8fd0c ]

The pxa27x platforms have a single IP with 2 drivers, sa1100-rtc and
rtc-pxa drivers.

A previous patch fixed the sa1100-rtc case, but the pxa-rtc wasn't
fixed. This patch completes the previous one.

Fixes: 8b6d10345e16 ("clk: pxa: add missing pxa27x clocks for Irda and sa1100-rtc")
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Link: https://lkml.kernel.org/r/20191026194420.11918-1-robert.jarzmik@free.fr
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/pxa/clk-pxa27x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 25a30194d27a3..b67ea86ff1566 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -462,6 +462,7 @@ struct dummy_clk {
 };
 static struct dummy_clk dummy_clks[] __initdata = {
 	DUMMY_CLK(NULL, "pxa27x-gpio", "osc_32_768khz"),
+	DUMMY_CLK(NULL, "pxa-rtc", "osc_32_768khz"),
 	DUMMY_CLK(NULL, "sa1100-rtc", "osc_32_768khz"),
 	DUMMY_CLK("UARTCLK", "pxa2xx-ir", "STUART"),
 };
-- 
2.20.1

