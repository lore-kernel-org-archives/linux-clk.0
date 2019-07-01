Return-Path: <SRS0=aD5i=U6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0F5C0650E
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B4D12089C
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfGAJgU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Jul 2019 05:36:20 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38938 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728035AbfGAJgU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 1 Jul 2019 05:36:20 -0400
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hhsjS-0001pq-GI; Mon, 01 Jul 2019 11:36:18 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 5.3
Date:   Mon, 01 Jul 2019 11:36:17 +0200
Message-ID: <3855405.N158XnxgeL@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below rockchip clock changes for 5.3

Please pull

Thanks
Heiko

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.3-rockchip-clk1

for you to fetch changes up to 794e94ca83450c436313df18291e139cf5f9121f:

  clk: rockchip: export HDMIPHY clock on rk3228 (2019-06-27 11:02:28 +0200)

----------------------------------------------------------------
New clock-ids+exports for two clocks, cleanup for some boilerplate code
for clocks we cannot really control from the kernel, but want to define
separately to match the hardware-description (watchdog in secure-grf).
Improvement in mmc phase calculation and cleanup of some rate defintions.

----------------------------------------------------------------
Douglas Anderson (4):
      clk: rockchip: Use clk_hw_get_rate() in MMC phase calculation
      clk: rockchip: Don't yell about bad mmc phases when getting
      clk: rockchip: Slightly more accurate math in rockchip_mmc_get_phase()
      clk: rockchip: Remove 48 MHz PLL rate from rk3288

Heiko Stuebner (7):
      clk: rockchip: add a type from SGRF-controlled gate clocks
      clk: rockchip: convert pclk_wdt boilerplat to new SGRF_GATE macro
      clk: rockchip: add clock id for watchdog pclk on rk3328
      clk: rockchip: add clock id for hdmi_phy special clock on rk3228
      Merge branch 'v5.3-shared/clk-ids' into v5.3-clk/next
      clk: rockchip: add watchdog pclk on rk3328
      clk: rockchip: export HDMIPHY clock on rk3228

Justin Swartz (1):
      clk: rockchip: add 1.464GHz cpu-clock rate to rk3228

 drivers/clk/rockchip/clk-mmc-phase.c   | 14 ++++++--------
 drivers/clk/rockchip/clk-px30.c        | 12 +++---------
 drivers/clk/rockchip/clk-rk3228.c      |  3 ++-
 drivers/clk/rockchip/clk-rk3288.c      | 13 +++----------
 drivers/clk/rockchip/clk-rk3328.c      |  3 +++
 drivers/clk/rockchip/clk-rk3368.c      | 12 +++---------
 drivers/clk/rockchip/clk-rk3399.c      | 12 +++---------
 drivers/clk/rockchip/clk.h             |  4 ++++
 include/dt-bindings/clock/rk3228-cru.h |  1 +
 include/dt-bindings/clock/rk3328-cru.h |  1 +
 10 files changed, 29 insertions(+), 46 deletions(-)



