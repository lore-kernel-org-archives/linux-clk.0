Return-Path: <SRS0=+6Yl=TJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98E7C04AB1
	for <linux-clk@archiver.kernel.org>; Thu,  9 May 2019 22:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79E9B216C4
	for <linux-clk@archiver.kernel.org>; Thu,  9 May 2019 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557440137;
	bh=ZhKJNDh4FnQO7UQnPY8DmUDINQaGP6NyfJZilGgJ/b0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=RAs0TDT8XfKSmVlZCAWpneLblsaY3ZWghCd+Wd2s0tN2Qc2I2BYWKderkgZD05KYy
	 ie8Aj+WtaCsslEDH40TKZY3PkeR6ueLxJ5qaRizeM59QKkkhtcfiFG4QpU9KiUjTwl
	 Lsxn205YuRX/b0gpXiMHOG6m/SLxfxVxDDyBVolc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfEIWPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 May 2019 18:15:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727287AbfEIWPS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 May 2019 18:15:18 -0400
Subject: Re: [GIT PULL] clk changes for the merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557440117;
        bh=ZhKJNDh4FnQO7UQnPY8DmUDINQaGP6NyfJZilGgJ/b0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=hf/gy18KnkjCQ4cH/sjRa0WC5mvSYamiWnkf+UsmJf+4dx4p1JtOr1OdnrQoHMAWm
         fp513XFtFR0dqeT+y9lwtec/T6HZegUKE27XwLUSQvArUVw6HwZdRzuhxJiVNuWslK
         DUC91YTpqzj4U6kZrGtjCAh6yCAUM1x6xyYlalP0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190509211510.36920-1-sboyd@kernel.org>
References: <20190509211510.36920-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190509211510.36920-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-for-linus
X-PR-Tracked-Commit-Id: c1157f60d72e8b20efc670cef28883832f42406c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea5aee6d97fd2d4499b1eebc233861c1def70f06
Message-Id: <155744011772.23477.12754028248628964733.pr-tracker-bot@kernel.org>
Date:   Thu, 09 May 2019 22:15:17 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu,  9 May 2019 14:15:10 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea5aee6d97fd2d4499b1eebc233861c1def70f06

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
