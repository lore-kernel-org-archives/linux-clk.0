Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967CAC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 27 Sep 2021 09:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7105461166
	for <linux-clk@archiver.kernel.org>; Mon, 27 Sep 2021 09:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhI0Jp5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Sep 2021 05:45:57 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38268 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233587AbhI0Jp4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 27 Sep 2021 05:45:56 -0400
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mUnBK-0002Dm-5k; Mon, 27 Sep 2021 11:44:18 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.16
Date:   Mon, 27 Sep 2021 11:44:16 +0200
Message-ID: <4726255.Mh6RI2rZIc@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below some Rockchip clock changes for 5.16

Please pull, thanks
Heiko

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-clk-1

for you to fetch changes up to 1da80da028fe5accb866c0d6899a292ed86bef45:

  clk: rockchip: use module_platform_driver_probe (2021-09-21 00:44:53 +0200)

----------------------------------------------------------------
Move to use module_platform_probe and enable usage
of Coresight-related clocks on rk3399.

----------------------------------------------------------------
Brian Norris (2):
      clk: rockchip: rk3399: make CPU clocks critical
      clk: rockchip: rk3399: expose PCLK_COREDBG_{B,L}

Miles Chen (1):
      clk: rockchip: use module_platform_driver_probe

 drivers/clk/rockchip/clk-rk3399.c | 17 ++++++++++-------
 drivers/clk/rockchip/clk-rk3568.c |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)



