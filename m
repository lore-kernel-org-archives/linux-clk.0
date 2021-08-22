Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE892C4338F
	for <linux-clk@archiver.kernel.org>; Sun, 22 Aug 2021 10:14:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74EEF6127B
	for <linux-clk@archiver.kernel.org>; Sun, 22 Aug 2021 10:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbhHVKP2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Aug 2021 06:15:28 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43746 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhHVKP1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 22 Aug 2021 06:15:27 -0400
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mHkV0-0003p8-Pt; Sun, 22 Aug 2021 12:14:42 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.15
Date:   Sun, 22 Aug 2021 12:14:41 +0200
Message-ID: <4308060.PYKUYFuaPT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.15

Please pull, thanks
Heiko

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-clk1

for you to fetch changes up to c0c81245dac7caaef4db627fb7043495d1afe662:

  clk: rockchip: make rk3308 ddrphy4x clock critical (2021-07-29 12:43:11 +0200)

----------------------------------------------------------------
YAML conversion of rk3399 clock controller binding, removal of GRF
dependency for the rk3328/rk3036 pll types and some clock tree fixes.

----------------------------------------------------------------
Chris Morgan (1):
      clk: rockchip: add dt-binding clkid for hclk_sfc on rk3036

Jon Lin (2):
      clk: rockchip: rk3036: fix up the sclk_sfc parent error
      clk: rockchip: Add support for hclk_sfc on rk3036

Nícolas F. R. A. Prado (1):
      dt-bindings: clk: Convert rockchip,rk3399-cru to DT schema

Peter Geis (1):
      clk: rockchip: drop GRF dependency for rk3328/rk3036 pll types

Yunhao Tian (1):
      clk: rockchip: make rk3308 ddrphy4x clock critical

 .../bindings/clock/rockchip,rk3399-cru.txt         | 68 ----------------
 .../bindings/clock/rockchip,rk3399-cru.yaml        | 92 ++++++++++++++++++++++
 drivers/clk/rockchip/clk-pll.c                     |  2 +-
 drivers/clk/rockchip/clk-rk3036.c                  |  5 +-
 drivers/clk/rockchip/clk-rk3308.c                  |  1 +
 include/dt-bindings/clock/rk3036-cru.h             |  1 +
 6 files changed, 98 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.yaml



