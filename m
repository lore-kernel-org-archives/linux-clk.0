Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C936C48BDF
	for <linux-clk@archiver.kernel.org>; Sun, 20 Jun 2021 22:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D341F611AC
	for <linux-clk@archiver.kernel.org>; Sun, 20 Jun 2021 22:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhFTWeI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Jun 2021 18:34:08 -0400
Received: from gloria.sntech.de ([185.11.138.130]:56598 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229904AbhFTWeI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Jun 2021 18:34:08 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lv5yq-0005VB-Mv; Mon, 21 Jun 2021 00:31:52 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.14
Date:   Mon, 21 Jun 2021 00:31:52 +0200
Message-ID: <4340280.LvFx2qVVIh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below Rockchip clock changes for 5.14

Please pull, thanks
Heiko

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-clk1

for you to fetch changes up to 2adafc0512625bbd090dc37a353ddda15d525e9d:

  clk: rockchip: export ACLK_VCODEC for RK3036 (2021-05-28 17:53:19 +0200)

----------------------------------------------------------------
Reduce memory footprint of PLL rate tables, a fix for the newly
added rk3568 clk driver and an exported clock for the
newly added video decoder.

----------------------------------------------------------------
Alex Bee (1):
      clk: rockchip: export ACLK_VCODEC for RK3036

Elaine Zhang (1):
      clk: rockchip: Optimize PLL table memory usage

Peter Geis (1):
      clk: rockchip: fix rk3568 cpll clk gate bits

 drivers/clk/rockchip/clk-rk3036.c |  2 +-
 drivers/clk/rockchip/clk-rk3568.c | 10 +++++-----
 drivers/clk/rockchip/clk.h        | 29 ++++++++++++++++++-----------
 3 files changed, 24 insertions(+), 17 deletions(-)



