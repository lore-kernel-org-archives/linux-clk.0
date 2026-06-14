Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F27263B;
	Sun, 14 Jun 2026 01:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781400287; cv=none; b=H/8+BOp/3L/nzeE/OVDBkuzdI2OTAvTl6Nww05slL8zn1efB8MBSDFfOjoAKHmm79qFCI8EWXFupKisv4yiviCqRBfYmR4ZqHY/YwLB3M4qMLjw4w2C7uad1YFhA7/1RRVH0XHSwQCZ8J6c8ZANaMcpCOteX8cki+xE6XBGE1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781400287; c=relaxed/simple;
	bh=fU328zcSWGBLoLyn56W1hUmSXDhxuPtvRQhI/ALuvug=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r+sVza/DairwHvBV3AHn2EqNTekwFePbfLQIGaLeAKYR2jMJ/EMnfhN0o0zNvfX8/RyuK8xclF47rpYs0FUHq3n7j0YuIX/QrQdl6X3BmtF+BaZU+Mc4F8R4HMhYF8T4hd+Y4P+pNwv3tTlCK3G/EvYf8tylb9YykATGwlhWphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp0P6j9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp0P6j9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5BB1F000E9;
	Sun, 14 Jun 2026 01:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781400285;
	bh=l2uAKlFErXXaDUN6iFUbbplyn7xdmr7gjNj9U+tEeB8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Bp0P6j9UhnnJVYMTixP/RrM2lqnVw+PC+wuyGt2qPIVK4TaI1NQSk0F75DaAys7KS
	 GWP59a1uNkb/50g3EB4gNslRa1sLyoEesBQaNs9sh/0K6JQ9D1y+1iHSmWPugiX21w
	 UIy3rmTtjmeTaBJqQb7AKKV+T8Zfz9gEz2bbxYZV3s3KfGKZIHPOLx1h3+q8wecZKn
	 ibQ+AOKwNEa0uosxv2mVx/JxbxgFIKsrufTWmJxEiRl6C7P3/qmst5A8JQrOhN2stW
	 rOjjUIr2RTlMa8kEZHQZhQ0ncHWpJl4Dl6x49ceLSzFMhzzaOfqwcNe4uYMBRcQSpJ
	 kkLXDo9/YELSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A143A54A33;
	Sun, 14 Jun 2026 01:24:43 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v7.1-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260613231119.925018-1-sboyd@kernel.org>
References: <20260613231119.925018-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260613231119.925018-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: f29a24c94705496254dd9ce7ea8a31efb6eb4358
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e21ee273e6fa3879aec9a27251cfce98156e07c4
Message-Id: <178140028173.1650075.11237479010044216195.pr-tracker-bot@kernel.org>
Date: Sun, 14 Jun 2026 01:24:41 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 13 Jun 2026 16:11:18 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e21ee273e6fa3879aec9a27251cfce98156e07c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
