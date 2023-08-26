Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7514DC83F12
	for <linux-clk@archiver.kernel.org>; Sat, 26 Aug 2023 00:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjHZAyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Aug 2023 20:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjHZAyW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 20:54:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7C926BD;
        Fri, 25 Aug 2023 17:54:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBE0A6326F;
        Sat, 26 Aug 2023 00:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40826C433C8;
        Sat, 26 Aug 2023 00:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693011258;
        bh=LbFVjqaDhE2z6PQnuGu8E2JivBZEMOKUtF1cp/zgbto=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=kJkV6sl4neBXr3uuH14XXFqYxwEc2Ga9b1rgDe2upe0P9126XJ1oqsWxSD8Ygetth
         69drnIBoww/npreEALC7SU63zKPJO2Wm4iF4EQMul1O9vsbnKtQgUebMAGlEbZ3oAn
         yrAcwMQLGSb14Y+T+MsmrpjNvQCkOC4BPk9mqBCZxDTOxs+QYItPYzsMh/DQ8iQpqp
         7WwnR4qGc30crIOXru3QTegm2J0gZALMQRo0SdRInMmr52blXJn4gvT+1FDqGSnZMw
         4zaNvkpqnmjMd3RUEWPCGzSYeaBTisM1bZywvGcH3ktmCHkVgPRhjyVLh5KgtVfGuq
         Ausgkdy5JT/8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D137C595D7;
        Sat, 26 Aug 2023 00:54:18 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.5-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230825210848.1209346-1-sboyd@kernel.org>
References: <20230825210848.1209346-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230825210848.1209346-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 66fbfb35da47f391bdadf9fa7ceb88af4faa9022
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
Message-Id: <169301125817.9484.2892784914861434365.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Aug 2023 00:54:18 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri, 25 Aug 2023 14:08:46 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
