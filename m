Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011D4C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 09:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239274AbiDYJ4b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiDYJ4T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 05:56:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0032F403CF
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 02:52:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOn-0008Mn-Ji; Mon, 25 Apr 2022 11:52:53 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOo-0057Wp-5x; Mon, 25 Apr 2022 11:52:52 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOm-0015Vo-1l; Mon, 25 Apr 2022 11:52:52 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        David Jander <david@protonic.nl>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] clk: i.MX8M[PQ] fixes
Date:   Mon, 25 Apr 2022 11:52:47 +0200
Message-Id: <20220425095249.259406-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series has two fixes for the i.MX8MP and i.MX8MQ clk support. It
was decided that the gates of the divided outputs of the System PLLs
are not useful for the Kernel and so the gate clocks were removed.
Nevertheless they are of course still there in hardware and the Kernel
needs them to be enabled for the consumers hanging on these gates.
Enable them explicitly instead of assuming that the gates are still
at their reset default on state.

Sascha

Sascha Hauer (2):
  clk: imx8mp: Enable no longer handled gates
  clk: imx8mq: Enable no longer handled gates

 drivers/clk/imx/clk-imx8mp.c | 19 +++++++++++++++++++
 drivers/clk/imx/clk-imx8mq.c | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.30.2

