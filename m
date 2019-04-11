Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4708FC10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 23:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A93120693
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 23:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N4REOu2P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfDKXWt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 19:22:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40389 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfDKXWt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 19:22:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id c207so4174881pfc.7
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 16:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkgB2Wu06Pd4z96v65dmkLjB7xuMujb7ajfyz6BRah8=;
        b=N4REOu2PSJZDy8Il/YjNSGOzdd42AawfVoDMOOt6HZp1ngpPBE6CA/t76JpBEwkXBl
         cAN8r2SyAJ1bLpt011QPNQ8lZnjDMCSXRqEMDkWXr0wmUKdmTRvB3oPXPk0Lz5Opngui
         1WEL9Zwqmou9Zs2xgCH45HTwTWINT+X5NCU3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkgB2Wu06Pd4z96v65dmkLjB7xuMujb7ajfyz6BRah8=;
        b=n0Eo0OyddCIhcI3jBuI9leSUAFTXM+u5lxvLckCHdtoIMG5k7nVFKapCkCFrynvIqw
         KR+1mCrTARruOrqkSuk4imb0sU390l3rbznrCJQUhYasUVXTwOzqBiV3xGr55VJGGj+Q
         L5G6+2I54MlyR6Jr+xAihvyjEspr6ojXWj9zGj7PkA15gdTbv3K8+EZOjbrX23IFAz+0
         0IFZ2ns2Kt4oLDfPupJb22SVibFl4QUUyEE98mSX2H1K/VdaNEXsOj+/OsLJxb6ku+EM
         Omji92imIHYCnXQ466EONLezRzwUmxTF7Yuy/Dx9xm8TfpC9iFtInCaQXV/gxckovxjT
         nmJg==
X-Gm-Message-State: APjAAAX2P+9CX+AnKpwU0GsIFe0LirOK/EHQs5zUecpjHu0jm3paujJ1
        rjtvNbgolTBpg6PMhq9lIb/j1g==
X-Google-Smtp-Source: APXvYqwIprzlKW2nejCZ3fCZPI0yJSk+LmODFFzKDpPN5QTpEfwTCtsN7TwwhtNqpjpRD3mINi7aMg==
X-Received: by 2002:a63:ed48:: with SMTP id m8mr35963091pgk.104.1555024968498;
        Thu, 11 Apr 2019 16:22:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id y20sm37288903pfe.188.2019.04.11.16.22.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 16:22:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     dbasehore@chromium.org, amstan@chromium.org,
        linux-rockchip@lists.infradead.org, briannorris@chromium.org,
        mka@chromium.org, ryandcase@chromium.org,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] clk: rockchip: Turn on "aclk_dmac1" for suspend
Date:   Thu, 11 Apr 2019 16:21:53 -0700
Message-Id: <20190411232157.55125-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Experimentally it can be seen that going into deep sleep (specifically
setting PMU_CLR_DMA and PMU_CLR_BUS in RK3288_PMU_PWRMODE_CON1)
appears to fail unless "aclk_dmac1" is on.  The failure is that the
system never signals that it made it into suspend on the GLOBAL_PWROFF
pin and it just hangs.

NOTE that it's confirmed that it's the actual suspend that fails, not
one of the earlier calls to read/write registers.  Specifically if you
comment out the "PMU_GLOBAL_INT_DISABLE" setting in
rk3288_slp_mode_set() and then comment out the "cpu_do_idle()" call in
rockchip_lpmode_enter() then you can exercise the whole suspend path
without any crashing.

This is currently not a problem with suspend upstream because there is
no current way to exercise the deep suspend code.  However, anyone
trying to make it work will run into this issue.

This was not a problem on shipping rk3288-based Chromebooks because
those devices all ran on an old kernel based on 3.14.  On that kernel
"aclk_dmac1" appears to be left on all the time.

There are several ways to skin this problem.

A) We could add "aclk_dmac1" to the list of critical clocks and that
apperas to work, but presumably that wastes power.

B) We could keep a list of "struct clk" objects to enable at suspend
time in clk-rk3288.c and use the standard clock APIs.

C) We could make the rk3288-pmu driver keep a list of clocks to enable
at suspend time.  Presumably this would require a dts and bindings
change.

D) We could just whack the clock on in the existing syscore suspend
function where we whack a bunch of other clocks.  This is particularly
easy because we know for sure that the clock's only parent
("aclk_cpu") is a critical clock so we don't need to do anything more
than ungate it.

In this case I have chosen D) because it seemed like the least work,
but any of the other options would presumably also work fine.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/rockchip/clk-rk3288.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 5a67b7869960..b245367393cd 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -859,6 +859,9 @@ static const int rk3288_saved_cru_reg_ids[] = {
 	RK3288_CLKSEL_CON(10),
 	RK3288_CLKSEL_CON(33),
 	RK3288_CLKSEL_CON(37),
+
+	/* We turn aclk_dmac1 on for suspend; this will restore it */
+	RK3288_CLKGATE_CON(10),
 };
 
 static u32 rk3288_saved_cru_regs[ARRAY_SIZE(rk3288_saved_cru_reg_ids)];
@@ -874,6 +877,14 @@ static int rk3288_clk_suspend(void)
 				readl_relaxed(rk3288_cru_base + reg_id);
 	}
 
+	/*
+	 * Going into deep sleep (specifically setting PMU_CLR_DMA in
+	 * RK3288_PMU_PWRMODE_CON1) appears to fail unless
+	 * "aclk_dmac1" is on.
+	 */
+	writel_relaxed(1 << (12 + 16),
+		       rk3288_cru_base + RK3288_CLKGATE_CON(10));
+
 	/*
 	 * Switch PLLs other than DPLL (for SDRAM) to slow mode to
 	 * avoid crashes on resume. The Mask ROM on the system will
-- 
2.21.0.392.gf8f6787159e-goog

