Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70ACC7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 08:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239464AbjFMIgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 04:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238626AbjFMIgv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 04:36:51 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17AA187;
        Tue, 13 Jun 2023 01:36:44 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QgMNQ6GPnz9sms;
        Tue, 13 Jun 2023 10:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
        s=MBO0001; t=1686645398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MgvvSyruhg2ZfuTSWNSC3PC5Qz4Nts7TJ3JZHpUD99c=;
        b=vxrby8hxcVCXQVwKiHvIAsDZNESSlByIolHHhy/tE6JrC3jEbmZAOybHEbuRxPnSRPbQa2
        CB9xCEfUPTbiE9ZiluJzl2x0410cWecCOSlHusFLB1YkdoGkJqcZOTydwuEtMKIX1cJYS7
        R881sR49kR7gnuukON4QydTGHRK0LQ23GE0Wno6nwt8+26p/j6onFJsYp2kKQT0BlQ2UiF
        9zImMDeDdefJAJMWrqN8OPaWjx4XjL9KdqcLYnh5niz7x99Ra2Aa35Qlb5xfe70c3qhb/t
        7RzWz16J3HyB204qf9wGvpfUQG8UY/QdDOzeAjpsAzyRK4dDqeN6muBQneByrQ==
From:   Frank Oltmanns <frank@oltmanns.dev>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Oltmanns <frank@oltmanns.dev>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v2 0/2] clk: fractional-divider: Improve approximation when zero based
Date:   Tue, 13 Jun 2023 10:36:24 +0200
Message-ID: <20230613083626.227476-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I stumpled upon this, when familiarizing myself with clk drivers. Unfortunately,
I have no boards to test this patch. It seems the only user of this flag in
mainline is drivers/clk/imx/clk-composite-7ulp.c, therefore I'm cc-ing
get_maintainers.pl --git-blame -f drivers/clk/imx/clk-composite-7ulp.c
in the hopes of a wider audience.

V1: https://lore.kernel.org/lkml/20230529133433.56215-1-frank@oltmanns.dev/

Changes since V1:
 - Added test case as requested by Stephen Boyd
 - Fixed commit message as the Cc: was missing a closing bracket, so that the
   original mail unfortunately did not go out to A. s. Dong.

Thank you for considering this contribution,
  Frank

Frank Oltmanns (2):
  clk: fractional-divider: Improve approximation when zero based
  clk: tests: Add tests for fractional divisor approximation

 drivers/clk/clk-fractional-divider.c | 26 ++++++++---
 drivers/clk/clk_test.c               | 69 +++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.41.0

