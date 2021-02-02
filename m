Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4D6C433DB
	for <linux-clk@archiver.kernel.org>; Tue,  2 Feb 2021 07:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764A164DDD
	for <linux-clk@archiver.kernel.org>; Tue,  2 Feb 2021 07:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhBBHeR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Feb 2021 02:34:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:55726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhBBHeP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Feb 2021 02:34:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B941C64ECB;
        Tue,  2 Feb 2021 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612251215;
        bh=W103zQPUWKGj/pvBUOMxNpf1vPQUuHg2w/wuEsAcNO0=;
        h=Date:From:To:Cc:Subject:From;
        b=qhPDYxnOewd1RBmIEQV67OrUXaQBaz+CTW1lU4/nGlfRdP7WVe6m1S/O5kZvVdDod
         gFcygrMSbrMGpd1YBi0o25TWYiogujQMVoPA7paIBM8rfvazMP87VTUrFn2xgXRhas
         XJ+zEWOzqE3bKktclc47U1rPv+3yDp0t2E7L7ojBC53bTtoAoF0U3cHfT7TvulKkY4
         i0R0btVUwp9rxUO7IKLarzXRlwdqNRGcE6SxYMYSmovUHrN7VzYSj8OuJ5MWo1A5yM
         Yi06wiojxYQHufWZusO4iXy71PKQbmbV9iMRCNaOt8dLzBRq0VSeSRKg/ezIUuvcoQ
         hE8KBVG6OFrLA==
Date:   Tue, 2 Feb 2021 15:33:30 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.12
Message-ID: <20210202073329.GQ907@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.12

for you to fetch changes up to de5774d192ba15539191ed8b0c79f3d52464b8e3:

  clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible header (2021-01-30 22:13:23 +0800)

----------------------------------------------------------------
i.MX clock changes for 5.12:

- Use pr_notice() instead of pr_warn() on i.MX6Q pre-boot ldb_di_clk
  reparenting.
- A couple of W=1 build warning fixes from Lee Jones.
- A series from Liu Ying that adds some SCU clocks support for i.MX8qxp
  DC0/MIPI-LVDS subsystems.
- A series from Lucas Stach that adds PLL monitor clocks for i.MX8MQ,
  and clkout1/2 support for i.MX8MM/MN.

----------------------------------------------------------------
Ahmad Fatoum (1):
      clk: imx6q: demote warning about pre-boot ldb_di_clk reparenting

Lee Jones (2):
      clk: imx: clk-imx31: Remove unused static const table 'uart_clks'
      clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible header

Liu Ying (4):
      clk: imx: clk-imx8qxp: Add SCU clocks support for DC0 PLL clocks
      clk: imx: clk-imx8qxp: Add SCU clocks support for DC0 bypass clocks
      clk: imx: clk-imx8qxp: Register DC0 display clocks with imx_clk_scu2()
      clk: imx: clk-imx8qxp: Add some SCU clocks support for MIPI-LVDS subsystems

Lucas Stach (3):
      clk: imx8mq: add PLL monitor output
      clk: imx8mm: add clkout1/2 support
      clk: imx8mn: add clkout1/2 support

 arch/arm/mach-imx/common.h               |  1 -
 arch/arm/mach-imx/cpuidle-imx6sl.c       |  1 +
 arch/arm/mach-imx/pm-imx6.c              |  1 +
 drivers/clk/imx/clk-imx31.c              | 10 ----------
 drivers/clk/imx/clk-imx6q.c              |  6 +++---
 drivers/clk/imx/clk-imx6sl.c             |  1 +
 drivers/clk/imx/clk-imx8mm.c             | 12 ++++++++++++
 drivers/clk/imx/clk-imx8mn.c             | 12 ++++++++++++
 drivers/clk/imx/clk-imx8mq.c             | 22 ++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c            | 26 ++++++++++++++++++++++++--
 include/dt-bindings/clock/imx8-clock.h   |  2 ++
 include/dt-bindings/clock/imx8mm-clock.h | 10 +++++++++-
 include/dt-bindings/clock/imx8mn-clock.h |  9 ++++++++-
 include/dt-bindings/clock/imx8mq-clock.h | 16 +++++++++++++++-
 include/linux/clk/imx.h                  | 15 +++++++++++++++
 15 files changed, 125 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/clk/imx.h
