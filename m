Return-Path: <SRS0=/Yer=S2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B09C10F11
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 16:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AAA5206A3
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 16:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbfDXQt0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Apr 2019 12:49:26 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43154 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732121AbfDXQt0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Apr 2019 12:49:26 -0400
Received: from [80.143.192.209] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hJL5H-0000qO-4k; Wed, 24 Apr 2019 18:49:23 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 5.2
Date:   Wed, 24 Apr 2019 18:49:22 +0200
Message-ID: <3556608.kE4XR7voD3@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below rockchip clock changes for 5.2
with quite a bit of attention for the rk3288.

Please pull

Thanks
Heiko

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.2-rockchip-clk-1

for you to fetch changes up to f4033db5b84ebe4b32c25ba2ed65ab20b628996a:

  clk: rockchip: undo several noc and special clocks as critical on rk3288 (2019-04-23 12:17:11 +0200)

----------------------------------------------------------------
Clock fixes for rk3328 and rk3288 and a new sub-type for an upcoming
soc where mux and divider are not necessarily in the same register
anymore.

----------------------------------------------------------------
Douglas Anderson (4):
      clk: rockchip: Make rkpwm a critical clock on rk3288
      clk: rockchip: Fix video codec clocks on rk3288
      clk: rockchip: Turn on "aclk_dmac1" for suspend on rk3288
      clk: rockchip: undo several noc and special clocks as critical on rk3288

Finley Xiao (1):
      clk: rockchip: add a COMPOSITE_DIV_OFFSET clock-type

Jonas Karlman (1):
      clk: rockchip: fix wrong clock definitions for rk3328

Matthias Kaehlcke (1):
      clk: rockchip: Limit use of USB PHY clock to USB on rk3288

 drivers/clk/rockchip/clk-rk3288.c | 36 ++++++++++++++++++++++--------------
 drivers/clk/rockchip/clk-rk3328.c | 18 +++++++++---------
 drivers/clk/rockchip/clk.c        |  9 ++++++---
 drivers/clk/rockchip/clk.h        | 23 +++++++++++++++++++++++
 4 files changed, 60 insertions(+), 26 deletions(-)



