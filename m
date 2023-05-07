Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05559C7EE24
	for <linux-clk@archiver.kernel.org>; Sun,  7 May 2023 18:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjEGSMV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 May 2023 14:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbjEGSMT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 May 2023 14:12:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2BE4EDB;
        Sun,  7 May 2023 11:12:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 824A5616C9;
        Sun,  7 May 2023 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E482CC4339B;
        Sun,  7 May 2023 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683483133;
        bh=tI+b856dXIQEYxVncjfesUNAFqQkV68/vG1VyASOGFw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=r8D6uscFrIi43XGlZjxYS4/cdDfjmJSh1gTK7qrfOKw1KjWsHAhYIJLsmFbltvLwJ
         QesQd3nTuLl9O5SGejVLyfI/optMQTcrJOBiRz+xDDRg5iicVP4LPdobLbDJxfFaXc
         8OE0rbBoTE+vzrETJvBNXitEtrHl5jzqzprce75MjRxHJjsPBMGGSTD38f6CgEsVs0
         lnG3eKDy9amk22YPRMq/d0qPvfiFjUkh7sFjeF4RkJGLUyW8fyqh7wtSd3yrpGFl0s
         YAsdSrTUkYO2Io78NoEVA2ryKvbbR0Pa+UYGY7Bu5w+Gput89Ckg9Fb24O9oe/B1gO
         GZR3pAycuMTVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3036E5FFCC;
        Sun,  7 May 2023 18:12:12 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230507002734.1674632-1-sboyd@kernel.org>
References: <20230507002734.1674632-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230507002734.1674632-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 31c6ed4e89187beef8fe2f979c8881ca94839427
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d6b8a8c49ad6afce23c2c65a3cda0a0ccd3eaf61
Message-Id: <168348313285.16669.2190463091670324864.pr-tracker-bot@kernel.org>
Date:   Sun, 07 May 2023 18:12:12 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Sat,  6 May 2023 17:27:34 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d6b8a8c49ad6afce23c2c65a3cda0a0ccd3eaf61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
