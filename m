Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B8387341;
	Sat,  3 Oct 2026 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050969; cv=none; b=lDCsB+zAwnf9n0iMA/9XhLnFzyVPMpgBz3gUSGL+inDqdmE22QUQTX1DsiLWa+MtLrs/X0L22RvhbAIpgwTFfh8BlvQtLy0pX7TDycHbN3F49ptuBilGS3N+BbnktSV188+6/CnycZ/Jb+7h28sOEL0P7IbMV5Y9VzETzxr8XgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050969; c=relaxed/simple;
	bh=O5XzRpcKkHnhhg28MzUDUXGsHhvU5NcPkGOEsOZWReg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XjGyC4tUC0HveFzzMy5aD8bUhisjW59M1N1FgIy9t78MJzlJB7hIbiXk+Aaz1OzBOu/7Bdc1UqEOg4pRW3jwJRBD7z+HJCwu1XX0nyB1yzQI7iWkBzykHv8h93MR/Pv66Vv0bdsZ6heS4jXIMW64cF9M9W8O2NBRxsL6ia8RUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgwlZoeM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgwlZoeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804E21F0089B;
	Sat,  3 Oct 2026 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050967;
	bh=uEiOoei2yMBl0NSv/+KYjU2bmyGFc2lWgCCQvWx1fus=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BgwlZoeMfV1vSarrx5II/CQZnA2uIhCuohXnc4aykMyE8R+WSrmRSp/c5t7YYnw1j
	 UnP2WKrYhcAyJH6jTzFmGFKVwrwb/gs14axexRbg/2feqJL6arM/Qbz/IUasnN4Q5j
	 9uDjd6QpXGjDGgSc1ETmHAqbbEpWohEIGoladt/PTVBL3Lw5s8LffFcrAGLBcz8vKH
	 Ig/E8QOJH2i0QupJhQNGZ2lXD0ZrRTe3uuSEC5nwiUqLOirBCy3n2uxw5nyyQBJbDL
	 GfWpE1ymWu5M/okzB43Bk1dUbCdH0mhx0IPwxnnV5q+jnxUPB3SHdtAd3wvfQRayFs
	 08iyugCivJuNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 776003924A49;
	Sat,  3 Oct 2026 18:09:27 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <asE8E2kpcUoysqyJ@x1g10>
References: <asE8E2kpcUoysqyJ@x1g10>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <asE8E2kpcUoysqyJ@x1g10>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus-v7.3
X-PR-Tracked-Commit-Id: 81493c1dd1b1ebecb2843a7815973a5bd9a37e5a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a74306e2e676f9775457366fc047a660fbf02f26
Message-Id: <179105096596.175599.9074177318134629971.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 18:09:25 +0000
To: Brian Masney <masneyb@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 13:32:03 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a74306e2e676f9775457366fc047a660fbf02f26

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
