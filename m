Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C18469D;
	Sun, 21 Sep 2025 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758478477; cv=none; b=Lk4uTH2KAiRIfVhKwmWy+b7RIioenaT8Pja2NTXq7+tMh4QvtLgC0OBuDp4ZlRZDDFQ3ce68EHu5vLxFhK7djS5RWDaIfCmfM6QCdgqedi4b1XNynG1khxkbI+d0VQ2PofmajsJZWF0NPQA0DK6C65ae+DrofzC13PVLlDAvPnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758478477; c=relaxed/simple;
	bh=H74a3cEBgN6Y9MV1mWYXOvmspVmnfjU0HO7MxD/kVhk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FmjpH6aMMchKifHhtOqqlM1/J9aHf2daFt0HiTMO3KgMKkunzrz7fRtSQYin/wb5M2PsZ5L/p1zhdFcd7q4wddwH4M0tMpRx+b+QM+Byg+tviYFFTgVI7WRgGg6WodpI+b7DY2iYY+H3hUFvJlsvonguUqkJ0RmB7o2lkEDU824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PI/IOEAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PI/IOEAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D59C4CEE7;
	Sun, 21 Sep 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758478477;
	bh=H74a3cEBgN6Y9MV1mWYXOvmspVmnfjU0HO7MxD/kVhk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PI/IOEAc8PB/VTKNqzhulBJbL2zPRQlbWHjKSgyOvOTLpYTHXxtsqwNjpaB7SS4vJ
	 qY5nCNvS9bIYMEc1HWUXpVPxUUjDMXmXHOvmI6ZVKAW7RC+RxPyfVvPuw0wCkypkz+
	 7OZrA490ljRoFgXMrbdT3i5W4r3vOkzCEof8vOKyIWMpXa5InSfGW83SkbObbUgW9w
	 PrBWo93RZdgaN8mMwnt1ptYqxYH71eh+zb7PpnOfzjOnx3nhHtfb5tqIf9zXV3OlZH
	 0XMFGZZhI7nru8I9QPlXzmO8CHpl2t4/lOYUMnf/dDMjoO43J7y/ifLMbfeRNomuVk
	 c8I+OgEhiEJ7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7142639D0C20;
	Sun, 21 Sep 2025 18:14:36 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.17-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250921171456.1418491-1-sboyd@kernel.org>
References: <20250921171456.1418491-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250921171456.1418491-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 764c921bf0c5ff125989a6c039a344ed211ffda9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d5bd41a45050d9bcd2de9c049beaf7dc5c45aa6
Message-Id: <175847847499.14589.14262838818188424929.pr-tracker-bot@kernel.org>
Date: Sun, 21 Sep 2025 18:14:34 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 21 Sep 2025 10:14:54 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d5bd41a45050d9bcd2de9c049beaf7dc5c45aa6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
