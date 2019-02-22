Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C580C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 18:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C96E3206B6
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550860803;
	bh=FxRx5bxmpmZGHF46ejO+YrSr550kTSxSVWRE1Uq9GrI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=vR73nN5vvIg+sxkvgza90rVjTECDYji4XQI11LIO465lo38UJognQkBvkBirlD34q
	 BKbwyYIUqdRASqymCL9tNXyALAunLG01mhOMuqZRIX/OTCAfKKdwDcm8zR32D+mUUT
	 LXkre7X7bB7gC7GpY0j3PHZDOBj1qQk1C5e0w6v8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfBVSkD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 13:40:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:59464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfBVSkD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 13:40:03 -0500
Subject: Re: [GIT PULL] clk fixes for v5.0-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550860802;
        bh=FxRx5bxmpmZGHF46ejO+YrSr550kTSxSVWRE1Uq9GrI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=SWia94/g271nAlSAvKJJxqXUOYmroYgTYtMEG82drkBaCTlbvUCDHjeIxFDkjpKrL
         nJLm8eLPonxC1g7U34GT9fONuttJFABMN1D1dvk7ttGedNzk9Xqh817ssxcWJf592o
         UL+W3WcCg54bgzum4a+w7uGJpvH3b0sn1ncX4V10=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190221215721.3407-1-sboyd@kernel.org>
References: <20190221215721.3407-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190221215721.3407-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 65a91e2e597dea62a798a8b771edc44859037e7f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3504f7a38233030def726fcfe692e786ab162df
Message-Id: <155086080285.14712.7165635314260878151.pr-tracker-bot@kernel.org>
Date:   Fri, 22 Feb 2019 18:40:02 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu, 21 Feb 2019 13:57:21 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3504f7a38233030def726fcfe692e786ab162df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
