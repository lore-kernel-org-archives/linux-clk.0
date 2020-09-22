Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57400C4727E
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 09:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EA472396D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600765349;
	bh=Yt2qtVQ+9GNF9betp7d1523don1oG5OlO7coLyPAX5I=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=ybESBh7l8yjS+5sbjepCldGgZRBQRIDuHSd9uaW9f7U/+Cj6W1nRKfRmo7J8w8wOj
	 CC72LWsz7v4fwgdw6lh2J+RDxwANlTk05nZit7T3xHf0dyEzmf9addB7+nI8XcK6bK
	 sXonNgXSra69mIecdNxn4Gdr/WiJrEdtRek3f7w0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgIVJC2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 05:02:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:55296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIVJC2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 05:02:28 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB301208A9;
        Tue, 22 Sep 2020 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600765348;
        bh=Yt2qtVQ+9GNF9betp7d1523don1oG5OlO7coLyPAX5I=;
        h=Date:From:To:Cc:Subject:From;
        b=mzgTDzn+zEoexk2pE34YqwLjEsZTA8YuEESSEtGECqWT48lFOdfbEWrr2LVfFBisz
         yX6pkMZ2i2h/qqWIvoxXPBoGmtO5FP2cV2IBiybmB+OBI8D18DK9wPrLSPZTStOgZ7
         SVubZDBQhKtizjNjbcEeJk/LujXYRIHg2Ay4+pmI=
Date:   Tue, 22 Sep 2020 17:02:22 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock change for 5.10
Message-ID: <20200922090221.GA17284@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.10

for you to fetch changes up to 805837740d0142c38ab94b2269ca28da3890ae68:

  clk: imx: imx21: Remove clock driver (2020-09-22 14:09:19 +0800)

----------------------------------------------------------------
i.MX clock change for 5.10:

- A series from Anson Huang to support building i.MX ARMv8 platforms
  clock driver as module.
- Remove i.MX21 clock driver, as i.MX21 platform support is being
  dropped.
- A couple of minor imx8mp clock correction from Jacky Bai.
- Add clock for CRC block found on vf610 SoC.
- A couple of clock flag fix-up from Peng Fan.
- Minor kerneldoc fix-up for i.MX clock drivers.

----------------------------------------------------------------
Anson Huang (7):
      clk: imx6sl: Use BIT(x) to avoid shifting signed 32-bit value by 31 bits
      clk: composite: Export clk_hw_register_composite()
      clk: imx: Support building i.MX common clock driver as module
      clk: imx: Add clock configuration for ARMv7 platforms
      clk: imx8m: Support module build
      clk: imx8qxp: Support building i.MX8QXP clock driver as module
      clk: imx: Explicitly include bits.h

Fabio Estevam (1):
      clk: imx: imx21: Remove clock driver

Jacky Bai (2):
      clk: imx: Correct the root clk of media ldb on imx8mp
      clk: imx: Correct the memrepair clock on imx8mp

Jonathan Neuschäfer (1):
      clk: imx: gate2: Fix a few typos

Krzysztof Kozlowski (2):
      clk: imx: vf610: Add CRC clock
      clk: imx: Fix and update kerneldoc

Peng Fan (2):
      clk: imx: fix composite peripheral flags
      clk: imx: fix i.MX7D peripheral clk mux flags

 drivers/clk/clk-composite.c              |   1 +
 drivers/clk/imx/Kconfig                  |  90 +++++++++++++---
 drivers/clk/imx/Makefile                 |  78 +++++++-------
 drivers/clk/imx/clk-busy.c               |   1 +
 drivers/clk/imx/clk-composite-7ulp.c     |   1 +
 drivers/clk/imx/clk-composite-8m.c       |   3 +
 drivers/clk/imx/clk-cpu.c                |   2 +
 drivers/clk/imx/clk-fixup-mux.c          |   1 +
 drivers/clk/imx/clk-frac-pll.c           |   2 +
 drivers/clk/imx/clk-gate2.c              |   4 +-
 drivers/clk/imx/clk-imx21.c              | 171 -------------------------------
 drivers/clk/imx/clk-imx6q.c              |   1 +
 drivers/clk/imx/clk-imx6sl.c             |  15 +--
 drivers/clk/imx/clk-imx6sx.c             |   1 +
 drivers/clk/imx/clk-imx7d.c              | 132 ++++++++++++------------
 drivers/clk/imx/clk-imx8mm.c             |   4 +
 drivers/clk/imx/clk-imx8mn.c             |   4 +
 drivers/clk/imx/clk-imx8mp.c             |  28 +++--
 drivers/clk/imx/clk-imx8mq.c             |   4 +
 drivers/clk/imx/clk-imx8qxp-lpcg.c       |   4 +
 drivers/clk/imx/clk-imx8qxp.c            |   4 +
 drivers/clk/imx/clk-lpcg-scu.c           |   1 +
 drivers/clk/imx/clk-pfd.c                |   2 +-
 drivers/clk/imx/clk-pfdv2.c              |   2 +-
 drivers/clk/imx/clk-pll14xx.c            |   7 +-
 drivers/clk/imx/clk-pllv1.c              |   1 +
 drivers/clk/imx/clk-pllv3.c              |   5 +-
 drivers/clk/imx/clk-pllv4.c              |   1 +
 drivers/clk/imx/clk-sscg-pll.c           |   2 +
 drivers/clk/imx/clk-vf610.c              |   2 +
 drivers/clk/imx/clk.c                    |  18 +++-
 drivers/clk/imx/clk.h                    |   7 ++
 include/dt-bindings/clock/imx8mp-clock.h |   2 +-
 include/dt-bindings/clock/vf610-clock.h  |   3 +-
 34 files changed, 281 insertions(+), 323 deletions(-)
 delete mode 100644 drivers/clk/imx/clk-imx21.c
