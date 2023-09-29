Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE54E728CB
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 16:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjI2Q3X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 12:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbjI2Q3W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 12:29:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21789BE;
        Fri, 29 Sep 2023 09:29:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6419C433CB;
        Fri, 29 Sep 2023 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696004960;
        bh=3OuIUwplRf6LoSMGMWotoN/vi0cekYq75kaAj9KLkqA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Mnb5xyRVvdO7PjqTywGoTioMxj292hD6vYhvRvXD6qDXlfP2Gi1I6DeuHZEcXXIdt
         sbhrZ9pD/5IgkLU9LVFIRpttqhsYFxQjzZI34QAlMGApiEBw38YM3g1R14iY1haKnd
         cqUnpD3Q+RZfiT36JsszMVi/LKErxowYXNf3r0bGwAX5BlhSsk7vxXvOaiA9K6WZhg
         EaRJabGBcyqfxinWUYGkx/1zLmUB5OpSEVVB8eK2ZjQu0rb3CP4ywc8z455V2t0gQD
         wcU2KJ1EwGDTbQhOW6+cBg2RjV9v35QWJIBG7bB4poLogbsmlpKFVAMUe66bqkSJWH
         HOw0XqbQ0u4cw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 988DEC395C8;
        Fri, 29 Sep 2023 16:29:20 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.6-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230929000635.1480419-1-sboyd@kernel.org>
References: <20230929000635.1480419-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230929000635.1480419-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: a47b44fbb13f5e7a981b4515dcddc93a321ae89c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: acfdcaeed6e6b954f5b99210b8f05cbc18200945
Message-Id: <169600496062.31534.13737969081217378263.pr-tracker-bot@kernel.org>
Date:   Fri, 29 Sep 2023 16:29:20 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu, 28 Sep 2023 17:06:34 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/acfdcaeed6e6b954f5b99210b8f05cbc18200945

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
