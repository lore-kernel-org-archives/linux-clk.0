Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CB6C4321E
	for <linux-clk@archiver.kernel.org>; Sat,  8 Oct 2022 17:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiJHRgW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Oct 2022 13:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiJHRgF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Oct 2022 13:36:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7956641994;
        Sat,  8 Oct 2022 10:35:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1448560A3D;
        Sat,  8 Oct 2022 17:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C436C43140;
        Sat,  8 Oct 2022 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665250557;
        bh=+HYIOfKT949yRsziiAzrqMf0Hmty6D5TRjoV/164bQ8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=UbP8UndH9V07iX2gZ9FL8X2NiMMh4k31zXSb/u0fpmjmd1nYv32MCjEzV83FvW09R
         IPu23qG/X+ms8EPbMQfO17aKAnSeeE/txQiuCAMav0uoKvl3joOcJCExRXHZb/dMwa
         27tu9PTTTt0xl+nmSG81uO0lv+gwoXNIkKYnGOsfYo9PmiPIbuemoUP88kmHLuxDy6
         ktA8r1GO2osFeMUHvnp4nUXCZ2BjpwgrT/umfnPkWUKkuGwhM12+M7xNIo8UqYC0KP
         a1sakUiEn1gDok2AbIr9AU5TzUq3QrjQvZxNHYyJh6eKNnXX5nQXBdlT/jBEMbeUvm
         lIZD1T2WIYzFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59742E2A05D;
        Sat,  8 Oct 2022 17:35:57 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221007205838.744794-1-sboyd@kernel.org>
References: <20221007205838.744794-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221007205838.744794-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: f9efefdba95a5110a1346bb03acdd8ff3cdf557f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdc753c7fcb4eb009ae246a188ea7ac6dac98ce1
Message-Id: <166525055736.22843.659561760244146360.pr-tracker-bot@kernel.org>
Date:   Sat, 08 Oct 2022 17:35:57 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Fri,  7 Oct 2022 13:58:38 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdc753c7fcb4eb009ae246a188ea7ac6dac98ce1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
