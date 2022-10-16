Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E739C4332F
	for <linux-clk@archiver.kernel.org>; Sun, 16 Oct 2022 18:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiJPSSy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Oct 2022 14:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiJPSSx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Oct 2022 14:18:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE8E45F66;
        Sun, 16 Oct 2022 11:18:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1968460DE6;
        Sun, 16 Oct 2022 18:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F766C433D7;
        Sun, 16 Oct 2022 18:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665944330;
        bh=OllyS4eejixmT2pTZJkWi1jWtEaEHmk50op90/WjMDI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=GvePjA6HIBrnbInHxfl0zXnX5RL0Gh8oNMOh1F23G09XYuxVusmcdT4RWntFoqYII
         BkVWzBDuqFv8CmTEW+Jbek8cVGVqsmmzZ26SqZxw2YXcRaAyPkg7WFfxZ4XY+VD7DV
         zaeKWORaTRZ4mIRySDjL1Xzp6wKCnFn1VJmw6OsCKymuGxp3Zj88LC4Ap2IsRt1IwC
         1UbTS3AfsAZfRa0npfUL9TFbuhHVw66UcpwCXFuzPAv6IerJzqvd3DVk+SBkumheSA
         85491L7dhCOSN+io6zCFhFeQGv79tFMojqSnBQMTV3K4L8RD//FaIqeX8SxhHnqWjx
         YXVmpvBtxs+rQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C9F2C73FFC;
        Sun, 16 Oct 2022 18:18:50 +0000 (UTC)
Subject: Re: [GIT PULL] More clk changes for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221016035430.560083-1-sboyd@kernel.org>
References: <20221016035430.560083-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221016035430.560083-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: a7b78befbce2e79425224d57c05275083cf7ed61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2fcd8f108f25ef0cbbfcb57acf1c42934c238ed5
Message-Id: <166594433037.2997.9500107353532151717.pr-tracker-bot@kernel.org>
Date:   Sun, 16 Oct 2022 18:18:50 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Sat, 15 Oct 2022 20:54:30 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2fcd8f108f25ef0cbbfcb57acf1c42934c238ed5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
