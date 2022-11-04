Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A7BC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiKDVRv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiKDVRq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:17:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBDBBA7;
        Fri,  4 Nov 2022 14:17:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 06BDF6163D;
        Fri,  4 Nov 2022 21:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55E9DC433C1;
        Fri,  4 Nov 2022 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667596663;
        bh=lgmkCSfPSZFEQia44AJqtq2wN7k2OfiILGhmxuqCZVg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=eH6fdBVRgqlrDdKWIPy533a3CdRrYAHBebMzpmw0lFFeKPu0BKCLtNybYnytueEnj
         wXO9PdK2Lf/7TT9BicJPF5CVY7wVJvJ7a/QxRWUeNPFyU0ggRofcwdYrLBK4uq2a9B
         TAOEJADomd1Ce5VQl6PTDE5eD+SahAQ8/r2KkEaKzsswUpRdkUILpsVbwV7YObjcu6
         raiSkYdy8RYKCQmdgbiQON1HEgu365jw3+93l50/FNt43mTMELCvTWHJY7B8+GmxYp
         r6FOKPgpY7s79dk+PtpXd+fCCpXWasRocuMRvasShJNGQeQkPd1tksc6J7n55KCore
         1RCTgXI/B7jHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44E17E270DF;
        Fri,  4 Nov 2022 21:17:43 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.1-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221104020852.3958600-1-sboyd@kernel.org>
References: <20221104020852.3958600-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221104020852.3958600-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: ffa20aa581cf5377fc397b0d0ff9d67ea823629b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db385e0be4d7a737ddb793d2275a24735f4e9bd7
Message-Id: <166759666327.9521.8975616000572115619.pr-tracker-bot@kernel.org>
Date:   Fri, 04 Nov 2022 21:17:43 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu,  3 Nov 2022 19:08:52 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db385e0be4d7a737ddb793d2275a24735f4e9bd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
