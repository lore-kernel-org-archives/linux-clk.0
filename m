Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D614C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 11 Sep 2021 17:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 756B761213
	for <linux-clk@archiver.kernel.org>; Sat, 11 Sep 2021 17:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbhIKRb0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Sep 2021 13:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233089AbhIKRbX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 11 Sep 2021 13:31:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AFCCC61027;
        Sat, 11 Sep 2021 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631381410;
        bh=Ee6lTU5fshELmTjb8TiGh3Ay9IAlp2p3qprA67DnaHA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=k4ah7NBLDIs7Lvi7pPwFihHPbaIdB6jzoQDs6pt/In1jCxKoiWFhQyUVfnauMAQ3E
         V9FFGks4z7eqMgJkldYIQNRupiNIMiPQ/Ypvp/TJwsYj5JPowC8Uc/vDqsW9HogG0q
         4xauBTbJC0mRKkvb74psPGHcYSX7vAO4OajDWByT4SGXtEKXlFr5YxjnRTb4awEwSO
         cBJdShmNJ5TMeUkDXv+HmOvYqJVIYFBJ6Sw/BAqNG4gxkdxy5Td/lkdyVix5BqSOTA
         hPMKENRdsFQwRb4oRM3hWWnJY6OQT78w1k0B9cu75DnrjrlWhA/8N3ARmLtY02npjB
         2Azpqp56wdY8g==
Subject: Re: [GIT PULL] Another clk change for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210909213254.2423881-1-sboyd@kernel.org>
References: <20210909213254.2423881-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210909213254.2423881-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 2cfa946be843834d937e0914552d4967ffd421fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2aae0a937ad169752b5710d4f210c1ae7a49d3cf
Message-Id: <163138141069.31565.11487666763326981468.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Sep 2021 17:30:10 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu,  9 Sep 2021 14:32:54 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2aae0a937ad169752b5710d4f210c1ae7a49d3cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
