Return-Path: <SRS0=IXCz=BB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B11C433E4
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jul 2020 23:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C69692086A
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jul 2020 23:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733032AbgGVXmg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jul 2020 19:42:36 -0400
Received: from gloria.sntech.de ([185.11.138.130]:49028 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbgGVXmg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Jul 2020 19:42:36 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jyONe-0006a2-62; Thu, 23 Jul 2020 01:42:34 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.9
Date:   Thu, 23 Jul 2020 01:42:33 +0200
Message-ID: <3212743.Cm9O4y8ZXk@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.9

Please pull, thanks
Heiko

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.9-rockchip-clk1

for you to fetch changes up to ef990bcad58cf1d13c5a49191a2c2342eb8d6709:

  clk: rockchip: add sclk_mac_lbtest to rk3188_critical_clocks (2020-07-22 20:05:19 +0200)

----------------------------------------------------------------
Use poll_timeout functions for pll lock-waiting and move the rk3036 to use
the available lock-status in pll-registers instead of reading it from the
General Register Files. Handle the clock variants on the rk3288w, revert
the mmc sample shift change on rk3328 and make the mac_lbtest clock
critical on rk3188.

----------------------------------------------------------------
Alex Bee (1):
      clk: rockchip: add sclk_mac_lbtest to rk3188_critical_clocks

Heiko Stuebner (4):
      clk: rockchip: convert rk3399 pll type to use readl_relaxed_poll_timeout
      clk: rockchip: convert basic pll lock_wait to use regmap_read_poll_timeout
      clk: rockchip: convert rk3036 pll type to use internal lock status
      clk: rockchip: use separate compatibles for rk3288w-cru

Mylène Josserand (2):
      clk: rockchip: Handle clock tree for rk3288w variant
      dt-bindings: clocks: add rk3288w variant compatible

Robin Murphy (1):
      clk: rockchip: Revert "fix wrong mmc sample phase shift for rk3328"

 .../bindings/clock/rockchip,rk3288-cru.txt         |  8 ++-
 drivers/clk/rockchip/clk-pll.c                     | 70 +++++++++++++---------
 drivers/clk/rockchip/clk-rk3188.c                  |  1 +
 drivers/clk/rockchip/clk-rk3288.c                  | 39 +++++++++++-
 drivers/clk/rockchip/clk-rk3328.c                  |  8 +--
 5 files changed, 89 insertions(+), 37 deletions(-)



