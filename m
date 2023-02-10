Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA7FC05027
	for <linux-clk@archiver.kernel.org>; Fri, 10 Feb 2023 23:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBJXji (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Feb 2023 18:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjBJXje (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Feb 2023 18:39:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69603234FA;
        Fri, 10 Feb 2023 15:39:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EFB1AB8262C;
        Fri, 10 Feb 2023 23:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B80AC4339B;
        Fri, 10 Feb 2023 23:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676072336;
        bh=izwQ7Ab+1e2pOEvoe58HTAGkY5reVtppKDNaT1UIWt0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=fbRAiHDxH2VmBAg0NGWgmO2froaqCppJnlUhfrPh3FDqOAbb4EjJwdnm7jhn7eqhe
         rXUtndTa9kNHAO0c1tjNgEmyGDMWb7HOQdfi7PkNwJA2PduQqR1dPN1LI0MXrwcD6N
         ZTltpmWE+D8SNvoxJEPVWtxBJ2NNdZW6vylqWQ8sC9D0pts3TmpcViCMW8ouHr6Yub
         /fmmrX7u7Ndu7yjvsdoLE+B5+O51EI0p6bemloIUmo7sNnrFkKXQ9WTjN55SJ4Gp17
         b5jU1Qu9WY4MPIyfvPmMznlvecqNVW/D1ODGAWu3RZ4P6qW0b65W9J1bCRgmG4jm6R
         KTwpUalUVqvTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8783AE55F00;
        Fri, 10 Feb 2023 23:38:56 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.2-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230210225922.1958397-1-sboyd@kernel.org>
References: <20230210225922.1958397-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230210225922.1958397-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: ecfb9f404771dde909ce7743df954370933c3be2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 420b2d431d18a2572c8e86579e78105cb5ed45b0
Message-Id: <167607233655.6240.13178927282087996860.pr-tracker-bot@kernel.org>
Date:   Fri, 10 Feb 2023 23:38:56 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri, 10 Feb 2023 14:59:22 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/420b2d431d18a2572c8e86579e78105cb5ed45b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
