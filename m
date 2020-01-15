Return-Path: <SRS0=l8GQ=3E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EDAC33CB1
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 09:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D1582467A
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579081160;
	bh=3BwWvYMuem14+n2TmV9f9i2OsgoBt6h4ggsil5vWDig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=HbTcRdY3gLfIFOiI9uwV6/WSZ3oXDNpbphetjDdMChJfef1zoMtfiNgBBc+57vdFl
	 /qYE5sFB9JpIHkKcrwEQP8/DIU/dMof51x6V2PAtyjjejIssdV3ZMMxY+BQxBg9WQm
	 xmhporvNp/wvjFN+vdEtaWXFrcwHYZy6LnFj5a1I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgAOJjU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jan 2020 04:39:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729396AbgAOJjT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jan 2020 04:39:19 -0500
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com [209.85.161.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4398624671
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2020 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579081158;
        bh=3BwWvYMuem14+n2TmV9f9i2OsgoBt6h4ggsil5vWDig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cA5aoyXyxYGI7IPsDDoug57lJFbBGjHiBDTBlq5mADqc33fl2xeBsNh0/zVcPmcVz
         suq5supQ4caOVJbABB4nVMYD3djLwwrCIDoPbMm6L0wj0oJ0GwigBG9dYdhffUT7z0
         GL0QIQnV5eyUvi+5inGo101sNQae5tL8xqVHOWow=
Received: by mail-yw1-f44.google.com with SMTP id l22so10750567ywc.8
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2020 01:39:18 -0800 (PST)
X-Gm-Message-State: APjAAAV3k/D/DWECV4WC9gBM2wHLc5bbH7jUyeF1z9uFQdehA/9EqXcq
        PV0FCl+BnVDWX42h9pJ4qp58NZJI1mYESJDVST8=
X-Google-Smtp-Source: APXvYqwbbFyKZvB+uBGHFoEP+PhF2sh9i9BNmnc893jtvBts+oqSNTSCleGN5QbTWxkgAzRP3Ks1uOl0ZITmuP35jeA=
X-Received: by 2002:a81:60c2:: with SMTP id u185mr22270637ywb.112.1579081157390;
 Wed, 15 Jan 2020 01:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20200112122107.GD27570@T480>
In-Reply-To: <20200112122107.GD27570@T480>
From:   Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 15 Jan 2020 17:39:06 +0800
X-Gmail-Original-Message-ID: <CAJBJ56LzrbLPEL2fCxd+d4GhEcvgk+hUW5QOh7-kjjpE3=40Qw@mail.gmail.com>
Message-ID: <CAJBJ56LzrbLPEL2fCxd+d4GhEcvgk+hUW5QOh7-kjjpE3=40Qw@mail.gmail.com>
Subject: Re: [GIT PULL] i.MX clock changes for 5.6
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Sun, Jan 12, 2020 at 8:21 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
>
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-5.6

Please ignore this pull request.  IMX_COMPOSITE_CORE change breaks DT
compatibility.  I will send v2 shortly with the offending patches
taken out.

Shawn

>
> for you to fetch changes up to ec44c497dc64f1cd4cc4cde414235891344a353a:
>
>   clk: imx: imx8mn: use imx8m_clk_hw_composite_core (2020-01-12 15:24:04 +0800)
>
> ----------------------------------------------------------------
> i.MX clock changes for 5.6:
>
>  - A series from Abel Vesa to do some trivial cleanups which will be
>    helpful for i.MX clock driver switching to clk_hw based API.
>  - A series from Anson Huang to add i.MX8MP clock driver support.
>  - Disable non-functional divider between pll4_audio_div and
>    pll4_post_div on imx6q.
>  - Fix watchdog2 clock name typo in imx7ulp clock driver.
>  - A couple of patches from Leonard Crestez to set CLK_GET_RATE_NOCACHE
>    flag for DRAM related clocks on i.MX8M SoCs.
>  - Suppress bind attrs for i.MX8M clock driver to avoid the possibility
>    of reloading the driver at runtime.
>  - Add a big comment in imx8qxp-lpcg driver to tell why
>    devm_platform_ioremap_resource() shouldn't be used for the driver.
>  - A correction on i.MX8MN usb1_ctrl parent clock setting.
>  - A couple of trivial cleanup on clk-divider-gate driver.
>  - A series from Peng Fan to convert i.MX8M clock drivers to clk_hw
>    based API.
>  - Add a IMX_COMPOSITE_CORE flag for i.MX8M clock drivers to reuse
>    imx8m_clk_hw_composite for core clock slice.
>
> ----------------------------------------------------------------
> Abel Vesa (11):
>       clk: imx: Add correct failure handling for clk based helpers
>       clk: imx: Rename the SCCG to SSCG
>       clk: imx: Replace all the clk based helpers with macros
>       clk: imx: pllv1: Switch to clk_hw based API
>       clk: imx: pllv2: Switch to clk_hw based API
>       clk: imx: imx7ulp composite: Rename to show is clk_hw based
>       clk: imx: Rename sccg and frac pll register to suggest clk_hw
>       clk: imx: Rename the imx_clk_pllv4 to imply it's clk_hw based
>       clk: imx: Rename the imx_clk_pfdv2 to imply it's clk_hw based
>       clk: imx: Rename the imx_clk_divider_gate to imply it's clk_hw based
>       clk: imx7up: Rename the clks to hws
>
> Anson Huang (3):
>       clk: imx: gate4: Switch imx_clk_gate4_flags() to clk_hw based API
>       dt-bindings: imx: Add clock binding doc for i.MX8MP
>       clk: imx: Add support for i.MX8MP clock driver
>
> Fabio Estevam (1):
>       clk: imx7ulp: Fix watchdog2 clock name typo
>
> Jan Remmet (1):
>       clk: imx6q: disable non functional divider
>
> Leonard Crestez (4):
>       clk: imx8m: Set CLK_GET_RATE_NOCACHE on dram clocks
>       clk: imx: Mark dram pll on 8mm and 8mn with CLK_GET_RATE_NOCACHE
>       clk: imx8m: Suppress bind attrs
>       clk: imx8qxp-lpcg: Warn against devm_platform_ioremap_resource
>
> Li Jun (1):
>       clk: imx8mn: correct the usb1_ctrl parent to be usb_bus
>
> Peng Fan (15):
>       clk: imx: clk-divider-gate: fix a typo in comment
>       clk: imx: clk-divider-gate: drop redundant initialization
>       clk: imx: clk-pll14xx: Switch to clk_hw based API
>       clk: imx: clk-composite-8m: Switch to clk_hw based API
>       clk: imx: add imx_unregister_hw_clocks
>       clk: imx: add hw API imx_clk_hw_mux2_flags
>       clk: imx: gate3: Switch to clk_hw based API
>       clk: imx: Remove __init for imx_obtain_fixed_clk_hw() API
>       clk: imx: imx8mn: Switch to clk_hw based API
>       clk: imx: imx8mm: Switch to clk_hw based API
>       clk: imx: imx8mq: Switch to clk_hw based API
>       clk: imx: composite-8m: add imx8m_clk_hw_composite_core
>       clk: imx: imx8mq: use imx8m_clk_hw_composite_core
>       clk: imx: imx8mm: use imx8m_clk_hw_composite_core
>       clk: imx: imx8mn: use imx8m_clk_hw_composite_core
>
>  .../devicetree/bindings/clock/imx8mp-clock.yaml    |  68 ++
>  drivers/clk/imx/Kconfig                            |   6 +
>  drivers/clk/imx/Makefile                           |   3 +-
>  drivers/clk/imx/clk-composite-7ulp.c               |   2 +-
>  drivers/clk/imx/clk-composite-8m.c                 |  22 +-
>  drivers/clk/imx/clk-divider-gate.c                 |  12 +-
>  drivers/clk/imx/clk-frac-pll.c                     |   7 +-
>  drivers/clk/imx/clk-imx6q.c                        |   5 +-
>  drivers/clk/imx/clk-imx7ulp.c                      | 182 ++---
>  drivers/clk/imx/clk-imx8mm.c                       | 558 +++++++--------
>  drivers/clk/imx/clk-imx8mn.c                       | 494 ++++++-------
>  drivers/clk/imx/clk-imx8mp.c                       | 764 +++++++++++++++++++++
>  drivers/clk/imx/clk-imx8mq.c                       | 575 ++++++++--------
>  drivers/clk/imx/clk-imx8qxp-lpcg.c                 |  11 +
>  drivers/clk/imx/clk-pfdv2.c                        |   2 +-
>  drivers/clk/imx/clk-pll14xx.c                      |  29 +-
>  drivers/clk/imx/clk-pllv1.c                        |  14 +-
>  drivers/clk/imx/clk-pllv2.c                        |  14 +-
>  drivers/clk/imx/clk-pllv4.c                        |   2 +-
>  drivers/clk/imx/{clk-sccg-pll.c => clk-sscg-pll.c} | 152 ++--
>  drivers/clk/imx/clk.c                              |  12 +-
>  drivers/clk/imx/clk.h                              | 172 +++--
>  include/dt-bindings/clock/imx8mp-clock.h           | 300 ++++++++
>  23 files changed, 2349 insertions(+), 1057 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
>  create mode 100644 drivers/clk/imx/clk-imx8mp.c
>  rename drivers/clk/imx/{clk-sccg-pll.c => clk-sscg-pll.c} (70%)
>  create mode 100644 include/dt-bindings/clock/imx8mp-clock.h
