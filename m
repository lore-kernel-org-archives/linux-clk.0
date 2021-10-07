Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E17DC433F5
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 12:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8CB461260
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 12:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241200AbhJGMKC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 08:10:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241188AbhJGMJ7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Oct 2021 08:09:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7F6B6125F;
        Thu,  7 Oct 2021 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633608485;
        bh=v8jqFyirqmb+/8LYtAwzXPhvJSkgU1UvuVdFnoMXPxk=;
        h=From:To:Cc:Subject:Date:From;
        b=uH6uF9HPF4Q9hdU90Zfy9kNGND+3Gn/Oj3R6AByUpLz96GRJLpSa9p3u1+3NAYWCV
         VohFmXTJJbkOgSyMk+WT/bCTAv4oQVkD7VCThxjEMbEDdgEVCeKJemzDhm68pryusS
         KrnwsR3wkeVqInDuq7SyptFFUHuhgxsuGkvgp9Saef4e1jizwU3Q44Zj1MakcRw0gT
         W32ag8dK3Y/4+p8RNexFDKG6BLeuX6KMgK3KqmvYDw9cqkDIwb03+47ApmQv58cYpE
         lbgTaDVxqVdY+oKdi1aovb/tTUsQBev8zpZmsWMGihD0xnKvF2jnFaGBRsAEQ9FcZ8
         NHZSKCPkmS1Wg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mYSBv-005QSt-JI; Thu, 07 Oct 2021 14:08:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: fix the need of booking clk_ignore_unused=true on embedded devs
Date:   Thu,  7 Oct 2021 14:06:53 +0200
Message-Id: <cover.1633607765.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently, the only way to boot a Kernel with drivers built as modules on embedded 
devices like HiKey 970 is to pass clk_ignore_unused=true as a modprobe parameter.

There are two separate issues:

1. the clk's core calls clk_disable_unused() too early. By the time this
   function is called, only the builtin drivers were already probed/initialized.
   Drivers built as modules will only be probed afterwards.

   This cause a race condition and boot instability, as the clk core will try
   to disable clocks while the drivers built as modules are still being
   probed and initialized.

   I suspect that the same problem used to happen at the regulator's core,
   as there's a code that waits for 30 seconds before disabling unused
   regulators;

2. there are some gate clocks defined at HiKey 970 that should always be on,
   as otherwise the system will hang, or the filesystem I/O will stop.

Ps.: 
  I submitted already 3 or 4 versions of patches for HiKey 970 clock, but
  they're all unreliable, due to the race conditions at the clk core due to (1).
   
Patch 1 solves the issue with the clk core.
Patch 2 solves the HiKey 970 specific issues.

Mauro Carvalho Chehab (2):
  clk: wait for extra time before disabling unused clocks
  clk: clk-hi3670: mark some clocks as CLK_IS_CRITICAL

 drivers/clk/clk.c                  | 51 +++++++++++++++++++-----------
 drivers/clk/hisilicon/clk-hi3670.c | 24 +++++++-------
 2 files changed, 44 insertions(+), 31 deletions(-)

-- 
2.31.1


