Return-Path: <SRS0=qmIf=WV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA877C3A5A1
	for <linux-clk@archiver.kernel.org>; Sun, 25 Aug 2019 11:55:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7ED5217F4
	for <linux-clk@archiver.kernel.org>; Sun, 25 Aug 2019 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566734120;
	bh=IoQV6qRlYw1jN0SzAS1HIdX1/BJ95f/Yu7T9WJkxFy0=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=AWE0utysJwxrkw1aAkESSiQCjLT3vR/FsMTgP75JmP5wgJZYSv0FzpDSmxWbXAdQi
	 hLq3DRoXpf9gO88BMC4usL8jwePjUn16K1NujfMU0sYPUg3fSivVtNv60SqdsBPyW2
	 1vTvz5mRD4mm2U8w2a8RiwY3Zs7iIJ0dnFljmIC4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfHYLzU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Aug 2019 07:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbfHYLzU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 25 Aug 2019 07:55:20 -0400
Received: from X250 (cm-84.211.118.175.getinternet.no [84.211.118.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBBC82082F;
        Sun, 25 Aug 2019 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566734118;
        bh=IoQV6qRlYw1jN0SzAS1HIdX1/BJ95f/Yu7T9WJkxFy0=;
        h=Date:From:To:Cc:Subject:From;
        b=e8XV0TH2T4pJDr5mA5efQmLfyH+drBbWKluLTGhLig/dUTAG4ovzFv3VLuZ9pK0Ay
         nkpO9T63LO2kzie9ExOTTLs8DXcGvsk3ELaQpWvXIflp05cwMPTx8TOZj/S9DLWV+7
         UucH+bwzsxxzK7drBbTHySPCj+CTBG4eR4xQsano=
Date:   Sun, 25 Aug 2019 13:55:06 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.4
Message-ID: <20190825115505.GA20454@X250>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

This is the i.MX clock changes I collected for 5.4.  Please help pull,
and keep commit 6ad7cb7122ce ("clk: imx8: Add DSP related clocks")
stable, as I pulled it into my DT branch as dependency.  Thanks!

Shawn


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.4

for you to fetch changes up to 760e548e7f885d89bf2dfab4838df9379edd19fc:

  clk: imx: imx8mn: fix audio pll setting (2019-08-24 21:04:27 +0200)

----------------------------------------------------------------
i.MX clock changes for 5.4:
 - Add clock driver for i.MX8MN SoC.
 - Switch i.MX8MM clock driver to platform driver.
 - Add API for clk unregister when driver probe fail.
 - Add Hifi4 DSP related clocks for i.MX8QXP SoC.
 - Fix Audio PLL setting and parent clock for USB.
 - Misc i.MX8 clock driver improvements and corrections.

----------------------------------------------------------------
Abel Vesa (3):
      clk: imx: Remove unused clk based API
      clk: imx8mm: Switch to platform driver
      clk: imx8mq: Mark AHB clock as critical

Anson Huang (14):
      dt-bindings: imx: Add clock binding doc for i.MX8MN
      clk: imx8mm: Make 1416X/1443X PLL macro definitions common for usage
      clk: imx: Add API for clk unregister when driver probe fail
      clk: imx: Add support for i.MX8MN clock driver
      clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
      clk: imx8mm: Fix typo of pwm3 clock's mux option #4
      clk: imx8mm: GPT1 clock mux option #5 should be sys_pll1_80m
      clk: imx7ulp: Make sure earlycon's clock is enabled
      clk: imx: Remove unused function statement
      clk: imx8mn: Keep uart clocks on for early console
      clk: imx8mm: Unregister clks when of_clk_add_provider failed
      clk: imx8mq: Unregister clks when of_clk_add_provider failed
      clk: imx8mn: Add missing rate_count assignment for each PLL structure
      clk: imx8mn: Add necessary frequency support for ARM PLL table

Daniel Baluta (1):
      clk: imx8: Add DSP related clocks

Fancy Fang (1):
      clk: imx8mm: rename 'share_count_dcss' to 'share_count_disp'

Leonard Crestez (4):
      clk: imx8mq: Fix sys3 pll references
      clk: imx8mm: Fix incorrect parents
      clk: imx8mn: Fix incorrect parents
      clk: imx8mn: Add GIC clock

Li Jun (2):
      clk: imx8mm: correct the usb1_ctrl parent to be usb_bus
      clk: imx8mq: set correct parent for usb ctrl clocks

Peng Fan (3):
      clk: imx: imx8mm: fix audio pll setting
      clk: imx8mn: fix int pll clk gate
      clk: imx: imx8mn: fix audio pll setting

 .../devicetree/bindings/clock/imx8mn-clock.yaml    | 112 ++++
 drivers/clk/imx/Kconfig                            |   6 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-imx7ulp.c                      |  31 +
 drivers/clk/imx/clk-imx8mm.c                       | 109 ++--
 drivers/clk/imx/clk-imx8mn.c                       | 660 +++++++++++++++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 131 ++--
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 |   5 +
 drivers/clk/imx/clk.c                              |   8 +
 drivers/clk/imx/clk.h                              |  43 +-
 include/dt-bindings/clock/imx8-clock.h             |   6 +-
 include/dt-bindings/clock/imx8mn-clock.h           | 216 +++++++
 12 files changed, 1188 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
 create mode 100644 drivers/clk/imx/clk-imx8mn.c
 create mode 100644 include/dt-bindings/clock/imx8mn-clock.h
