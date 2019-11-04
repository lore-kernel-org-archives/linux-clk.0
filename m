Return-Path: <SRS0=14qQ=Y4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B1CA9EA0
	for <linux-clk@archiver.kernel.org>; Mon,  4 Nov 2019 11:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4738721E6F
	for <linux-clk@archiver.kernel.org>; Mon,  4 Nov 2019 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572865764;
	bh=ED2+1l4ATP0OGk62gY0UI54W/7Sig6CV0sihleJDKzA=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=yZCjFRS4Y8kbmAauzm/8xbteU7zkLDbUnvzL4Rds6KyIK6xT3qo5cZpPA3w/HoUXY
	 iUQb1alphxTUo/vyXFDRSGTawlCcyEB5QdXNDrXB1+yzFCJct6zEZH7ZNW0vXs5gA9
	 aFpF20Cmwd6Y8ppwtFA1pwbRoVocVQs80lCudkWk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDLJY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Nov 2019 06:09:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:49932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbfKDLJX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 4 Nov 2019 06:09:23 -0500
Received: from dragon (li1038-30.members.linode.com [45.33.96.30])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F18521D81;
        Mon,  4 Nov 2019 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572865763;
        bh=ED2+1l4ATP0OGk62gY0UI54W/7Sig6CV0sihleJDKzA=;
        h=Date:From:To:Cc:Subject:From;
        b=cfSvfGSuyCd7Gp5N+tSJ751niPlDFEuZRhtOva2P/UBpeL8dqWk9Bk8LhqabdsLfP
         N7aJIWYYRkuk/E/+/l5JoirmB7IJ/hkt0x4Br0Pj8EOJQEtuc3zxs37weDpuDiNiuu
         dxwyI5d8r6gyhjUJLuzbDovxEnwt5k9LqWNl9pGs=
Date:   Mon, 4 Nov 2019 19:08:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.5
Message-ID: <20191104110856.GX24620@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-5.5

for you to fetch changes up to bceed71ba13116de4b1459c2c6db47d927b48e68:

  clk: imx: imx8mq: fix sys3_pll_out_sels (2019-11-04 09:10:49 +0800)

----------------------------------------------------------------
i.MX clock changes for 5.5:
 - Make 1443X/1416X PLL clock structure common for reusing among i.MX8
   SoCs.
 - A couple of imx7ulp clock multiplexer option corrections.
 - Drop IMX7ULP_CLK_MIPI_PLL clock, as it's a MIPI DSI local clock and
   shouldn't be used externally.
 - Add VIDEO2_PLL clock for imx8mq which is needed by DCSS when high
   resolutions are used.
 - Add missing gate clock for pll1/2 fixed dividers on i.MX8 SoCs.
 - Register SYS_PLL1 and SYS_PLL2 as fixed clock rather than pll14xx
   type of clock.
 - Use imx_obtain_fixed_clk_hw() to simplify i.MX6/7/8 clock driver code
   a little bit.
 - One cosmetic change on clk-pll14xx code to make variables static.

----------------------------------------------------------------
Anson Huang (4):
      clk: imx8mm: Move 1443X/1416X PLL clock structure to common place
      clk: imx8mn: Use common 1443X/1416X PLL clock structure
      clk: imx7ulp: Correct system clock source option #7
      clk: imx7ulp: Correct DDR clock mux options

Fancy Fang (1):
      clk: imx7ulp: do not export out IMX7ULP_CLK_MIPI_PLL clock

Laurentiu Palcu (1):
      clk: imx8mq: Add VIDEO2_PLL clock

Leonard Crestez (4):
      clk: imx: pll14xx: Fix quick switch of S/K parameter
      clk: imx8mq: Define gates for pll1/2 fixed dividers
      clk: imx8mm: Define gates for pll1/2 fixed dividers
      clk: imx8mn: Define gates for pll1/2 fixed dividers

Peng Fan (8):
      clk: imx: imx8mm: mark sys_pll1/2 as fixed clock
      clk: imx: imx8mn: mark sys_pll1/2 as fixed clock
      clk: imx: imx8mq: mark sys1/2_pll as fixed clock
      clk: imx: imx7d: use imx_obtain_fixed_clk_hw to simplify code
      clk: imx: imx6sll: use imx_obtain_fixed_clk_hw to simplify code
      clk: imx: imx6sx: use imx_obtain_fixed_clk_hw to simplify code
      clk: imx: imx6ul: use imx_obtain_fixed_clk_hw to simplify code
      clk: imx: imx8mq: fix sys3_pll_out_sels

YueHaibing (1):
      clk: imx: clk-pll14xx: Make two variables static

 .../devicetree/bindings/clock/imx7ulp-clock.txt    |   1 -
 drivers/clk/imx/clk-imx6sll.c                      |   8 +-
 drivers/clk/imx/clk-imx6sx.c                       |  12 +-
 drivers/clk/imx/clk-imx6ul.c                       |   8 +-
 drivers/clk/imx/clk-imx7d.c                        |   4 +-
 drivers/clk/imx/clk-imx7ulp.c                      |   9 +-
 drivers/clk/imx/clk-imx8mm.c                       | 150 +++++++-------------
 drivers/clk/imx/clk-imx8mn.c                       | 152 +++++++--------------
 drivers/clk/imx/clk-imx8mq.c                       |  77 +++++++----
 drivers/clk/imx/clk-pll14xx.c                      |  72 +++++-----
 drivers/clk/imx/clk.h                              |   3 +
 include/dt-bindings/clock/imx7ulp-clock.h          |   1 +
 include/dt-bindings/clock/imx8mm-clock.h           |  19 ++-
 include/dt-bindings/clock/imx8mn-clock.h           |  19 ++-
 include/dt-bindings/clock/imx8mq-clock.h           |  24 +++-
 15 files changed, 268 insertions(+), 291 deletions(-)
