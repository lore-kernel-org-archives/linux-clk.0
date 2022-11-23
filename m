Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E132C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237450AbiKWOF3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237310AbiKWOFF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:05:05 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197965A6CF
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:01:05 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oxqJC-0008Nh-7c; Wed, 23 Nov 2022 15:01:02 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.1 #1
Date:   Wed, 23 Nov 2022 15:01:01 +0100
Message-ID: <23196966.EfDdHjke4D@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below a pull-request with some Rockchip stuff.

Mainly the support for the clock-controller for the new and shiny rk3588,

Please pull.

Thanks
Heiko

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.2-rockchip-clk-1

for you to fetch changes up to 739a6a6bbdb793bd57938cb24aa5a6df89983546:

  clk: rockchip: Fix memory leak in rockchip_clk_register_pll() (2022-11-23 14:51:30 +0100)

----------------------------------------------------------------
Support for the clock and reset unit of the rk3588, as well as a fix
for a possible memory leak in the error path of PLL creation.

----------------------------------------------------------------
Corentin Labbe (1):
      clk: rockchip: use proper crypto0 name on rk3399

Elaine Zhang (5):
      dt-bindings: clock: add rk3588 cru bindings
      clk: rockchip: add register offset of the cores select parent
      clk: rockchip: add pll type for RK3588
      clk: rockchip: allow additional mux options for cpu-clock frequency changes
      clk: rockchip: add clock controller for the RK3588

Heiko Stuebner (1):
      Merge branch 'v6.2-shared/clockids' into v6.2-clk/next

Sebastian Reichel (4):
      dt-bindings: clock: add rk3588 clock definitions
      dt-bindings: reset: add rk3588 reset definitions
      clk: rockchip: simplify rockchip_clk_add_lookup
      clk: rockchip: add lookup table support

Xiu Jianfeng (1):
      clk: rockchip: Fix memory leak in rockchip_clk_register_pll()

 .../bindings/clock/rockchip,rk3588-cru.yaml        |   71 +
 drivers/clk/rockchip/Kconfig                       |    8 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |   69 +-
 drivers/clk/rockchip/clk-pll.c                     |  219 +-
 drivers/clk/rockchip/clk-rk3588.c                  | 2533 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   14 +-
 drivers/clk/rockchip/clk.h                         |   95 +-
 drivers/clk/rockchip/rst-rk3588.c                  |  857 +++++++
 drivers/clk/rockchip/softrst.c                     |   34 +-
 include/dt-bindings/clock/rk3399-cru.h             |    6 +-
 include/dt-bindings/clock/rockchip,rk3588-cru.h    |  766 ++++++
 include/dt-bindings/reset/rockchip,rk3588-cru.h    |  754 ++++++
 13 files changed, 5389 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3588.c
 create mode 100644 drivers/clk/rockchip/rst-rk3588.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h



