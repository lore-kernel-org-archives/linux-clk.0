Return-Path: <SRS0=xwbt=DH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C48C4363D
	for <linux-clk@archiver.kernel.org>; Wed, 30 Sep 2020 21:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7EC720759
	for <linux-clk@archiver.kernel.org>; Wed, 30 Sep 2020 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601501116;
	bh=IPmfasutbeRBO7EQPty94YQ8ASvFaxE2VNLEXAUvknQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=tBVgsAmVJR3e6aATyGzk3dWl0fvQiIVLv7So4TWJrE7VToZCmpdBXslo4wrsYTozT
	 dxkn1NSonlxtK1jvPAiIX9kPgRyVq08Uh5NIRlh+WyNqvnLPidwN5UZ/1+o4+3KxE9
	 ipFmNVFwve1ja6HiN0EN7nWdRyAMqArd6DwBebhg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgI3VZQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:43778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgI3VZP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Sep 2020 17:25:15 -0400
Subject: Re: [GIT PULL] clk fixes for v5.9-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601501115;
        bh=IPmfasutbeRBO7EQPty94YQ8ASvFaxE2VNLEXAUvknQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=e3/2fufX0JXB22vBKRYiEnNuftbBZM8UKNQ+iqHnIKjmZd77lTyzeEqQqtLv5vSRz
         RDOd6Z0hZRFio9v19wDLM8ZOJGGGaAk7ml01HBxr/qGEwum7PNX6Us64dUv8hwL+3b
         lxoZVgQsfTfkfQMbxxkQq29E29fUQQKadJUHatu8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200930185742.4044166-1-sboyd@kernel.org>
References: <20200930185742.4044166-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200930185742.4044166-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: b02cf0c4736c65c6667f396efaae6b5521e82abf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60e720931556fc1034d0981460164dcf02697679
Message-Id: <160150111550.18084.9295712272651735321.pr-tracker-bot@kernel.org>
Date:   Wed, 30 Sep 2020 21:25:15 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Wed, 30 Sep 2020 11:57:42 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60e720931556fc1034d0981460164dcf02697679

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
