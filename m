Return-Path: <SRS0=7bnF=UX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0319CC43613
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 15:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC33820673
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561390611;
	bh=nQCGscNj+O8LozAIbKzRYPUMqcYVm8/zAFTWN0z8usw=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=bxeJtXYHqvWgVBTkI/acgS7MDtVwGcnF2imVgSSXrLGANlmIB2TisYb9EUe9iNVGM
	 7Gh7j4PAkr12MK0z8ClUnvdTD45yOII41oJk3uDuGewodgEgVsy+fB1AeNyfYQUhd/
	 HKfny9Pt7gwl0JYb330Az+me6UiEZX0mBu5u8x/k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbfFXPgv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 11:36:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfFXPgv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 11:36:51 -0400
Received: from dragon (li1322-146.members.linode.com [45.79.223.146])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76F0420652;
        Mon, 24 Jun 2019 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561390610;
        bh=nQCGscNj+O8LozAIbKzRYPUMqcYVm8/zAFTWN0z8usw=;
        h=Date:From:To:Cc:Subject:From;
        b=VZwLui3eS08gH9W27JP8goYPWjymvy6o3GGB2DTJ7YnynAwQw9hLr2VBDz8+B8ulL
         gI3DcH2gXdZ7FjVSUvmiL1epya80kXTZ35DC4uVCbygZhHw3ZocqlSsp5cR47sLgQm
         7pjb4JTjnnMAOOVpGTyaFTwJ54vnl/IthFA7gsBU=
Date:   Mon, 24 Jun 2019 23:36:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.3
Message-ID: <20190624153615.GA20480@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Here is i.MX clock driver changes I queued for 5.3.  Please keep commit
53c6a2ec018b ("clk: imx8m: Add GIC clock") stable, as I pulled it into
i.MX DT tree as dependency.  Thanks!

Shawn


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-5.3

for you to fetch changes up to 15c64ff7625513c551e2b50c1ae28f729b61c5d3:

  clk: imx8mq: Keep uart clocks on during system boot (2019-06-24 09:43:40 +0800)

----------------------------------------------------------------
i.MX clock changes for 5.3:
 - A series from Abel Vesa to switch i.MX6 and i.MX7 clock drivers to
   clk_hw based API.
 - Add GPIO, SNVS and GIC clocks for i.MX8 drivers.
 - Create a common function imx_mmdc_mask_handshake() for masking MMDC
   handshake.
 - Drop __init for function imx_check_clocks() and imx_register_uart_clocks(),
   so that they can be used by i.MX8 clock drivers which use driver model.
 - Use devm_platform_ioremap_resource() instead of of_iomap() for imx8mq
   clock driver.
 - Mark imx6sx/ul/ull/sll MMDC_P1_IPG and imx8mm DRAM_APB as critical clock.
 - Correct imx7ulp nic1_bus_clk and imx8mm audio_pll2_clk clock setting.

----------------------------------------------------------------
Abel Vesa (18):
      clk: imx: Add imx_obtain_fixed_clock clk_hw based variant
      clk: imx6sx: Do not reparent to unregistered IMX6SX_CLK_AXI
      clk: imx6q: Do not reparent uninitialized IMX6QDL_CLK_PERIPH2 clock
      clk: imx: clk-busy: Switch to clk_hw based API
      clk: imx: clk-cpu: Switch to clk_hw based API
      clk: imx: clk-gate2: Switch to clk_hw based API
      clk: imx: clk-pllv3: Switch to clk_hw based API
      clk: imx: clk-pfd: Switch to clk_hw based API
      clk: imx: clk-gate-exclusive: Switch to clk_hw based API
      clk: imx: clk-fixup-div: Switch to clk_hw based API
      clk: imx: clk-fixup-mux: Switch to clk_hw based API
      clk: imx: Switch wrappers to clk_hw based API
      clk: imx6sl: Switch to clk_hw based API
      clk: imx6q: Switch to clk_hw based API
      clk: imx6sx: Switch to clk_hw based API
      clk: imx6ul: Switch to clk_hw based API
      clk: imx7d: Switch to clk_hw based API
      clk: imx6sll: Switch to clk_hw based API

Anson Huang (14):
      dt-bindings: clock: imx8mm: Add GPIO clocks
      clk: imx8mm: add GPIO clocks to clock tree
      dt-bindings: clock: imx8mq: Add SNVS clock
      clk: imx8mq: add SNVS clock to clock tree
      dt-bindings: clock: imx8mm: Add SNVS clock
      clk: imx8mm: add SNVS clock to clock tree
      clk: imx: Add common API for masking MMDC handshake
      clk: imx: Use imx_mmdc_mask_handshake() API for masking MMDC channel
      clk: imx7ulp: update nic1_bus_clk parent info
      clk: imx: Remove __init for imx_check_clocks() API
      clk: imx8mq: Use imx_check_clocks() API directly
      clk: imx8mq: Use devm_platform_ioremap_resource() instead of of_iomap()
      clk: imx: Remove __init for imx_register_uart_clocks() API
      clk: imx8mq: Keep uart clocks on during system boot

Arnd Bergmann (1):
      clk: imx6q: fix section mismatch warning

Jacky Bai (1):
      clk: imx: keep the mmdc p1 ipg clock always on on 6sx/ul/ull/sll

Leonard Crestez (3):
      dt-bindings: clock: imx8m: Add GIC clock
      clk: imx8m: Add GIC clock
      clk: imx8mm: Mark dram_apb critical

Peng Fan (1):
      clk: imx: imx8mm: correct audio_pll2_clk to audio_pll2_out

 drivers/clk/imx/clk-busy.c               |  30 +-
 drivers/clk/imx/clk-cpu.c                |  14 +-
 drivers/clk/imx/clk-fixup-div.c          |  15 +-
 drivers/clk/imx/clk-fixup-mux.c          |  15 +-
 drivers/clk/imx/clk-gate-exclusive.c     |  17 +-
 drivers/clk/imx/clk-gate2.c              |  14 +-
 drivers/clk/imx/clk-imx6q.c              | 781 ++++++++++++------------
 drivers/clk/imx/clk-imx6sl.c             | 409 ++++++-------
 drivers/clk/imx/clk-imx6sll.c            | 433 +++++++-------
 drivers/clk/imx/clk-imx6sx.c             | 661 +++++++++++----------
 drivers/clk/imx/clk-imx6ul.c             | 579 +++++++++---------
 drivers/clk/imx/clk-imx7d.c              | 983 ++++++++++++++++---------------
 drivers/clk/imx/clk-imx7ulp.c            |   2 +-
 drivers/clk/imx/clk-imx8mm.c             |  18 +-
 drivers/clk/imx/clk-imx8mq.c             |  27 +-
 drivers/clk/imx/clk-pfd.c                |  14 +-
 drivers/clk/imx/clk-pllv3.c              |  14 +-
 drivers/clk/imx/clk.c                    |  34 +-
 drivers/clk/imx/clk.h                    | 143 +++--
 include/dt-bindings/clock/imx8mm-clock.h |  11 +-
 include/dt-bindings/clock/imx8mq-clock.h |   5 +-
 21 files changed, 2225 insertions(+), 1994 deletions(-)
