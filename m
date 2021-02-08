Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E523C433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 00:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0423264DE9
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 00:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhBHAvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Feb 2021 19:51:35 -0500
Received: from gloria.sntech.de ([185.11.138.130]:55572 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229564AbhBHAve (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Feb 2021 19:51:34 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l8ulN-0006cH-UM; Mon, 08 Feb 2021 01:50:50 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.12
Date:   Mon, 08 Feb 2021 01:50:45 +0100
Message-ID: <3091603.aeNJFYEL58@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.12

Please pull, thanks
Heiko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-clk1

for you to fetch changes up to 4bc23b3c83c9a3fc0a7dd8f2f11f451aa92c85cd:

  clk: rockchip: fix DPHY gate locations on rk3368 (2021-02-06 01:05:04 +0100)

----------------------------------------------------------------
Kerneldoc fixes and some new rk3368 clock ids related to
camera input.

----------------------------------------------------------------
Heiko Stuebner (5):
      clk: rockchip: add clock ids for PCLK_DPHYRX and PCLK_DPHYTX0 on rk3368
      clk: rockchip: use clock ids for PCLK_DPHYRX and PCLK_DPHYTX0 on rk3368
      clk: rockchip: add clock id for SCLK_VIP_OUT on rk3368
      clk: rockchip: use clock id for SCLK_VIP_OUT on rk3368
      clk: rockchip: fix DPHY gate locations on rk3368

Lee Jones (4):
      clk: rockchip: Demote non-conformant kernel-doc headers in main clock code
      clk: rockchip: Remove unused/undocumented struct members from clk-cpu
      clk: rockchip: Demote kernel-doc abuses to standard comment blocks in plls
      clk: rockchip: Demote non-conformant kernel-doc header in half-divider

 drivers/clk/rockchip/clk-cpu.c          | 4 ----
 drivers/clk/rockchip/clk-half-divider.c | 2 +-
 drivers/clk/rockchip/clk-pll.c          | 6 +++---
 drivers/clk/rockchip/clk-rk3368.c       | 6 +++---
 drivers/clk/rockchip/clk.c              | 4 ++--
 include/dt-bindings/clock/rk3368-cru.h  | 3 +++
 6 files changed, 12 insertions(+), 13 deletions(-)



