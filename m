Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66ECC433ED
	for <linux-clk@archiver.kernel.org>; Sat, 10 Apr 2021 03:04:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A37E611AF
	for <linux-clk@archiver.kernel.org>; Sat, 10 Apr 2021 03:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhDJDEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 23:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229665AbhDJDEo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Apr 2021 23:04:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FADA611AD;
        Sat, 10 Apr 2021 03:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618023870;
        bh=/CIx3SsdaspWE0/J4BLEb951EWiu9lhSrD2ntkA9Odg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PQFZ/D5b3neQcWei0/t7m6vdiygAZhcvjJDPAKV59NhC5UP0alViLiiyHd0c8cuxQ
         3YBUAAwjzPaMAOQ+ll1pAT6t/3OmPBRj9swTXPGnp7t23pe0VX5ORDRIAb0glhVtlu
         GmlgLqMfH7CP1MO+T6alZLOGw1lS9yQHQbPv/lVzS1QE3lCMqZZ8Yz73q1RQtxRTUh
         U+BwasAq16DhXptknh0i9ucmxm2DkivC3Y4sFdZqLZA1Rfyu/LKMg+UMo9ejBU8oxg
         SOEXMT6+e6D81e6+2dLRWfgVYhy36or5DgDmKPAb3pwYHXlx9fyPQXTD32IWsbsQz0
         cjnFX52fqR18g==
Subject: Re: [GIT PULL] clk fixes for v5.12-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210410014603.3762887-1-sboyd@kernel.org>
References: <20210410014603.3762887-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210410014603.3762887-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 50ce6826a48f119baf2794fa384a64efe9bd84a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d4961772226de3b48a395a26c076d450d7044c76
Message-Id: <161802387024.23874.14335559627520874091.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Apr 2021 03:04:30 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri,  9 Apr 2021 18:46:03 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d4961772226de3b48a395a26c076d450d7044c76

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
