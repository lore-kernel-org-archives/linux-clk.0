Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCE2C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 22:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiBXWk7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbiBXWk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:40:58 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2426E20C1B9
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:40:25 -0800 (PST)
Received: from [185.156.123.69] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nNMmd-00042X-Cg; Thu, 24 Feb 2022 23:40:23 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.18
Date:   Thu, 24 Feb 2022 23:40:21 +0100
Message-ID: <5797913.TNu9mpgMAd@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below some Rockchip clock changes for 5.18

Please pull, thanks
Heiko

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-clk1

for you to fetch changes up to 10b74af310735860510a533433b1d3ab2e05a138:

  clk: rockchip: re-add rational best approximation algorithm to the fractional divider (2022-02-24 00:07:16 +0100)

----------------------------------------------------------------
Improve the clocks for the rk3568 display outputs (parenting, pll-rates),
use of_device_get_match_data() instead of open-coding on rk3568
and reintroduce the expected fractional-divider behaviour that disappeared
with the addition of CLK_FRAC_DIVIDER_POWER_OF_TWO_PS.

----------------------------------------------------------------
Minghao Chi (CGEL ZTE) (1):
      clk/rockchip: Use of_device_get_match_data()

Quentin Schulz (1):
      clk: rockchip: re-add rational best approximation algorithm to the fractional divider

Sascha Hauer (3):
      clk: rockchip: Add more PLL rates for rk3568
      clk: rockchip: drop CLK_SET_RATE_PARENT from dclk_vop* on rk3568
      clk: rockchip: Add CLK_SET_RATE_PARENT to the HDMI reference clock on rk3568

 drivers/clk/rockchip/clk-rk3568.c | 20 ++++++++++++--------
 drivers/clk/rockchip/clk.c        |  3 +++
 2 files changed, 15 insertions(+), 8 deletions(-)



