Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7E0C43334
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jul 2022 21:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbiGUVXc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jul 2022 17:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbiGUVXb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jul 2022 17:23:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C119284C
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 14:23:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77C6BB82690
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 21:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5B3C3411E;
        Thu, 21 Jul 2022 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658438608;
        bh=K0ItI/WHfLgQ+BjxViAN5tVcOFKHARnyVGVtzdq8OaM=;
        h=Date:From:To:Cc:Subject:From;
        b=KbvIaBBDiHDI1CnXeVwsIfPC2RHjCUvWPpZ2OuI0pL/UBEXlMpvI0F02WXqDuEhpK
         inngNMs/ola/WcYJYJwD2itqHbYlphZo62pzmpZJ5cwMOO2IY3JKuRtqtHCMsnQ9b3
         RASBROwNrvvJ80FLiyGwoW5IMZC66Fk6c07uSc9bNNL2hFNJ1YdAFIs/610aLCHKhy
         5yKx7sE9ifx+B7C1wE7+cen+T6iaokq4HwqrLrwodUf+L9lCkhXDMA8sLQvBIbvaRc
         RQEMh7NZnIbb/H8jqP06T3qiZWh6n38nvtiSgEHBuInnLUujg1VkUqhw1rXA1Po1K2
         MGMzgdZynR86Q==
Date:   Thu, 21 Jul 2022 23:23:23 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 5.19
Message-ID: <YtnDy29glGFDhqU1@kista.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

As it turns out, commit 38d321b61bda ("clk: sunxi-ng: h6-r: Add RTC gate
clock"), queued for 5.19, introduced a bug. This bug is accidentally
fixed by commit e1c51d31befc ("clk: sunxi-ng: Deduplicate ccu_clks
arrays"), which is already queued for 5.20.

Although this commit as a fix is much bigger than it needs to be, I
still suggest that's fast tracked to 5.19. This will also avoid any
merge conflicts during merging material for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-5.19-1

for you to fetch changes up to 48e29e0f3be086a28a9384befa77d02a43be2f98:

  clk: sunxi-ng: Deduplicate ccu_clks arrays (2022-07-21 23:11:28 +0200)

----------------------------------------------------------------
Fix H6 RTC clock

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: Deduplicate ccu_clks arrays

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c |  16 +----
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c   |  79 ++++++-----------------
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c    | 113 +--------------------------------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c     |  40 +++---------
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  84 ++----------------------
 5 files changed, 40 insertions(+), 292 deletions(-)
