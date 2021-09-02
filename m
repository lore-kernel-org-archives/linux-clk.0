Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB74C433FE
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 22:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B642D600EF
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 22:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347861AbhIBWnk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Sep 2021 18:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347847AbhIBWnj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 Sep 2021 18:43:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 56DB5600EF;
        Thu,  2 Sep 2021 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630622560;
        bh=6CbBptxF2W1kXcGhleonxjn/koKFdYLz2hWmp4lJJSQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PqzlT5jtxXto6UjaB7qqr625xqVMus2OhqVR7XfSwRHiRMepYNtnwbQfQBnn4Mmof
         yu+dmaFWJWtmgo15ZEXsHufs1XFX5ye+QbMbKHRHroc9WZm60U5DBoyqdJSIvb3XQh
         BzrePjKSqXrBvy34DJc/h7mmXG0MhjjhnKqH7rBSQ/Vj2wJLeNAwPDIJkiXloJyg34
         4X86fFWN+DdaAOUgV2lHfXbV3SDDdeGyL0d8+Ox5/2BwmkxxZeGM4nsr258iqnG9hE
         7L5sLlEt59e6MetzR5i/YE1/d2KNw55qt1iWKgYYSx4sD11RnsF5eJfJmHuab/YccN
         RihzmUAWrXFZQ==
Subject: Re: [GIT PULL] clk changes for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210902190702.516457-1-sboyd@kernel.org>
References: <20210902190702.516457-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210902190702.516457-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 47505bf3a82166c3576155c229e941af922bf147
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75d6e7d9ced83e937757e278c3ce1ccd6606a96a
Message-Id: <163062256032.25965.9982101453040100032.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Sep 2021 22:42:40 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu,  2 Sep 2021 12:07:02 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75d6e7d9ced83e937757e278c3ce1ccd6606a96a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
