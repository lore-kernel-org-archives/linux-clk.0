Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46824A21;
	Sun, 15 Feb 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771174668; cv=none; b=uHc8kDTke9tbycc4NfeYhZYSSbUJH8R7SkmRa//w9VJ3+B/LsuNb1qA2sbBsAp2h2LRzUxqJvDy7DtdTGN+mNykVYEoxWSlmSLv+xOm/szs6sPbGgnllIRd0ValXkMjnvr9NjnXAEUz03BbaR03xTv7CtzUFkYGnuNLyid7A/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771174668; c=relaxed/simple;
	bh=+mZ9YiyVBZswihJymhtjZnj96Y+HWa4HP2eQhB+9hhc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FKcO5gvXPKbCGgOeQwXQMnx1ZTN7lVTE5zqj9F2bjjZSCVkqjSO8rbQWG49Ztd5WQDy/briLmRK683wgP54G4l+rSk8XSRO/IhYtk+jz4cxJQqTsC+6km9F57mjTAXr0Zs5JVm2QGtEOJf1W0ti2b40So57CawZ9MQoBBxKus2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRIWchpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRIWchpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA6DC4CEF7;
	Sun, 15 Feb 2026 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771174668;
	bh=+mZ9YiyVBZswihJymhtjZnj96Y+HWa4HP2eQhB+9hhc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DRIWchpVxd9mwsmRz53vQhFgQtA4pIaWynAL/axRjwfagC0YVPiuBpxpWcPMnQiz6
	 YlBZj/9ZRR2O12OLdJsP7Q734RUfsZnoKuNcMdgsIPHyt6M3n/m0n8BgDHeS4txPpl
	 pWHqn0kySwH+Ab2Fqxt/D//wi2NGH4km2YyyKu2QWUChQNtuAVwqrOAgeELDI8Z0l6
	 7192CM9vTzTczRgROvO5ssnLgYqW8woG9BcbsOlAIpD2Xr+k2m0XGVm5k4k5caF4Zh
	 XgBuNrZNwvjiZ3i+X/N7DEnVi1mwUZAhRnWcfEcv60R4AZIF391UFv0DuJL/oVbpJh
	 WiCz42/XCP8jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C22BD3930925;
	Sun, 15 Feb 2026 16:57:42 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260215015325.34211-1-sboyd@kernel.org>
References: <20260215015325.34211-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260215015325.34211-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 5921ae27ea7b0e8cda621f8951ca79b34c36ce49
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13c916af3abf98f4a2a00b9463d2fc00cc6bc00e
Message-Id: <177117466144.3131369.8269115367940935834.pr-tracker-bot@kernel.org>
Date: Sun, 15 Feb 2026 16:57:41 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 14 Feb 2026 17:53:24 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13c916af3abf98f4a2a00b9463d2fc00cc6bc00e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
