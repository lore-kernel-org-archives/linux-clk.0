Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9561A9F90;
	Sun, 23 Nov 2025 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763928360; cv=none; b=EbGOr6hK+hW67dhBvuUs1WMpEiUHHdRGsuJUqtBPqOVoMzXIsV8Ifca8Qv1DNE0mGuh51ucUN3oqekwVtiFKUYDY1dvZO0T6k/ncpHsd3PUMQaTTtmWFUD4WWtoFjmCcO9Xiw/V2NoCIphwCNx3D3nwhuYkNaBtryJ+B7x/NBBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763928360; c=relaxed/simple;
	bh=0MglQN1xwXrdH3rfGD98fp7D+1sRxyDtxniBdt9qwQw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d8948Yb42TfEDYgTf6m0Jef5lJDAxOqyBWjk1yjxSRRfV6kw9YEkrFHVocI2PN1bvzYudLVao6Boqqiz1CBIJ8QvXKbt0CZckehqJ0MM8sTtpCnHhp2XVPTwmYTNchpfVUjZgE1pRQjzX7Qjqdr6KZTc2z7QI+T6I/r0wnGYsew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVHoWRC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVHoWRC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C6FC113D0;
	Sun, 23 Nov 2025 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763928359;
	bh=0MglQN1xwXrdH3rfGD98fp7D+1sRxyDtxniBdt9qwQw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NVHoWRC0GVKG8K3ibWwI5JwJfJ+m4NxDDS0jazRqAQnZze35BdTadGKXlcPCIKOS7
	 J9x1xRZ1OkWjiqzwdUoPBbjpjEwCRRHApf+7HSX7ibrs02YreRNQd86wL58Sio52rY
	 DrcVUgnuMxMUVY47d+d4jAAgKfDwCRYUDU+Zeppp97ROuB6gz3A68b/haUbTyZu91m
	 cU/jsXRrq+Z1uZ/QYJ+zXdLuwLSxJYs1Y54JZeEj1ItoLLnOFE5ytTiZfXlq2skMrT
	 i04BPW3/iGT3IK/82CVLbuI3cnqMa7Mr323NWhdUCv+yrx0IKXDDDuWkNhO8WSXBDJ
	 ZXckoWOyVYrlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712593A82562;
	Sun, 23 Nov 2025 20:05:24 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251123185139.1058099-1-sboyd@kernel.org>
References: <20251123185139.1058099-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251123185139.1058099-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 3c493b524ffdb3fae7f0d9dc6b887359ce13cd34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0e88704d96ca0df77717320fec4ebabe42c8a94
Message-Id: <176392832293.3102234.777062262947850452.pr-tracker-bot@kernel.org>
Date: Sun, 23 Nov 2025 20:05:22 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Nov 2025 10:51:38 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0e88704d96ca0df77717320fec4ebabe42c8a94

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
