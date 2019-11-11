Return-Path: <SRS0=ilwl=ZD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F68C43331
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 00:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4332206DF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 00:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfKKApI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Nov 2019 19:45:08 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36516 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbfKKApI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 10 Nov 2019 19:45:08 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iTxpJ-00062S-QQ; Mon, 11 Nov 2019 01:45:05 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 5.4
Date:   Mon, 11 Nov 2019 01:45:05 +0100
Message-ID: <2139639.gTPWsosUxc@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below rockchip clock changes for 5.5
Please pull

Thanks
Heiko

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v5.5-rockchip-clk-1

for you to fetch changes up to 3b0b4ebfd761943179fe03b107f66c72c3b5c8d4:

  clk: rockchip: protect the pclk_usb_grf as critical on px30 (2019-11-05 20:53:42 +0100)

----------------------------------------------------------------
Adding a missing static declaration for clk_half_divider_ops
and a number of improvements for the px30 clock tree.

----------------------------------------------------------------
Ben Dooks (Codethink) (1):
      clk: rockchip: make clk_half_divider_ops static

Finley Xiao (2):
      clk: rockchip: Add div50 clock-ids for sdmmc on px30 and nandc
      clk: rockchip: Add div50 clocks for px30 sdmmc, emmc, sdio and nandc

Heiko Stuebner (3):
      clk: rockchip: move px30 critical clocks to correct clock controller
      clk: rockchip: add video-related niu clocks as critical on px30
      clk: rockchip: protect the pclk_usb_grf as critical on px30

 drivers/clk/rockchip/clk-half-divider.c |  3 +-
 drivers/clk/rockchip/clk-px30.c         | 70 ++++++++++++++++++++++++++-------
 include/dt-bindings/clock/px30-cru.h    |  2 +
 3 files changed, 59 insertions(+), 16 deletions(-)




