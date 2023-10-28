Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7707FC25B67
	for <linux-clk@archiver.kernel.org>; Sat, 28 Oct 2023 02:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbjJ1CQD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Oct 2023 22:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjJ1CQC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Oct 2023 22:16:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFB390;
        Fri, 27 Oct 2023 19:16:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7529EC433C8;
        Sat, 28 Oct 2023 02:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698459360;
        bh=d1DuWVqz/ZVco7mejt+EwNRvaAbtC8yJGdjeSO0L25U=;
        h=From:To:Cc:Subject:Date:From;
        b=DGfGt0LJOg92w4VOLiUaipuVloMt5+G8yGAfpCpuQSWtd8z88sWfdLYoq9a6ZXVLy
         y0mt5P0/LFJ6hNGHGbgEwnrHrQZhfNG019iKoMUWVXa3uzLAEdzCaHtMIeQ1CtHrRP
         2GgS01psru59S7fwag/2M4hDleYHlynJw0QVziAOpuEIkY25fD42sZIiRUfaFoClbd
         Kb77jZNjkwc2ihbE+3NB8cDulONYSprhcstYXQwiNcdrCf/APs3XHpAod95bsM9701
         JThnmuZyN0LF8QSpv3NsFzM9bd8PjHgsWV0lo5ss+Zu0VF2Jyy6wNWtCIy1xVJhQXv
         vKzsv261tlfjg==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v6.6-rc7
Date:   Fri, 27 Oct 2023 19:15:58 -0700
Message-ID: <20231028021559.138544-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit a47b44fbb13f5e7a981b4515dcddc93a321ae89c:

  clk: tegra: fix error return case for recalc_rate (2023-09-12 10:56:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 790437bbe0ef7e5cb5d091dd711c0d61d03945a5:

  clk: stm32: Fix a signedness issue in clk_stm32_composite_determine_rate() (2023-10-12 17:30:54 -0700)

----------------------------------------------------------------
Three fixes, one for the clk framework and two for clk drivers:

 - Avoid an oops in possible_parent_show() by checking for no parent
   properly when a DT index based lookup is used
 - Handle errors returned from divider_ro_round_rate() in
   clk_stm32_composite_determine_rate()
 - Fix clk_ops::determine_rate() implementation of socfpga's gateclk_ops
   that was ruining uart output because the divider was forgotten about

----------------------------------------------------------------
Alessandro Carminati (1):
      clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name

Dan Carpenter (1):
      clk: stm32: Fix a signedness issue in clk_stm32_composite_determine_rate()

Maxime Ripard (1):
      clk: socfpga: gate: Account for the divider in determine_rate

 drivers/clk/clk.c                  | 21 ++++++++++++---------
 drivers/clk/socfpga/clk-gate.c     | 27 +++++++++++++++++++++++----
 drivers/clk/stm32/clk-stm32-core.c |  2 +-
 3 files changed, 36 insertions(+), 14 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
