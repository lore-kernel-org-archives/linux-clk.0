Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C5DC43217
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 20:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiKRUhv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Nov 2022 15:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiKRUht (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 15:37:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7232BB33
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 12:37:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB9B3B82522
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B07C433C1;
        Fri, 18 Nov 2022 20:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803866;
        bh=cOn+UeznysT4egNokhEsxa/YqRTQE0tFv74FA17/TIk=;
        h=Date:From:To:Cc:Subject:From;
        b=A+iuoCTGcgj+ZVrawrNzi4CnU8rKW/Fd4M9XsJSS3w43HVkAbyfKhazmLkym85u8m
         TxnGopASRnpUdahSBmuwc1raEMJl9qal9EXpmbVKM1Qv6m8qrYMDm8hx86EK1lVKLj
         y/tFVFlBu9bYFZHVOwebAdYgohpcZrQLSbwcrZYIz+Mw0Gzw4j4vu4uFXt0iYGbV5E
         WrkfCN4NbVlUwibT76ekToos90NNKX7N9/oUuov+s6WR0hn8no99Gj8BsrcrPDotXA
         t1/ZkC9j0VsldSV9g7ghZLoBT5y3ZTie33EV05qDNOM8YOxbcc2Aa8q19DknsbD7hY
         pkHwrD2EzMwKw==
Date:   Fri, 18 Nov 2022 21:37:42 +0100
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.2, try 2
Message-ID: <Y3ftFp9FoTmGCi9+@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following clock changes for 6.2.

Best regards,
Jernej

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.2-1

for you to fetch changes up to f64603c9729af406167cb9beb66687b1abc4196e:

  clk: sunxi-ng: f1c100s: Add IR mod clock (2022-11-16 19:49:18 +0100)

----------------------------------------------------------------
- fixed header guard for V3S clocks
- add IR module clock for f1c100s

----------------------------------------------------------------
Andre Przywara (1):
      clk: sunxi-ng: f1c100s: Add IR mod clock

Wei Li (1):
      clk: sunxi-ng: v3s: Correct the header guard of ccu-sun8i-v3s.h

 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |  6 +++---
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
 4 files changed, 16 insertions(+), 5 deletions(-)
