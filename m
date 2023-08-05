Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC2AC0015E
	for <linux-clk@archiver.kernel.org>; Sat,  5 Aug 2023 20:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjHEUTE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Aug 2023 16:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjHEUTD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Aug 2023 16:19:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DF5DD;
        Sat,  5 Aug 2023 13:19:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9271E60EEA;
        Sat,  5 Aug 2023 20:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF5A7C433C7;
        Sat,  5 Aug 2023 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691266742;
        bh=ZBBgw+dDtSh/EPFTs6L1Qnk5DP+UIkyNG1XXgU82tf0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=IxkGEkijbgv0J93AmMQ4fmLjy2EthG6X3lGel18N8j0flvLeSCAjpOZGU6qIp99DJ
         zYcku078sLb0eLAvWXtC5OrS/SxGJys3a3xBkDH1Yq6hOoNAAbtHDSRgd42V/FwQij
         uFCDFZk4UHkuZs4gk7yLuMZ36X9m1Yb7UlG696/rexyvYnCOEkqfOdhxPeCjJuhAgl
         vJymU0vaw0R6dWDP3wvXHx7v/xlLlz9LkfpeoUEZtLpVDjMeJNM8ivY2YIcDUhYWTk
         HXwgkCBb5WZcDfpgBVRLUP6ZmA9sGWR2opaH45LKjHR3NLcBn27AD3RTXOyAvSaVEV
         WP1wbEmKGi9vw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA979C3274D;
        Sat,  5 Aug 2023 20:19:01 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.5-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230805012129.2619470-1-sboyd@kernel.org>
References: <20230805012129.2619470-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230805012129.2619470-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: ae9b14582ad03abb3db66ba3f8dc5ca443ff54a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c9d26d8de10f7c4decd10b6e75f5593c11ff9dfc
Message-Id: <169126674182.17470.3089115583638541834.pr-tracker-bot@kernel.org>
Date:   Sat, 05 Aug 2023 20:19:01 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri,  4 Aug 2023 18:21:28 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c9d26d8de10f7c4decd10b6e75f5593c11ff9dfc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
