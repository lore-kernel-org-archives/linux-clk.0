Return-Path: <SRS0=WWrt=XG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CA0C49ED6
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 12:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D318E20CC7
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 12:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfIKMFe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Sep 2019 08:05:34 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47742 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbfIKMFe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Sep 2019 08:05:34 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D942A1A05A2;
        Wed, 11 Sep 2019 14:05:32 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CC8311A0091;
        Wed, 11 Sep 2019 14:05:32 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2843D205DE;
        Wed, 11 Sep 2019 14:05:32 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] clk: imx8m: Define gates for pll1/2 dividers
Date:   Wed, 11 Sep 2019 15:05:26 +0300
Message-Id: <cover.1568203237.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed dividers for sys_pll1 and sys_pll2 on imx8m each have a gate
attached but they're currently unused so they default to "always on".

Add them to the clk tree for the sake of corectness. This could expose
bugs where parent clocks were not correctly enabled.

The new gates are added between the PLL and fixed dividers and new gates
are enumerated at the end in dt-bindings. This should ensure
compatibility, even though none of these fixed dividers are directly
referenced by peripherals anyway.

There are small differences on imx8mq because the PLL physical
implementation is also different.

Leonard Crestez (3):
  clk: imx8mq: Define gates for pll1/2 fixed dividers
  clk: imx8mm: Define gates for pll1/2 fixed dividers
  clk: imx8mn: Define gates for pll1/2 fixed dividers

 drivers/clk/imx/clk-imx8mm.c             | 57 ++++++++++++++--------
 drivers/clk/imx/clk-imx8mn.c             | 57 ++++++++++++++--------
 drivers/clk/imx/clk-imx8mq.c             | 62 ++++++++++++++++--------
 include/dt-bindings/clock/imx8mm-clock.h | 19 +++++++-
 include/dt-bindings/clock/imx8mn-clock.h | 19 +++++++-
 include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
 6 files changed, 175 insertions(+), 61 deletions(-)

-- 
2.17.1

