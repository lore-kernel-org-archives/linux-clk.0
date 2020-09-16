Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C381FC433E2
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 19:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 745F721973
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600282895;
	bh=A0COw23VAj/7TeyF+lOZCD1BRT1u+Crud34kvluH1WU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=o2mbX3BFMtruTQiaUd6lcFYaym1ijtrFyGARuDiVjZ9SWSCTd1IYRubR8Qa8Xi/16
	 SHH3cIwJReWX3y3eI3N2kMS3KFgi5U9KtbZCIscyNfA0/hkXEqh5VvsCboPqilbmkX
	 XDpAKBjKQgaXMZN+DOGX8m5z0uG+D8MjLO5b2/OY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgIPTBB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:01:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbgIPTA2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Sep 2020 15:00:28 -0400
Subject: Re: [GIT PULL] clk fixes for v5.9-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600282828;
        bh=A0COw23VAj/7TeyF+lOZCD1BRT1u+Crud34kvluH1WU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=I1d0oaNyD4CFcPMEMXptur7R5BzpzGighwtW0s0X+QT4Cr+v44r3B+VCi+pYkTGy/
         YxcAGATKqjk6SVYrIu3/uc66hfY9NMXhOUvT/C1nzJ+lwgXJ7X2Uw4GAkajT+dibjy
         S3binjYNf3qV0GRJb1wav/HQexikORGgylbg0sYM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200916015808.3287134-1-sboyd@kernel.org>
References: <20200916015808.3287134-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200916015808.3287134-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: d2249bf25c565b6e310453962fef63f8d38677a6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 05da40eb47cdbc9c18bc2d7256a760931914041e
Message-Id: <160028282804.10105.13430645486798839959.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Sep 2020 19:00:28 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Tue, 15 Sep 2020 18:58:08 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/05da40eb47cdbc9c18bc2d7256a760931914041e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
