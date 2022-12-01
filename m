Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87DEC47088
	for <linux-clk@archiver.kernel.org>; Thu,  1 Dec 2022 19:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiLAThX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiLAThW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Dec 2022 14:37:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF332EE;
        Thu,  1 Dec 2022 11:37:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E068D620FF;
        Thu,  1 Dec 2022 19:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E378C433D6;
        Thu,  1 Dec 2022 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669923441;
        bh=XoIH9GVzxAuWhvn6FjlBDdYpTYhw5huEBtcbbmAujig=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Uxhw6x1FMXZFYAKjJTYG6/vfRIyE3cy9ooTjU7JS9NDvtmOsGx6ZKv79k0SSmAWZQ
         NQEAvLhlo4My1R5se/lo/8xKcjOzANJXkQRVGfFq6GSOYr3AjRdWcNSGFMv02A5Woe
         ovgb51pjEJxLCbCMj6TLrfvrvawBoBkruHz+QbVIpIEghYvZLa1imRz/Rmu23yaHkJ
         HZFyv9nq7a4cwXlMoCPVi19aTJuVEic0LSxx1bhdQ1jPITkiXn3rmsPoKNySMJzzLW
         FCDA7mndG7fGz4Jo6nPNqhzCRyjljgvMy5Kxx3CqUfQqrGAYS661I1iyLN8nG5oGoo
         7En5WBtu0UHWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BABFE270C8;
        Thu,  1 Dec 2022 19:37:21 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.1-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221130225720.1615026-1-sboyd@kernel.org>
References: <20221130225720.1615026-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221130225720.1615026-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: f6abcc21d94393801937aed808b8f055ffec8579
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 063c0e773ab33103407a76051821777014b756fe
Message-Id: <166992344123.6584.7162534931533061224.pr-tracker-bot@kernel.org>
Date:   Thu, 01 Dec 2022 19:37:21 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Wed, 30 Nov 2022 14:57:20 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/063c0e773ab33103407a76051821777014b756fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
