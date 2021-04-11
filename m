Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F2AC433B4
	for <linux-clk@archiver.kernel.org>; Sun, 11 Apr 2021 09:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 056A961206
	for <linux-clk@archiver.kernel.org>; Sun, 11 Apr 2021 09:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhDKJm0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 11 Apr 2021 05:42:26 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40528 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235005AbhDKJm0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 11 Apr 2021 05:42:26 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVWbY-00047A-2T; Sun, 11 Apr 2021 11:42:08 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.13
Date:   Sun, 11 Apr 2021 11:42:05 +0200
Message-ID: <5450499.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.13

Please pull, thanks
Heiko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-clocks

for you to fetch changes up to 40f29839d8bef5aecaa772afa8e5f2ff8434b49f:

  clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller (2021-03-21 11:13:30 +0100)

----------------------------------------------------------------
Support for the clock controller on the new rk3568
and some cleanups for rk3399 modularization.

----------------------------------------------------------------
Elaine Zhang (4):
      clk: rockchip: add dt-binding header for rk3568
      dt-binding: clock: Document rockchip, rk3568-cru bindings
      clk: rockchip: support more core div setting
      clk: rockchip: add clock controller for rk3568

Heiko Stuebner (2):
      clk: rockchip: drop parenthesis from ARM || COMPILE_TEST depends
      clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller

 .../bindings/clock/rockchip,rk3568-cru.yaml        |   60 +
 drivers/clk/rockchip/Kconfig                       |   29 +-
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |   53 +-
 drivers/clk/rockchip/clk-px30.c                    |    7 +-
 drivers/clk/rockchip/clk-rk3036.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3128.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   14 +-
 drivers/clk/rockchip/clk-rk3228.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3308.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3328.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   14 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   15 +-
 drivers/clk/rockchip/clk-rk3568.c                  | 1725 ++++++++++++++++++++
 drivers/clk/rockchip/clk-rv1108.c                  |    7 +-
 drivers/clk/rockchip/clk.h                         |   54 +-
 include/dt-bindings/clock/rk3568-cru.h             |  926 +++++++++++
 18 files changed, 2857 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3568-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3568.c
 create mode 100644 include/dt-bindings/clock/rk3568-cru.h



