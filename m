Return-Path: <SRS0=P1jM=7F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48341C433E0
	for <linux-clk@archiver.kernel.org>; Sat, 23 May 2020 01:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 226602074B
	for <linux-clk@archiver.kernel.org>; Sat, 23 May 2020 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590196060;
	bh=BldAPkzFZw7CTlf8sR3v71/UbISCsC7M7kRPSqLDD7Q=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=bpaIRf3E9Mq5xdRxbDWUnWr0rtuQdNWyiU1V3SGZslaVosLnjngpKaJf9U9Ydoxwn
	 7PNmrHfeV2UiiGGddn+PiLh0Ep6mvfyoivIMkbh9XN3oPnQUpZTewy5SNxeLQHpaWb
	 iVadLOwqD/7iq6ajP1TlrRAGMX9bMeo72LwYhk3g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387473AbgEWBHk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 May 2020 21:07:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387465AbgEWBHj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 May 2020 21:07:39 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 916F0206B6;
        Sat, 23 May 2020 01:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590196058;
        bh=BldAPkzFZw7CTlf8sR3v71/UbISCsC7M7kRPSqLDD7Q=;
        h=Date:From:To:Cc:Subject:From;
        b=Wfvo9WYcbIPRpVR9PpsA+jQRtXQSYSs0UMyAnS/YNnENKdfUT2pF1KkrBfDF/yRk5
         uxeaYS03W1Dr9NH8ay1ujG9fy1XjVcWWOslHd21qPrytDgtxfq+Re1NoD1+bn2qQ67
         XkW4+ZD2jkmw0NX5HGcAhvLfABjON9tcug8N+Z4I=
Date:   Sat, 23 May 2020 09:07:33 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock updates for 5.8
Message-ID: <20200523010732.GA9835@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.8

for you to fetch changes up to b1657ad708f761f9ca6d166d4dda685ca39b1254:

  clk: imx: use imx8m_clk_hw_composite_bus for i.MX8M bus clk slice (2020-05-21 22:37:48 +0800)

----------------------------------------------------------------
i.MX clock updates for 5.8:

- A few patches from Abel Vesa as preparation of adding audiomix clock
  support.
- A couple of cleanups from Anson Huang on clk-sscg-pll and clk-pllv3
  driver.
- Update imx7ulp clock driver to use imx_clk_hw_cpu() for making the
  change of ARM core clock easier.
- Drop dependency on ARM64 for i.MX8M clock driver, as there is a move
  to support aarch32 mode on aarch64 hardware.
- A series from Peng Fan to improve i.MX8M clock drivers, using
  composite clock for core and bus clk slice.
- Set a better parent clock for flexcan on i.MX6UL to support CiA102
  defined bit rates.

----------------------------------------------------------------
Abel Vesa (4):
      clk: imx: gate2: Allow single bit gating clock
      clk: imx: pll14xx: Add the device as argument when registering
      clk: imx: Add helpers for passing the device as argument
      dt-bindings: clocks: imx8mp: Add ids for audiomix clocks

Anson Huang (2):
      clk: imx: clk-sscg-pll: Remove unnecessary blank lines
      clk: imx: clk-pllv3: Use readl_relaxed_poll_timeout() for PLL lock wait

Peng Fan (10):
      clk: imx7ulp: make it easy to change ARM core clk
      clk: imx: drop the dependency on ARM64 for i.MX8M
      clk: imx8m: drop clk_hw_set_parent for A53
      clk: imx: imx8mp: fix pll mux bit
      clk: imx8mp: Define gates for pll1/2 fixed dividers
      clk: imx8mp: use imx8m_clk_hw_composite_core to simplify code
      clk: imx8m: migrate A53 clk root to use composite core
      clk: imx: add mux ops for i.MX8M composite clk
      clk: imx: add imx8m_clk_hw_composite_bus
      clk: imx: use imx8m_clk_hw_composite_bus for i.MX8M bus clk slice

Waibel Georg (1):
      clk: imx: imx6ul: change flexcan clock to support CiA bitrates

 drivers/clk/imx/Kconfig                   |   8 +-
 drivers/clk/imx/clk-composite-8m.c        |  56 ++++++++++-
 drivers/clk/imx/clk-gate2.c               |  31 +++++--
 drivers/clk/imx/clk-imx6ul.c              |   2 +-
 drivers/clk/imx/clk-imx7ulp.c             |   6 +-
 drivers/clk/imx/clk-imx8mm.c              |  27 +++---
 drivers/clk/imx/clk-imx8mn.c              |  25 +++--
 drivers/clk/imx/clk-imx8mp.c              | 148 +++++++++++++++---------------
 drivers/clk/imx/clk-imx8mq.c              |  29 +++---
 drivers/clk/imx/clk-pll14xx.c             |   8 +-
 drivers/clk/imx/clk-pllv3.c               |  16 +---
 drivers/clk/imx/clk-sscg-pll.c            |  10 --
 drivers/clk/imx/clk.h                     |  62 ++++++++++++-
 include/dt-bindings/clock/imx7ulp-clock.h |   5 +-
 include/dt-bindings/clock/imx8mp-clock.h  |  90 +++++++++++++++++-
 15 files changed, 358 insertions(+), 165 deletions(-)
