Return-Path: <SRS0=Lb92=5B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037C2C0044D
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 06:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFE1520726
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584341009;
	bh=GML3hxtvT+990HulKQpNUxDglfh7BzBN9PUEJREf6Uc=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=ZZ4WudtZD/2PNkkcGDtljD2P7YzY93fvFqqyJP10sdFCyI5OdJesQHi79l5p/crvg
	 FKvHv2RJTB50kVy1Vots8wE2GbHK79fRXxAn96rZeUSgKKd0xvG1yi+crhX0JstoQR
	 XIhNzGZM6QXc7wUsID1G+1pUYaMn9bUBkU4S+LKk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgCPGn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Mar 2020 02:43:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729319AbgCPGn3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Mar 2020 02:43:29 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2C292071C;
        Mon, 16 Mar 2020 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584341008;
        bh=GML3hxtvT+990HulKQpNUxDglfh7BzBN9PUEJREf6Uc=;
        h=Date:From:To:Cc:Subject:From;
        b=V3GQIwuM8upML/IirHwPbltYu8aaV0D9bMqvYisAy2R/TMeUQym6dXzkfGZl+if9T
         bnLbFn4O2SiHuUIhlGMN3AkXwqA5Z7q7Fbw8jypZpRiHhfxJfXXQMByhMPWGop3otH
         7y9nw4d5jlh9PelI70+GdNf4Q6fvatA7ncJbshI0=
Date:   Mon, 16 Mar 2020 14:43:23 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock drivers update for 5.7
Message-ID: <20200316064322.GI17221@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

This is i.MX clock driver update I collected for 5.7.  Please consider
to pull.  Also, 16e71d4da799 ("clk: imx8mn: add SNVS clock to clock tree")
was pulled into DT branch as dependency, so please keep it stable.

Thanks!

Shawn


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.7

for you to fetch changes up to b5881e8019e0d39c43a2da56c4ae616a50615e00:

  clk: imx: clk-gate2: Pass the device to the register function (2020-03-16 09:38:30 +0800)

----------------------------------------------------------------
i.MX clock drivers update for 5.7:

 - A series from Anson to convert i.MX8 clock bindings to json-schema.
 - Update pll14xx driver to include new frequency entries for pll1443x
   table, and return error for invalid PLL type.
 - Clean up header includes and unnecessary code on a few clock driver.
 - Add mssing of_node_put() call for a number of clock drivers.
 - Drop flag CLK_IS_CRITICAL from 'A53_CORE' mux clock, as we already
   have the flag on its child cpu clock.
 - Fix a53 cpu clock for i.MX8 drivers to get it source from ARM PLL
   via CORE_SEL slice, and source from A53 CCM clk root when we need to
   change ARM PLL frequency. Thus, we can support core running above
   1GHz safely.
 - Update pfdv2 driver to check zero rate and use determine_rate for
   getting the best rate.
 - Add CLKO2 for imx8mm, SNVS clock for imx8mn, and PXP clock for imx7d.

----------------------------------------------------------------
Abel Vesa (1):
      clk: imx: clk-gate2: Pass the device to the register function

Anson Huang (23):
      dt-bindings: clock: Convert i.MX8MQ to json-schema
      dt-bindings: clock: Convert i.MX8MM to json-schema
      dt-bindings: clock: Refine i.MX8MN clock binding
      clk: imx: pll14xx: Add new frequency entries for pll1443x table
      clk: imx: Include clk-provider.h instead of clk.h for i.MX8M SoCs clock driver
      clk: imx: drop redundant initialization
      clk: imx7ulp: Include clk-provider.h instead of clk.h
      clk: imx6sl: Add missing of_node_put()
      clk: imx8mq: Add missing of_node_put()
      clk: imx8mm: Add missing of_node_put()
      clk: imx8mn: Add missing of_node_put()
      clk: imx8mp: Add missing of_node_put()
      clk: imx8mp: Include slab.h instead of clkdev.h
      clk: imx8mm: Remove unused includes
      clk: imx8mn: Remove unused includes
      clk: imx8mp: Rename the IMX8MP_CLK_HDMI_27M clock
      clk: imx: pll14xx: Return error if pll type is invalid
      clk: imx: clk-sscg-pll: Drop unnecessary initialization
      clk: imx: Fix division by zero warning on pfdv2
      clk: imx8mn: A53 core clock no need to be critical
      clk: imx8mm: A53 core clock no need to be critical
      clk: imx8mp: A53 core clock no need to be critical
      clk: imx8mq: A53 core clock no need to be critical

Fabio Estevam (2):
      clk: imx8mm: Fix the CLKO1 source select list
      clk: imx8mm: Add CLKO2 support

Horia Geantă (2):
      dt-bindings: clock: imx8mn: add SNVS clock
      clk: imx8mn: add SNVS clock to clock tree

Laurent Pinchart (1):
      clk: imx7d: Add PXP clock

Peng Fan (12):
      clk: imx: imx8mp: add ocotp root clk
      clk: imx: composite-8m: add imx8m_clk_hw_composite_core
      clk: imx: imx8mq: use imx8m_clk_hw_composite_core
      clk: imx: imx8mm: use imx8m_clk_hw_composite_core
      clk: imx: imx8mn: use imx8m_clk_hw_composite_core
      clk: imx: imx8mq: fix a53 cpu clock
      clk: imx: imx8mm: fix a53 cpu clock
      clk: imx: imx8mn: fix a53 cpu clock
      clk: imx: imx8mp: fix a53 cpu clock
      clk: imx: pfdv2: switch to use determine_rate
      clk: imx: pfdv2: determine best parent rate
      clk: imx: pllv4: use prepare/unprepare

 .../devicetree/bindings/clock/imx8mm-clock.txt     | 29 ---------
 .../devicetree/bindings/clock/imx8mm-clock.yaml    | 68 ++++++++++++++++++++
 .../devicetree/bindings/clock/imx8mn-clock.yaml    | 48 +--------------
 .../devicetree/bindings/clock/imx8mq-clock.txt     | 20 ------
 .../devicetree/bindings/clock/imx8mq-clock.yaml    | 72 ++++++++++++++++++++++
 drivers/clk/imx/clk-composite-8m.c                 | 20 ++++--
 drivers/clk/imx/clk-fixup-div.c                    |  2 +-
 drivers/clk/imx/clk-fixup-mux.c                    |  2 +-
 drivers/clk/imx/clk-gate2.c                        |  8 +--
 drivers/clk/imx/clk-imx6sl.c                       |  1 +
 drivers/clk/imx/clk-imx7d.c                        |  1 +
 drivers/clk/imx/clk-imx7ulp.c                      |  2 +-
 drivers/clk/imx/clk-imx8mm.c                       | 63 ++++++++++++-------
 drivers/clk/imx/clk-imx8mn.c                       | 41 +++++++-----
 drivers/clk/imx/clk-imx8mp.c                       | 24 +++++---
 drivers/clk/imx/clk-imx8mq.c                       | 53 ++++++++++------
 drivers/clk/imx/clk-pfdv2.c                        | 61 ++++++++++++------
 drivers/clk/imx/clk-pll14xx.c                      |  4 ++
 drivers/clk/imx/clk-pllv4.c                        | 12 ++--
 drivers/clk/imx/clk-sscg-pll.c                     | 14 ++---
 drivers/clk/imx/clk.h                              | 13 +++-
 include/dt-bindings/clock/imx7d-clock.h            |  3 +-
 include/dt-bindings/clock/imx8mm-clock.h           | 11 +++-
 include/dt-bindings/clock/imx8mn-clock.h           |  8 ++-
 include/dt-bindings/clock/imx8mp-clock.h           |  5 +-
 include/dt-bindings/clock/imx8mq-clock.h           |  9 ++-
 26 files changed, 383 insertions(+), 211 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
