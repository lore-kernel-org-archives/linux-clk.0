Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DFCEB64D9
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 18:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346489AbjFQSoa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 14:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbjFQSo2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 14:44:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF9019BE;
        Sat, 17 Jun 2023 11:44:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0A266121F;
        Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58967C433C8;
        Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687027466;
        bh=gKNNgOrH048JqXNH/xpJI8ATxVL+T57Yp8A8ijEj/uo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dTziPHKARoJjPEfjxpCSUvNjVhCQzrcTPZKnmcPgcv4z+b0KhhzPFRdhLLwL5Uaed
         zdYLc9//HofJE+Cay+RCJ9XOm7X+AZhH9XgZg5p/oDWyPR0UzZEmDse27ycuQ11tHz
         va5S5J874E8496g2wDS1B4SuPX05yhcSIVRVp62J6UVNSBeU5wy2HSEzZb7vlp2LEe
         49uzoBBta90UrtSaBcs4VUhdL+EqRkbvB8SUy3uWh2uJ7ncf+LoSAJD5b/DVHMqGQU
         +ZdJCLzFI0rdo08a1qZnLig9HwrJvG04/1R50Q0AosTuwpQhxZuFPIC+OqFAps6BlU
         rFzzrvzqkPqrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4571AC4166F;
        Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.4-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230617043624.831750-1-sboyd@kernel.org>
References: <20230617043624.831750-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230617043624.831750-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 23200a4c8ac284f8b4263d7cecaefecaa3ad6732
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6cf6be9dfb8098f2c2d26ebe53ad80843cdd2bc
Message-Id: <168702746627.26928.16810171477264617013.pr-tracker-bot@kernel.org>
Date:   Sat, 17 Jun 2023 18:44:26 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri, 16 Jun 2023 21:36:23 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6cf6be9dfb8098f2c2d26ebe53ad80843cdd2bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
