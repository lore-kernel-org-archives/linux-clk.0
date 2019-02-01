Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8413BC282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 07:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 549B620857
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549005911;
	bh=sloB0MbAtN2UuWrj4CHZ+8Rd3mvuxuQ7LN3hAeH/Ru4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=ni/wUdzgu3ffAZzyieduabkFjmaZkNPdgpC84jvtFglK1LPibu6yZduhoeiGqFn8v
	 Vbb2YoIX5YMRQxMVTqLlOQPRwvWC7NViHAznhsQgMROtbmVu3Kc1ZNeko8JdMrlak1
	 D3VedxHp5N3xDbcLvjD0NJYeF185SIyK+IvG4EXk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfBAHZF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 02:25:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:53426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727204AbfBAHZE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Feb 2019 02:25:04 -0500
Subject: Re: [GIT PULL] clk fixes for v5.0-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549005904;
        bh=sloB0MbAtN2UuWrj4CHZ+8Rd3mvuxuQ7LN3hAeH/Ru4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Acz65Yi6itYZj/uknhDRi2kcMAnLkEIe+iJcGaC5FmHOazJoUvHIaiZJMbsBrxrH3
         3zKKllmEPbd9SZmlaPf9sbdyNSrsDFM2ch+cSH3iitadR4mpyn03h7h2zuI6ytCiEh
         +IaB2blCuZ7GM0F3KHZo3SsNnxclGQseE/gQxxNQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190201071037.215136-1-sboyd@kernel.org>
References: <20190201071037.215136-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190201071037.215136-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 9ff1a3b4912528f853048ccd9757ba6a2cc75557
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b4746a031992d3b788b7e5280d949b8ab6d32d0
Message-Id: <154900590421.3378.4631791592988989259.pr-tracker-bot@kernel.org>
Date:   Fri, 01 Feb 2019 07:25:04 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu, 31 Jan 2019 23:10:37 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b4746a031992d3b788b7e5280d949b8ab6d32d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
