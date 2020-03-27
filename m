Return-Path: <SRS0=mPu9=5M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B33AC43331
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 16:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6217D20CC7
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585328110;
	bh=AMrVgG9U6HJ3JiXnU00NM3wXnd6a6Ef+PpO3+v2Y8WY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=CS1jieLKvXXSbhxNhDDxRO24qcJ8wQZLo4mA/0iQJ4ar8bOrapcE52WYUNMm5guxe
	 +WkbiuARnrW3/aCgGVZZ6EOarYjT+Xv/mua06ygihkf7aikliOlC70/7KJ5BN88Oc1
	 gsH3xmeiX4xVC8GptSXUM8HAO5mqQg2KKxxq2+XA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgC0QzK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Mar 2020 12:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgC0QzI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Mar 2020 12:55:08 -0400
Subject: Re: [GIT PULL] clk fixes for v5.6-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585328107;
        bh=AMrVgG9U6HJ3JiXnU00NM3wXnd6a6Ef+PpO3+v2Y8WY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=0TvqqPLekWTjnxnHCebctYxvUf6eU9O8Ev1ZbKNL8oVIlcS58ii1C7/HsuZS4vXo6
         0Zji+uLslYDKYAoTWDV/bYsBayKzVLoHfXOYlJiqXrXeJhcFBDsYhABzd9uu0GbNla
         Ws7WarLBGtYsTByeGp1FerKN1lP8r26EotPwphVk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200327090847.152877-1-sboyd@kernel.org>
References: <20200327090847.152877-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200327090847.152877-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 8400ab8896324641243b57fc49b448023c07409a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 527630fbf4f194c5d71e75b2d3cb3d2f406bc5d0
Message-Id: <158532810748.31172.16010819432845067260.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Mar 2020 16:55:07 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri, 27 Mar 2020 02:08:47 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/527630fbf4f194c5d71e75b2d3cb3d2f406bc5d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
