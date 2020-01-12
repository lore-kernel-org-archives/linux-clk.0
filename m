Return-Path: <SRS0=BKdB=3B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40885C32771
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 12:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ACC42253D
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578831682;
	bh=08tB+QKAmL9AzKm4AcJ/qaAHWkaY9m8DQhHTJZdndHo=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=KnHZ3o+YL4vkwCHGw7GyBrA3kq+m8hwunMEddLqmZ/aGec0AiDRoaK8kdvo8DMWgx
	 Weoin22t/T2yBoBp4K1yBp/lSWkulp95ykexPCtUt+KBwXwdnLV1j62MtlymbrpV/y
	 QFwGN/Nl225K+bUwrfnJqFDcCPOcU4vpP6DrAFDY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbgALMVV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jan 2020 07:21:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:58304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732764AbgALMVV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 12 Jan 2020 07:21:21 -0500
Received: from T480 (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C87E821744;
        Sun, 12 Jan 2020 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578831680;
        bh=08tB+QKAmL9AzKm4AcJ/qaAHWkaY9m8DQhHTJZdndHo=;
        h=Date:From:To:Cc:Subject:From;
        b=rbDkxxdo4RbgZ24W6fup3jk4/Y2FKEFg/onC+TwA8zQ5nTZHTDHXj2j0unJh/Izn3
         5g2xQxtbq0eEZ/GzPDpplqb3PyR6ZVINavw7K52FMjXX44Q99MI258GpP0O2ondINf
         uMG5qJ2zQVpKzoJDSvBgs4t8NBulJC9P07GWhtiM=
Date:   Sun, 12 Jan 2020 20:21:10 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.6
Message-ID: <20200112122107.GD27570@T480>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-5.6

for you to fetch changes up to ec44c497dc64f1cd4cc4cde414235891344a353a:

  clk: imx: imx8mn: use imx8m_clk_hw_composite_core (2020-01-12 15:24:04 +0800)

----------------------------------------------------------------
i.MX clock changes for 5.6:

 - A series from Abel Vesa to do some trivial cleanups which will be
   helpful for i.MX clock driver switching to clk_hw based API.
 - A series from Anson Huang to add i.MX8MP clock driver support.
 - Disable non-functional divider between pll4_audio_div and
   pll4_post_div on imx6q.
 - Fix watchdog2 clock name typo in imx7ulp clock driver.
 - A couple of patches from Leonard Crestez to set CLK_GET_RATE_NOCACHE
   flag for DRAM related clocks on i.MX8M SoCs.
 - Suppress bind attrs for i.MX8M clock driver to avoid the possibility
   of reloading the driver at runtime.
 - Add a big comment in imx8qxp-lpcg driver to tell why
   devm_platform_ioremap_resource() shouldn't be used for the driver.
 - A correction on i.MX8MN usb1_ctrl parent clock setting.
 - A couple of trivial cleanup on clk-divider-gate driver.
 - A series from Peng Fan to convert i.MX8M clock drivers to clk_hw
   based API.
 - Add a IMX_COMPOSITE_CORE flag for i.MX8M clock drivers to reuse
   imx8m_clk_hw_composite for core clock slice.

----------------------------------------------------------------
Abel Vesa (11):
      clk: imx: Add correct failure handling for clk based helpers
      clk: imx: Rename the SCCG to SSCG
      clk: imx: Replace all the clk based helpers with macros
      clk: imx: pllv1: Switch to clk_hw based API
      clk: imx: pllv2: Switch to clk_hw based API
      clk: imx: imx7ulp composite: Rename to show is clk_hw based
      clk: imx: Rename sccg and frac pll register to suggest clk_hw
      clk: imx: Rename the imx_clk_pllv4 to imply it's clk_hw based
      clk: imx: Rename the imx_clk_pfdv2 to imply it's clk_hw based
      clk: imx: Rename the imx_clk_divider_gate to imply it's clk_hw based
      clk: imx7up: Rename the clks to hws

Anson Huang (3):
      clk: imx: gate4: Switch imx_clk_gate4_flags() to clk_hw based API
      dt-bindings: imx: Add clock binding doc for i.MX8MP
      clk: imx: Add support for i.MX8MP clock driver

Fabio Estevam (1):
      clk: imx7ulp: Fix watchdog2 clock name typo

Jan Remmet (1):
      clk: imx6q: disable non functional divider

Leonard Crestez (4):
      clk: imx8m: Set CLK_GET_RATE_NOCACHE on dram clocks
      clk: imx: Mark dram pll on 8mm and 8mn with CLK_GET_RATE_NOCACHE
      clk: imx8m: Suppress bind attrs
      clk: imx8qxp-lpcg: Warn against devm_platform_ioremap_resource

Li Jun (1):
      clk: imx8mn: correct the usb1_ctrl parent to be usb_bus

Peng Fan (15):
      clk: imx: clk-divider-gate: fix a typo in comment
      clk: imx: clk-divider-gate: drop redundant initialization
      clk: imx: clk-pll14xx: Switch to clk_hw based API
      clk: imx: clk-composite-8m: Switch to clk_hw based API
      clk: imx: add imx_unregister_hw_clocks
      clk: imx: add hw API imx_clk_hw_mux2_flags
      clk: imx: gate3: Switch to clk_hw based API
      clk: imx: Remove __init for imx_obtain_fixed_clk_hw() API
      clk: imx: imx8mn: Switch to clk_hw based API
      clk: imx: imx8mm: Switch to clk_hw based API
      clk: imx: imx8mq: Switch to clk_hw based API
      clk: imx: composite-8m: add imx8m_clk_hw_composite_core
      clk: imx: imx8mq: use imx8m_clk_hw_composite_core
      clk: imx: imx8mm: use imx8m_clk_hw_composite_core
      clk: imx: imx8mn: use imx8m_clk_hw_composite_core

 .../devicetree/bindings/clock/imx8mp-clock.yaml    |  68 ++
 drivers/clk/imx/Kconfig                            |   6 +
 drivers/clk/imx/Makefile                           |   3 +-
 drivers/clk/imx/clk-composite-7ulp.c               |   2 +-
 drivers/clk/imx/clk-composite-8m.c                 |  22 +-
 drivers/clk/imx/clk-divider-gate.c                 |  12 +-
 drivers/clk/imx/clk-frac-pll.c                     |   7 +-
 drivers/clk/imx/clk-imx6q.c                        |   5 +-
 drivers/clk/imx/clk-imx7ulp.c                      | 182 ++---
 drivers/clk/imx/clk-imx8mm.c                       | 558 +++++++--------
 drivers/clk/imx/clk-imx8mn.c                       | 494 ++++++-------
 drivers/clk/imx/clk-imx8mp.c                       | 764 +++++++++++++++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 575 ++++++++--------
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 |  11 +
 drivers/clk/imx/clk-pfdv2.c                        |   2 +-
 drivers/clk/imx/clk-pll14xx.c                      |  29 +-
 drivers/clk/imx/clk-pllv1.c                        |  14 +-
 drivers/clk/imx/clk-pllv2.c                        |  14 +-
 drivers/clk/imx/clk-pllv4.c                        |   2 +-
 drivers/clk/imx/{clk-sccg-pll.c => clk-sscg-pll.c} | 152 ++--
 drivers/clk/imx/clk.c                              |  12 +-
 drivers/clk/imx/clk.h                              | 172 +++--
 include/dt-bindings/clock/imx8mp-clock.h           | 300 ++++++++
 23 files changed, 2349 insertions(+), 1057 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
 create mode 100644 drivers/clk/imx/clk-imx8mp.c
 rename drivers/clk/imx/{clk-sccg-pll.c => clk-sscg-pll.c} (70%)
 create mode 100644 include/dt-bindings/clock/imx8mp-clock.h
