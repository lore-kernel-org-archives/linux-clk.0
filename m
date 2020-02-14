Return-Path: <SRS0=/Rha=4C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FA0C3B1B2
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 18:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EAF42187F
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581703655;
	bh=FeVeP2QrTofO92o0TauoC1+AnElbMUclhsKtMYNT+MA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rHy88nETGxiVkp7DwGfRLNIwRwOt/JvBy2M7XORfTmR8SKpg4mSLuAxldi1COIhV7
	 kG0lMCRVmfccpitYk462/3D9Fm0Rml68+Qb/mGIR6gcBRnFYP81R4+qZPT7xc00ap8
	 btI4dVEfYb9mPA3bIZV7dUUmWYNC552XQkwF8Ok8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbgBNPyd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Feb 2020 10:54:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731551AbgBNPyd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Feb 2020 10:54:33 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F972467E;
        Fri, 14 Feb 2020 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581695672;
        bh=FeVeP2QrTofO92o0TauoC1+AnElbMUclhsKtMYNT+MA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g+fbXGUqyOfRh+f7d3zgqTOfR2XYwx+JwLZP+aQhp9mFODlhHiASNMJtDLlyQWgfI
         pJ04ywwRsAbK7N3Ir1DWteevuPk9lHgLjl6CeYUOVcbiEx8Up+d0yF/gZlC25t6Pda
         lEOyvmnUsANmYhTCj/xJwys3/hjFvzrhps1ckY/o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     YueHaibing <yuehaibing@huawei.com>, Hulk Robot <hulkci@huawei.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 260/542] clk: bm1800: Remove set but not used variable 'fref'
Date:   Fri, 14 Feb 2020 10:44:12 -0500
Message-Id: <20200214154854.6746-260-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit 59ef4da4e4084d323dd4c3aa4b2fc64ce9e25625 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/clk/clk-bm1880.c: In function 'bm1880_pll_rate_calc':
drivers/clk/clk-bm1880.c:477:13: warning:
 variable 'fref' set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lkml.kernel.org/r/20191129033534.188257-1-yuehaibing@huawei.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/clk-bm1880.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 4cd175afce9b1..e6d6599d310a1 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -474,11 +474,10 @@ static struct bm1880_composite_clock bm1880_composite_clks[] = {
 static unsigned long bm1880_pll_rate_calc(u32 regval, unsigned long parent_rate)
 {
 	u64 numerator;
-	u32 fbdiv, fref, refdiv;
+	u32 fbdiv, refdiv;
 	u32 postdiv1, postdiv2, denominator;
 
 	fbdiv = (regval >> 16) & 0xfff;
-	fref = parent_rate;
 	refdiv = regval & 0x1f;
 	postdiv1 = (regval >> 8) & 0x7;
 	postdiv2 = (regval >> 12) & 0x7;
-- 
2.20.1

