Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74289C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346739AbiETH6H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346730AbiETH6C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:58:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DE415AB3D
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:58:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWI-0006bH-3M; Fri, 20 May 2022 09:57:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-003ROu-O1; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWF-00AveO-69; Fri, 20 May 2022 09:57:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v9 0/4] clk: provide new devm helpers for prepared and enabled clocks
Date:   Fri, 20 May 2022 09:57:33 +0200
Message-Id: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; h=from:subject; bh=sEhuMmJW8l03//A/Pq9UCpgGc389v3t6wXwl4AtmbV0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nW4RmK5Skbk1HhqzFWTduO8ASNdMPskUzcaNyF DKDG/iyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ1gAKCRDB/BR4rcrsCTC9B/ 9J9jmZqoBS7CZI8eRtCxLpm5BhzRPL8uY4LD07XNagLaYHx9kNRbQKyNr/W3e6TTxQDlSO29xUogcn NetIM7xPbD4dLe/4Z65dxaziw0a/j9YxEFOacX4DrnA3bvaVA6ML47qngWs9ss70L/sIOzwQGhhNzy KG1KT03FW4cANfcgaD+rmyCH7q+Fob/Les4PVhNKOY6O2O9kA2Ayf5bRoAdWs7U09x76iLuO2IqEmt /u0JKbEoFLHbzSy3rNvsb4Sz2qYFH5PzLvP0u0oHGSJ4P2Jqdi6qenBzdslpOHD/d6WVXYw+A/P1CX fHyHLW9F+naC/qAWydNC3FC18Z51R/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

after Stephen signaled to accept the idea, this is a rework of v8[1] with
the following changes:

 - Drop the follow up conversions. I will resend them individually per
   subsystem once the preconditions from this v9 are in. I only kept one
   clk patch that will go in via the clk tree anyhow. I trimmed the Cc:
   list accordingly.

 - (trivially) rebased to v5.18-rc1

 - Introduce a new commit that first improves the documention of
   devm_clk_get() and devm_clk_get_optional() before (mostly)
   duplicating these for the new functions.

 - Make the new functions use a GPL export. (Note the existing functions
   use a plain export, I didn't change that.)

 - Drop a bogus empty line that was cut-n-pasted into several functions.

Thanks for feedback by Stephen and Jonathan.

@Russell: Stephen wrote in v8: "I'm largely waiting for Russell to ack
the clk.h change [...]". Would be great if you looked at the series and
tell us your thoughts.

@Stephen: You asked to add the acks from v8. There were however only
acks for the followup conversions. So no changes here.
(Andy Shevchenko replied to patch 0, but his Reviewed-by: only affected
the patch "iio: Make use of devm_clk_get_enabled()".)

Best regards
Uwe

[1] https://lore.kernel.org/linux-clk/20220314141643.22184-1-u.kleine-koenig@pengutronix.de

Uwe Kleine-König (4):
  clk: Improve documentation for devm_clk_get() and its optional variant
  clk: generalize devm_clk_get() a bit
  clk: Provide new devm_clk helpers for prepared and enabled clocks
  clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()

 drivers/clk/clk-devres.c      |  91 +++++++++++++++++++----
 drivers/clk/meson/axg-audio.c |  36 +--------
 include/linux/clk.h           | 134 ++++++++++++++++++++++++++++++++--
 3 files changed, 207 insertions(+), 54 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

