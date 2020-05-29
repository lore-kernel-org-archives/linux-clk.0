Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FF8C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 21:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CD9F2054F
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590786636;
	bh=5HkBsu2LoFJiNfJpQfYL/s0NCwlWMQqDFsNjLOxkeoA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=PAdrLUx4vpvc7rX9tkJb6Mnv23VlDpehzBAs25wxWAIYSPcsmtCZi3l1FpXkZCYb2
	 mRjnNOSg9yejeHLeZPXrnHuZxQS1tU31bFjUL7Nu4N0OVtgucPPyW/fCfngX7LwWge
	 fBblZbtehgGuTvagVLKMyPe+p57xjt+DD/Kf/nuY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgE2VKf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 17:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgE2VKE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 May 2020 17:10:04 -0400
Subject: Re: [GIT PULL] clk fixes for v5.7-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590786603;
        bh=5HkBsu2LoFJiNfJpQfYL/s0NCwlWMQqDFsNjLOxkeoA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Tr5TskIqoYzv2oLN88T1EHwQEBfxBI91WQXnLnRUtbgUUsY9rKE+ATT6tZp+TjXBk
         b9vKCValEnFah0a+cm6RjcDymoMVvEMM4ZYmfSBE+A3IlnnYpvYy9ccvXL+wddKQ8P
         P9OBeZlc/UU9feyR3ZZdbHRcuemZYhsdt44Ah3xA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200529035729.202144-1-sboyd@kernel.org>
References: <20200529035729.202144-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200529035729.202144-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: a76f274182f054481182c81cd62bb8794a5450a6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 170ee4d74781ed3d7b0f489c0b1c4debc33a2c1d
Message-Id: <159078660363.32003.14223026968449351948.pr-tracker-bot@kernel.org>
Date:   Fri, 29 May 2020 21:10:03 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu, 28 May 2020 20:57:29 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/170ee4d74781ed3d7b0f489c0b1c4debc33a2c1d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
