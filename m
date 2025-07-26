Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755621E094;
	Sat, 26 Jul 2025 21:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753565272; cv=none; b=TFVyTVd+Z2zGQbZ31yDCYY6EF9I51+ajpywByCctKyWhGgIxXE4dLH6nYus6+b/RnSzwZWMXJdgrB69nVNmA8z2D98NkaSMC0FgN8CvYgwZfODsnQVfs08G64tv6m72oqCIBPFp48tC3RuafI6qgSu3xNuLzegB+5d/g8W5IVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753565272; c=relaxed/simple;
	bh=MSjmq9GyljPi68MG4bgZcoa6Fq0tl2Cy6lKab2Raspg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=b98gZz/5ZV0HnhBWosYE+MMwKKTZEmZT7iNx2qTSMnUJFFSsZ3gpo+bxxIvtFfxb5vIhZoVEU0f9zF81lWA0BJ29QJ3G47Sr6M6Wox8hlleeCPeGmyaeJKOl912TqgC6qK18bwm0vspxYbbmUQjqbAxeTVF2VQkn7S0i6k9Sz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HD3H9kGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HD3H9kGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8453BC4CEF4;
	Sat, 26 Jul 2025 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753565271;
	bh=MSjmq9GyljPi68MG4bgZcoa6Fq0tl2Cy6lKab2Raspg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HD3H9kGl5lsS6q694ow5+vuvfAiDzOSQblG1Ui4K3X9wTvI4zlKbPlunydObwrVb6
	 XFARkSzyfpa/1BD3u8WgYg7ytObC3kCED44itsSxlNFh2M9GLR0KI2QvQSKBL6pNVL
	 Q3xYi0tXtHj3Ki/esbeUR3GzuGzrJ/xO7UHrEB2O/AcejV26IWHqj7RlQCWq2tY00p
	 DNXfNKmK8A7GNTNdY6LlT1qSCbZNxWS3CXgwK8qbT8O8BNhXBKCOcGHkB6h5W2UitP
	 A+TRg7qFLEwHfal/pMDtcoQaC+lultluAKpHj1615xAEpapDZJRMpXU/nC9otzaiX2
	 iFBtj/gg46x8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE98383BF4E;
	Sat, 26 Jul 2025 21:28:09 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250726193600.1549708-1-sboyd@kernel.org>
References: <20250726193600.1549708-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250726193600.1549708-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: e4b2a0c2b9be6d10b0e50a7485fe9f569a6f2436
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 874885990b18073213ff1797774c401df29676af
Message-Id: <175356528860.3697799.3580750491914103066.pr-tracker-bot@kernel.org>
Date: Sat, 26 Jul 2025 21:28:08 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Jul 2025 12:35:58 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/874885990b18073213ff1797774c401df29676af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
