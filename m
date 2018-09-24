Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05140C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B09A42098A
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09A42098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbeIXWxQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 18:53:16 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:28546 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728006AbeIXWxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 18:53:16 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie3.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:12 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 1FA5A44845;
        Tue, 25 Sep 2018 01:50:12 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,298,1534777200"; 
   d="scan'208";a="291770686"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:11 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.87])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 943AE14A;
        Mon, 24 Sep 2018 16:50:06 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] clk: renesas: r7s9210: Add support for early clocks
Date:   Mon, 24 Sep 2018 11:49:34 -0500
Message-Id: <20180924164937.36536-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924164934.WEBL8r-3Uqo3wI0pClfmWb6TkxFEKXDmaO5lXfBXnKE@z>

The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
ostm module clocks to be registers early in boot.

This series add early clock support to cpg-mssr

Here are some notes I took:

 * Switched to using
     of_iomap(cpg_np, 0)
   instead of
     platform_get_resource(pdev, IORESOURCE_MEM, 0)

*  All devm_xxx calls were replaced with the traditinal functions because
   'dev' is not available for early probe

*  some functions are still using dev_dbg and dev_err for messages, but
   in early init, dev is set to NULL so it doesn't crash, the messages
   just look like this:
      (NULL device *): Core clock extal at 24000000 Hz
      (NULL device *): clock (1, 35) is ostm1 at 66000000 Hz

*  np was added to priv
   np is saved because dev->of_node doesn't exist during early init and we
   need to avoid using 'dev' for any function that will run during early
   init

*  all .init functions (r8xxxx_cpg_mssr_init) for the SoCs do not use dev,
   except for r8a7791_cpg_mssr_init for the lines:
       struct device_node *np = dev->of_node;
       of_device_is_compatible(np, "renesas,r8a7793-cpg-mssr")
    But, so if early clock support was every needed for r8a7791 or r8a7793,
    that line will need to be changed.

* In r7s9210-cpg-mssr.c, I moved updating the clock ratio table to a
  separate function (r7s9210_update_table) because it looks cleaner.

Chris Brandt (3):
  clk: renesas: cpg-mssr: Add early clock support
  clk: renesas: r7s9210: Convert some clocks to early
  clk: renesas: r7s9210: Move table update to separate function

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 126 ++++++++++++++++++++-------------
 drivers/clk/renesas/renesas-cpg-mssr.c |  95 +++++++++++++++++++------
 drivers/clk/renesas/renesas-cpg-mssr.h |  13 ++++
 3 files changed, 163 insertions(+), 71 deletions(-)

-- 
2.16.1

