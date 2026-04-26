Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706B270545;
	Sun, 26 Apr 2026 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777237748; cv=none; b=gMKzOUBsNUG3mQX/hSa0/px4qP03mKjPZglM+9JuM4WDqLif4kfbpsjpVYPo+FHpERRbf9oVaTPY36GxXyk0KGmtgqPnCePJ0KU2p9FaQZiHrYSkv1pTJVCXLSOd/+7/CQS6BNfs45vQ6H9pCxZu9Y8mBgFe8Dg9TsCiJfnBQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777237748; c=relaxed/simple;
	bh=kwWH5wf7o2hHIhtsM4qNkJPTlE6anqS6NZFXkCTGQ2Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YsMERh47B1nJf7SUFOFYxOQXjymdiJPzrxCCLGR/IZ/s0gGtrFo6HeUYR+DscJ8tQyj7zlK95EkTnQmH3N6uK+0MVAqX2Dc13HlliBWaXdOL/geCLwZUiHSzh4fK4sCMHxDxpXnFDnQXd6HnuCu/onEm9PTjWIUI1hY9VWHgd5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t00a3Os2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t00a3Os2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FBFC2BCAF;
	Sun, 26 Apr 2026 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777237748;
	bh=kwWH5wf7o2hHIhtsM4qNkJPTlE6anqS6NZFXkCTGQ2Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=t00a3Os2YGbMw1qYnAqgDMwwVnsHGOYUmbUByVsy/Fb9gCby58ElY9V2DZta4ZBIR
	 I1hhl9z6dKdoT7IOzUvZh+RQKbJm3SrExn7g8b1ikWiYVT8GO4egbN/cbxYRWrslgA
	 IW2NRrahlVQn30WTnGOj3q1HjrdOvVHfzZD17W/FDaSDoSQmduIf7dUnvZKY5ynOsM
	 sUt9icgVy2Te1BC1kswmvKImOLKDsw4UvbZ3OO5Nbx22s+BrvndyJKjP4K8hJFZgrs
	 L2c36JCVNR4PTP1scome70O/4KjTXZaY440ZVxQsuJIBOBKKUDboMop4Vl9HOG/UZy
	 Gte9Ngc7pSd1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA22B38119E5;
	Sun, 26 Apr 2026 21:08:27 +0000 (UTC)
Subject: Re: [GIT PULL] One more clk change for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260426173730.2296370-1-sboyd@kernel.org>
References: <20260426173730.2296370-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260426173730.2296370-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 522567362b634015ca85b5460482ee0843feb105
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14479877c1ec9667edb4a7c20a8d7a704e7249ca
Message-Id: <177723770618.2388070.12753891982941515526.pr-tracker-bot@kernel.org>
Date: Sun, 26 Apr 2026 21:08:26 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 26 Apr 2026 10:37:29 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14479877c1ec9667edb4a7c20a8d7a704e7249ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
