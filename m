Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A24C83F15
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 03:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345972AbjHaDUM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 23:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345954AbjHaDUL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 23:20:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885FFCC2;
        Wed, 30 Aug 2023 20:20:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68DFC61072;
        Thu, 31 Aug 2023 03:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C69F5C433C7;
        Thu, 31 Aug 2023 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693452008;
        bh=MzSWy8/hP2nKUBdkfXnbeNxFuO8VrBtUGwcQq9MHcnk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dPTHAgHC2MXt+g9sTxKZfslDfWWxWKv/sKsCS33fqSarWr6URms8QIUdPBn37UvT/
         MblwxjGZ5ZXHh61/oBaNcyQcL2LsnmMt4Atxcv/TW5lzr6Ov7B5NiDkAHeYXXATi8o
         toPPc3oZmkGVUyvjxKnHnfFC69dBlU0ORj6ppqSWNeNhc/M2RHofKhDQ0hhNJIfDNN
         s73bahJvJvUNeE0lQOJdo6voUFb4SEAou764W4iuJ7h4PGaZtmionRmYfKm52KnXil
         la+9LbxaYgjmsow7SP79K5t4cMb5MQ6h5dcQH/H2x+v9XxPN5hWFKluJpWdgYPgjbu
         7IqQHCs1EJKmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3565C3274C;
        Thu, 31 Aug 2023 03:20:08 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230831011434.3247387-1-sboyd@kernel.org>
References: <20230831011434.3247387-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230831011434.3247387-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 41680df0975e04b959a28bf6ab85fd6a307ae0ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8fd5c24830fbc259ba7d5e72817c9867c01b8e8
Message-Id: <169345200872.31241.13368498732511165360.pr-tracker-bot@kernel.org>
Date:   Thu, 31 Aug 2023 03:20:08 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Wed, 30 Aug 2023 18:14:32 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8fd5c24830fbc259ba7d5e72817c9867c01b8e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
