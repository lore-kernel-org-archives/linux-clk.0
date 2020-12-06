Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843B3C4361B
	for <linux-clk@archiver.kernel.org>; Sun,  6 Dec 2020 18:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44A5B2312E
	for <linux-clk@archiver.kernel.org>; Sun,  6 Dec 2020 18:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgLFS2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Dec 2020 13:28:19 -0500
Received: from gloria.sntech.de ([185.11.138.130]:58146 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgLFS2T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 6 Dec 2020 13:28:19 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1klyky-0003v5-Lx; Sun, 06 Dec 2020 19:27:36 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.11
Date:   Sun, 06 Dec 2020 19:27:36 +0100
Message-ID: <5662766.lOV4Wx5bFT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.11

Please pull, thanks
Heiko

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-clk-1

for you to fetch changes up to caa2fd752ecb80faf7a2e1cdadc737187934675e:

  clk: rockchip: fix i2s gate bits on rk3066 and rk3188 (2020-11-29 20:10:45 +0100)

----------------------------------------------------------------
Added arch-dependencies for the newly added per-soc config symbols,
a unneeded redundancy removed and making i2s actually work on the
rk3066.

----------------------------------------------------------------
Johan Jonker (2):
      clk: rockchip: add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and uart clocks
      clk: rockchip: fix i2s gate bits on rk3066 and rk3188

Robin Murphy (1):
      clk: rockchip: Add appropriate arch dependencies

Xu Wang (1):
      clk: rockchip: Remove redundant null check before clk_prepare_enable

 drivers/clk/rockchip/Kconfig      | 12 +++++++++++-
 drivers/clk/rockchip/clk-rk3188.c | 35 ++++++++++++++++++-----------------
 drivers/clk/rockchip/clk.c        |  3 +--
 3 files changed, 30 insertions(+), 20 deletions(-)



