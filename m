Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F869C433E9
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 404E623C18
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgLUSra (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:47:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:51362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727071AbgLUSra (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Dec 2020 13:47:30 -0500
Subject: Re: [GIT PULL] clk changes for the merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608576409;
        bh=l+VP2sxQgfzOUk2jujgS/lJ3zv8PqDrwxIZeudAbYAg=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=vFUodvCEDwhsA0Bw8ZF9eOaCVlgEn7MO+eN+AzJ0g8hXOZmI6jQNvX5SfmF7dgPp2
         exjJdAF5gEmAYG0PX6b6IpCviI43xDsh1skm1KGAuhn7ieP6RZYUP5/8RxMvzWw/vd
         CnDTOsAsP1okuwh/4bxyfeOZzh9raOYMeGWClGyCnwHODk8I+4Z9Vdc66lWeeGRTWP
         oEMRsp7IOuDi9JYs0DYgIamF/5Ao3DkNZhEYXVW6yPeDzyQPU93tDrgoIMiqrWbW6E
         fSGRttFVQu+WW2nBcf9qr1QwYfdV5ybe4Opppze2IC2khfoLvBqTurRRD//N53EzAh
         niX5S1628hmgA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201221015214.3466681-1-sboyd@kernel.org>
References: <20201221015214.3466681-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201221015214.3466681-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: abe7e32f1d50392fbfb6391f4fe1a9f1348b24f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8653b778e454a7708847aeafe689bce07aeeb94e
Message-Id: <160857640927.14812.13500459603828465188.pr-tracker-bot@kernel.org>
Date:   Mon, 21 Dec 2020 18:46:49 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Sun, 20 Dec 2020 17:52:14 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8653b778e454a7708847aeafe689bce07aeeb94e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
