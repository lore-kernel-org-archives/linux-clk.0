Return-Path: <SRS0=/4Wq=OR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE92C04EB8
	for <linux-clk@archiver.kernel.org>; Sat,  8 Dec 2018 19:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F6ED2081F
	for <linux-clk@archiver.kernel.org>; Sat,  8 Dec 2018 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544298603;
	bh=XytNLpwKLhY5lB7JcrV7e18SjlzXaxG1fveYNBReJ2w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=lmwdXyPmU6h7UMvk/P5VaCdFuLyfi/Q0XiCtmPAQ5oKpzzEam4D5JklE+Q3c9nWI6
	 ayzFULhPGfZEnMPBYnqyP0wmreHz5NBvUkE38gFlq5LH+aLGPaGNcIMDtpwOkzY3qd
	 ndm6UDcayOa5kQLRpmI4P4VBxstPuorhyse3H0YU=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6ED2081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbeLHTuC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Dec 2018 14:50:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbeLHTuC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 8 Dec 2018 14:50:02 -0500
Subject: Re: [GIT PULL] clk fixes for v4.20-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544298601;
        bh=XytNLpwKLhY5lB7JcrV7e18SjlzXaxG1fveYNBReJ2w=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=QrPS0YbX6YRql2cbG4p301pHwZICTsmS4K3N7CxXjS7iuoPED6WBsE3j7APrmLBni
         tuWOew0C/pp5TaTaV2g55hl2Ztu8YXYg2MeWFiVz+9nNMidejIqg8+auIzJ+I587U+
         Z4JVx9KDPiO8AZfgbm/lUkAAoDK3m4bcI0ieuQi4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20181208000314.180968-1-sboyd@kernel.org>
References: <20181208000314.180968-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20181208000314.180968-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 9a43be9cedd516f188e6333d3b43402386723eff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 570c9139c358d45ab4d52fb0c4e478e2bd7123a2
Message-Id: <20181208195001.26881.95048.pr-tracker-bot@pdx-korg-gitolite-1.ci.codeaurora.org>
Date:   Sat, 08 Dec 2018 19:50:01 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri,  7 Dec 2018 16:03:14 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/570c9139c358d45ab4d52fb0c4e478e2bd7123a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
