Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8481ACA;
	Mon,  8 Dec 2025 00:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765154628; cv=none; b=FtmtYMZeBujd9rQExdQ/ATLZylS79cagjzxQeOzV/Sryh5ZcjH71UUI0009GjqIaMoWfAan596o1T30NLnDk88J9qOuPN0Ho4O3DF+T56fmIifFKmTTBFSMaN7YtcvEcFTLjznWT3NpwqEfYpghGh2LFRGpJXjjiujnKk6dOtbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765154628; c=relaxed/simple;
	bh=lOFvUlnsWpz1nkEWvP2UR0xFPdXfXrsDnPAsCaUTHc4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GSRp6lIyewj0qmG1W7UnUqWbgc0UGd/nqKYGgIMc4nvbXaMc5AaSTIrF6+HyF1qL1BNxdpHKeENAP1uryhZVZCMt+w/NuADUU0ZiJPeGce7ZsZVyVSFW8Qtw41xhID883dg9fbxo2dK5tgPOvjpl6+uoET/QKj1bjQdSxzAfNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyrZKMdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyrZKMdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFFDC16AAE;
	Mon,  8 Dec 2025 00:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765154628;
	bh=lOFvUlnsWpz1nkEWvP2UR0xFPdXfXrsDnPAsCaUTHc4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SyrZKMdxUvDOvna6DsC4lulqb6eFwrhrvRQL4EVs142IanO/vuYTwae/p32Mq6mz8
	 9hwUGAjTxL/RHUvEQLgYXKc6i59KGS2xkJICgHC36kCiAhSZyBMd3hxR5VIYZuk7RP
	 ZmJh/pUX7rJxQWjdNL3tG+Tk96jLiUAbPBpOX4tJmer4AqBaEVCZvIBzwK3gyYF/bt
	 v82vgbw6G1xO74bFmhSLSXz6PT7Q2EUqLf2N206Rk1rFl5tKer4n4Kb3d5JoSIHTz1
	 2i0fCKMc2SOLhDsDoy1kIuG7msUE+zGam5f9OoMgGt/xQTbDAgwEOFZ3Oa3jxNg43Y
	 yCxn6KKqrGP5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2CFD3808200;
	Mon,  8 Dec 2025 00:40:45 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251207204116.2011176-1-sboyd@kernel.org>
References: <20251207204116.2011176-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251207204116.2011176-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 6f172175b6f3fe35b5d519fc314f7a0b603a9af9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba65a4e7120a616d9c592750d9147f6dcafedffa
Message-Id: <176515444465.2569845.6632146799470178131.pr-tracker-bot@kernel.org>
Date: Mon, 08 Dec 2025 00:40:44 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  7 Dec 2025 12:41:14 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba65a4e7120a616d9c592750d9147f6dcafedffa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
