Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12312C43334
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 17:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241884AbiFTRSm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241585AbiFTRSi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 13:18:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B979313D5E
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 10:18:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3L2c-0005k3-39; Mon, 20 Jun 2022 19:18:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3L2X-001gOU-PV; Mon, 20 Jun 2022 19:18:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3L2Y-0002YA-Di; Mon, 20 Jun 2022 19:18:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] clk: Fix pointer casting to prevent oops in devm_clk_release()
Date:   Mon, 20 Jun 2022 19:18:15 +0200
Message-Id: <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
References: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; h=from:subject; bh=cF50jFuVNba4Yuy4COxLF2/k5SujMAtkqiBzC14IXxs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBisKvUwuyPoQz6bqSEr3t7tbvS3LQhpxOD4W/d/wy9 HHMkoF6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrCr1AAKCRDB/BR4rcrsCZJBB/ wPQX1DX0h49o9NBGT5uO8u8IcXFwb0w9ketiWKFdAAn8aZS1iPVsDeQJJTlo+cgBODNwpOAkGPPYT8 w1/1ySjIkB2Zbpl6p5Nc8x8zeTAtNfz/0+8pGmPUshTMGj41ZaRBGvXGEOx2DjTR7TOgrAH/a4OjUc 42Y/IKiJkt1AHFv2LLFTap5ymuPZ3EaTY/H2zQQwzSGoCFeky2L6b2D1IoM82LTvhbjPtwsZbwr6Ue Hs1HM3nHMg0xiwTtEYf2Nv+HDgx0OobaE9wlhMZL0XvwG9PKDy7bKE8D8RxP14hCK+LiBZGkrnpvpg yP2txMf/vVir2uVqadDsSbGTYOm7bF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The release function is called with a pointer to the memory returned by
devres_alloc(). I was confused about that by the code before the
generalization that used a struct clk **ptr.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
On Mon, Jun 20, 2022 at 05:26:12PM +0200, Marek Szyprowski wrote:
> > -   clk_put(*(struct clk **)res);
> > +   struct devm_clk_state *state = *(struct devm_clk_state **)res;
> 
> This should be:
> 
> struct devm_clk_state *state = res;
> 
> otherwise it nukes badly during cleanup:
> [...]

How embarrassing. I understood how I confused that, but I wonder how
that didn't pop up earlier.

FTR: I didn't test that now, but assume you did. My focus now was to get
out an applicable patch fast.

Thanks for your report
Uwe

 drivers/clk/clk-devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index c822f4ef1584..1bb086695051 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -11,7 +11,7 @@ struct devm_clk_state {
 
 static void devm_clk_release(struct device *dev, void *res)
 {
-	struct devm_clk_state *state = *(struct devm_clk_state **)res;
+	struct devm_clk_state *state = res;
 
 	if (state->exit)
 		state->exit(state->clk);

base-commit: abae8e57e49aa75f6db76aa866c775721523908f
-- 
2.36.1

