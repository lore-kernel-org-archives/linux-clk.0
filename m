Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A8FC4363D
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 22:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6605B20888
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 22:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgIWWUm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 18:20:42 -0400
Received: from gloria.sntech.de ([185.11.138.130]:49898 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgIWWUm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Sep 2020 18:20:42 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kLD7v-0001h5-0F; Thu, 24 Sep 2020 00:20:39 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.10
Date:   Thu, 24 Sep 2020 00:20:38 +0200
Message-ID: <2431097.4Q4uIW3KjO@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.10
I gave the module rework a spin in a number of different Rockchip socs
and all were happy so far.


Please pull, thanks
Heiko


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.10-rockchip-clk1

for you to fetch changes up to 70d839e2761d22eba6facdb3b65faea4d57f355d:

  clk: rockchip: rk3399: Support module build (2020-09-22 15:16:54 +0200)

----------------------------------------------------------------
Ability to build the clock driver as module and removal
of an unused parent-names struct.

----------------------------------------------------------------
Elaine Zhang (6):
      clk: rockchip: Use clk_hw_register_composite instead of clk_register_composite calls
      clk: rockchip: Export rockchip_clk_register_ddrclk()
      clk: rockchip: Export rockchip_register_softrst()
      clk: rockchip: Export some clock common APIs for module drivers
      clk: rockchip: fix the clk config to support module build
      clk: rockchip: rk3399: Support module build

Krzysztof Kozlowski (1):
      clk: rockchip: rk3308: drop unused mux_timer_src_p

 drivers/clk/Kconfig                     |   1 +
 drivers/clk/rockchip/Kconfig            |  78 ++++++++++++++++++++++
 drivers/clk/rockchip/Makefile           |  42 ++++++------
 drivers/clk/rockchip/clk-ddr.c          |   1 +
 drivers/clk/rockchip/clk-half-divider.c |  18 ++---
 drivers/clk/rockchip/clk-rk3308.c       |   1 -
 drivers/clk/rockchip/clk-rk3399.c       |  56 ++++++++++++++++
 drivers/clk/rockchip/clk.c              | 113 +++++++++++++++++---------------
 drivers/clk/rockchip/softrst.c          |   7 +-
 9 files changed, 232 insertions(+), 85 deletions(-)
 create mode 100644 drivers/clk/rockchip/Kconfig



