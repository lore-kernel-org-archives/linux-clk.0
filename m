Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B7CC77B75
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 23:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjDQXql (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 19:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjDQXqk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 19:46:40 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C46F1BEB
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 16:46:38 -0700 (PDT)
Received: from [77.22.52.211] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1poYYO-0007Zj-6C; Tue, 18 Apr 2023 01:46:36 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.4 #1
Date:   Tue, 18 Apr 2023 01:46:35 +0200
Message-ID: <3292931.atdPhlSkOF@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below a pull-request with some small Rockchip stuff.

Please pull.

Thanks
Heiko


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-clk1

for you to fetch changes up to 64042c28c3bb6729df8e2fda89bc7ebbe3790907:

  clk: rockchip: rk3588: make gate linked clocks critical (2023-04-18 00:54:04 +0200)

----------------------------------------------------------------
Reparenting fix for the clock supplying camera modules on the rk3399
and more critical (bus-)clocks on the rk3588.

----------------------------------------------------------------
Quentin Schulz (1):
      clk: rockchip: rk3399: allow clk_cifout to force clk_cifout_src to reparent

Sebastian Reichel (1):
      clk: rockchip: rk3588: make gate linked clocks critical

 drivers/clk/rockchip/clk-rk3399.c |  2 +-
 drivers/clk/rockchip/clk-rk3588.c | 42 ++++++++++++++++++++++++---------------
 2 files changed, 27 insertions(+), 17 deletions(-)



