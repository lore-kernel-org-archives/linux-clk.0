Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF32C27C41
	for <linux-clk@archiver.kernel.org>; Wed, 16 Aug 2023 22:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346700AbjHPWGB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Aug 2023 18:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346818AbjHPWF6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Aug 2023 18:05:58 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E051A26AD
        for <linux-clk@vger.kernel.org>; Wed, 16 Aug 2023 15:05:55 -0700 (PDT)
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qWOeH-0007cQ-IZ; Thu, 17 Aug 2023 00:05:53 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.6 #1
Date:   Thu, 17 Aug 2023 00:05:52 +0200
Message-ID: <8651570.alqRGMn8q6@phil>
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


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-clk1

for you to fetch changes up to 5c7a71fd82350c2f5828a66a1f2f38306d61cbc7:

  clk: rockchip: rv1126: Add PD_VO clock tree (2023-08-10 23:14:06 +0200)

----------------------------------------------------------------
PLL rates for rk3568 and the display clock tree for rv1126 which wasn't
present before.
0#

----------------------------------------------------------------
Alibek Omarov (2):
      clk: rockchip: rk3568: Add PLL rate for 101MHz
      clk: rockchip: rk3568: Fix PLL rate setting for 78.75MHz

Jagan Teki (1):
      clk: rockchip: rv1126: Add PD_VO clock tree

 drivers/clk/rockchip/clk-rk3568.c |  3 +-
 drivers/clk/rockchip/clk-rv1126.c | 59 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)



