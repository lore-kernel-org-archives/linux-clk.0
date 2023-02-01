Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF28C38142
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 08:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjBAIXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 03:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjBAIXX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 03:23:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444105D11B
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 00:23:22 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pN8Oh-0003Il-Gz; Wed, 01 Feb 2023 09:23:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pN8Oh-001s6z-Bm; Wed, 01 Feb 2023 09:23:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pN8Of-00HXkB-Gt; Wed, 01 Feb 2023 09:23:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        kernel@pengutronix.de, linux-clk@vger.kernel.org
Subject: [PATCH] clk: Disambiguate comment about clk_get_rate() for disabled clocks
Date:   Wed,  1 Feb 2023 09:23:09 +0100
Message-Id: <20230201082309.233348-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rczvx3h2xKEdCbV1FLq/lCm85jRlDYWTQjodRqrQ3f0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj2iFpLiGYrCEZa1aqy8J6nfZ5G0mceAx3cIWOIAD2 NqltMVGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY9ohaQAKCRDB/BR4rcrsCZIaCA CALgzBJKQWySIoT1Z+GLinsdlBDuOgJ2bZhnY46xvNI5YdPtbhDXf2+rzU8LcFfJdNsLDSMrgoUfbj PkTrlYoB66/D9xlLF7Se+9O/NB0FZStNrlARmeHxXQimQynC4mh2q9Otf0/vlRfBOT3L7j9IE6SGp/ SvytqWIW2CIH6QZxVVIn7D3COzmdURRB1HP/7cJRCyz2jjiJpdPo3IOjCc3sWpJy3yu27fPeWrl9NW giW+MD6161Yvt65DpwG2I+2AtV7ZVlA5EkQTAC5dbAqvSq+CJ0drA/9OWGhqIaqWgv8R5L7W9R7FU9 IsnGX25qJisOsEgJFLGeb3B4G9bgHK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sentence "[clk_get_rate()] is only valid once the clock source has
been enabled." can be understood in two ways:

a) When called for a disabled clock the return value might be wrong; or
b) The disabled clock must be enabled before it runs at the returned
rate.

It's hard to find evidence what is actually meant, but given that the
clock tree can change between the call to clk_get_rate() and the return
of a later clk_enable() call, it's prudent to assume a).

Adapt the comment accordingly to be unambiguous.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

while archiving my old mail I stumbled over
https://lore.kernel.org/linux-clk/20210213165406.GQ1463@shell.armlinux.org.uk
which supports semantic a).

Clearify the documentation accordingly.

Best regards
Uwe

 include/linux/clk.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 1ef013324237..72f90d4df433 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -676,8 +676,10 @@ void clk_bulk_disable(int num_clks, const struct clk_bulk_data *clks);
 
 /**
  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
- *		  This is only valid once the clock source has been enabled.
  * @clk: clock source
+ *
+ * Note that the return value for disabled clks is unreliable. It might or
+ * might not match the actual rate of the clock once it's enabled.
  */
 unsigned long clk_get_rate(struct clk *clk);
 

base-commit: 58706f7fb045b7019bada81fa17f372189315fe5
-- 
2.39.0

