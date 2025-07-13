Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D8275AF3;
	Sun, 13 Jul 2025 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752432168; cv=none; b=dEt2IJ3WNKawN7hjBe5Vs3+zhvKLM6/HTZavnTEKjxFc/Ya8rNhEXU62TVnBLKPVBuY91evpNsXirGRA3q+7DP+v2T0OrHhlFjZmb3szelEIgDkfMN4xx4Sux5VlAr2IZwGKLwXAs3+oN6PrGkDHebxyN3noC7enIEGMMqU7eVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752432168; c=relaxed/simple;
	bh=Bhcqu0hkYsNTrwY29ICbzmvHRFk59bU3ytbIRl7rC2I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=c4l6HZriIp6GY6QVAw5IMXSkR2LNWXxK8d6PpuonMN1+moYuiA/Tj8T+37uxbH9OWMHfl4bt0XciaG3Lk82euenSESTT17i5coAm43TuUPI0rOdwndXKtQlBMSx0duQgfsJbysX7rJTzrQ2Z3YMd0zY1YfHxmic+92NnMuHdYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLjOmMin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLjOmMin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395E6C4CEE3;
	Sun, 13 Jul 2025 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752432168;
	bh=Bhcqu0hkYsNTrwY29ICbzmvHRFk59bU3ytbIRl7rC2I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MLjOmMinQvTw4Ancg3YYnZCiK9+g0sj03ObVkptkIkoM0oGL4nNeYKVa5NShJ5cEq
	 kvJrYkzIyle2D0QnCZmKbNK2nvUw9glJX4cyGzq7Xm4qRP/ziMPaQAFsnXNbXfVlts
	 mK/wbvFfCpvcbLKJ3v0P6l1HJtchzhCmgMsXrHI6flwi0ciVdfuDWy9ZJBb6IO5sOL
	 qe4LH0eNfSfJ1Ii0k2mpIIhEGcoa+CligT+WA0k/O2GTuRTK8WDSTagyORS2g7cFG0
	 0dgNs4bz1QqgCLhbubYZLGaWSAouJ3MW9mMpE+GF6DYq0xo20ln4178xgrM7ucQMM2
	 dwKxYAalzo4fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE01E383B276;
	Sun, 13 Jul 2025 18:43:10 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250713165256.1650456-1-sboyd@kernel.org>
References: <20250713165256.1650456-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250713165256.1650456-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: a42b4dcc4f9f309a23e6de5ae57a680b9fd2ea10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3cd752194e2ec2573d0e740f4a1edbfcc28257f5
Message-Id: <175243218926.2836117.6613501768892174134.pr-tracker-bot@kernel.org>
Date: Sun, 13 Jul 2025 18:43:09 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Jul 2025 09:52:54 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3cd752194e2ec2573d0e740f4a1edbfcc28257f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
