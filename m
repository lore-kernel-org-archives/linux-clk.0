Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0781C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 11:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB6BE21904
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 11:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfBALRp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 06:17:45 -0500
Received: from gloria.sntech.de ([185.11.138.130]:39790 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbfBALRp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Feb 2019 06:17:45 -0500
Received: from [88.128.81.210] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gpWpK-00016f-Sv; Fri, 01 Feb 2019 12:17:42 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 5.1
Date:   Fri, 01 Feb 2019 12:17:47 +0100
Message-ID: <48408534.cOKhDiQbmB@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

looks I can re-use my introduction from 4.20 and 5.0 - no big changes
again this time.

A rate_parent flag and some fixup for the fractional part of a PLL

So please pull.


Thanks
Heiko

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.1-rockchip-clk1

for you to fetch changes up to 491b00ff699356a8dab10eb517a1b44205514c9e:

  clk: rockchip: add CLK_SET_RATE_PARENT for rk3066 lcdc dclks (2019-01-07 09:17:15 +0100)

----------------------------------------------------------------
Fix for PLL rate calculation on rk3328 and SET_RATE_PARENT flag
for the display clock on rk3066.

----------------------------------------------------------------
Finley Xiao (1):
      clk: rockchip: add CLK_SET_RATE_PARENT for rk3066 lcdc dclks

Katsuhiro Suzuki (1):
      clk: rockchip: fix frac settings of GPLL clock for rk3328

 drivers/clk/rockchip/clk-rk3188.c |  4 ++--
 drivers/clk/rockchip/clk-rk3328.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)



