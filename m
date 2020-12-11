Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214CDC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 11 Dec 2020 20:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA9932311A
	for <linux-clk@archiver.kernel.org>; Fri, 11 Dec 2020 20:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405562AbgLKSg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Dec 2020 13:36:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:36102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405913AbgLKSfz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Dec 2020 13:35:55 -0500
Subject: Re: [GIT PULL] clk fixes for v5.10-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607711715;
        bh=/OZm+QEPlwOOOmEsuW7hHCVMH19PJDZZRNHByaV75lM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ei3USVG4VUEYWAY+AQDyOhklGfJ4DgrlvrWmaTj/A6AaVFyPPEZXrcHbREqfSNnBD
         l/Vr/NsCeKJCJeowaGPGsxl2tg9uRbgA1qQLoQd0mIGLU7q4T8ps1H3RRdfM1KJcSN
         4137BRWcdlVuPCWj7WAHzoGji0thYs0elVKu5VOBCG6Hyb1LOv3Have5q2GECQpplX
         GikAOcIbhUoGWqMBO7ahNXxf28eRNutjMNMnsDkVUSnLKpE79ePUZHnOl7aAaxGwxe
         7feSdvUYce2CTsViNZKmWDrKq9S2uaprrNvl9YmMdI21yn8X7aDYYbR5TthUqdubhO
         YK/JK1FcMrjFw==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201211071207.3828638-1-sboyd@kernel.org>
References: <20201211071207.3828638-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201211071207.3828638-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: ceabbf94c317c6175dee6e91805fca4a6353745a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c1cea11227cb57f1ab0f111b3f6e8a250b85cfdb
Message-Id: <160771171528.31675.3929122448435560181.pr-tracker-bot@kernel.org>
Date:   Fri, 11 Dec 2020 18:35:15 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Thu, 10 Dec 2020 23:12:07 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c1cea11227cb57f1ab0f111b3f6e8a250b85cfdb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
