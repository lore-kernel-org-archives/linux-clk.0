Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383208;
	b=gNM5zRWzp/N+AWon9ojC+gx4Mzuam4LEI4kA9Pd5pVontOK9k5rLbQZIzGo2mk83MHee
	 iPHi2UAnVKPo4FcZLrKMEp5hUhjXKTrTPFSZ2sHDWFGbRFwzVtuQuu0ar/hCmeGnwOjDY
	 hOTDXn3/h6aupyNm1Tatqs2DIBucQyaUxDYQKx4ehaBqXVYlaEs+Y0d0jp29q0rFjzw6S
	 c1c9dqdDgwsfmvosV0b9JzyQH9lyussNvbcLXMot6BtHKjZ0l9raWdl1TYxKroTMxe9QC
	 QJeSr+6f7G2xO3JZs8N+LFIN4DhoNmKXF3/wv1lIhonIJQyOxszDeGqKuUXK5Kp16JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383208;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=LJU6mesoaud/O7ObSfEIFCpEqNNQL3teE2dTAidwTHw=;
	b=gnrhUsRZ+tkX7xnwJ6ke1kDXI1C5/0Fsri4pUczrdIJcF41OSykqAsvtq0pC4Bf4Y8Ri
	 PolWO4NGYeDbUdlUtneI4MridsJwhGGNqxXcjKAWW9GM6sORRHnEMTrpoteqaYpYSykm2
	 25Gf0NS6Kroofy9rjkQoAnm3QQ7yLmdi+lAP2hje5PQHLVj3O3n+SYg/I4Gn/ZLrsyUxp
	 HG8gtBIOnDIv1osvoTD/uxDroChk2KCIAQdwYa55JuFuoD45F3bThCXoS4AIeODDxfYod
	 XCaWLHSHduSxUHdjFR8jXACZarvvqM3G9tHWM0AN1r4ZD4GPM7dmxOQVau6JjLS7ItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMHoNUTb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA6606A338;
	Fri, 30 Oct 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMHoNUTb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3BA1F0093A;
	Fri, 30 Oct 2026 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383207;
	bh=LJU6mesoaud/O7ObSfEIFCpEqNNQL3teE2dTAidwTHw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HMHoNUTbhogqrOFqGqbhRP00+Ljww/6Tf69Wv6IzxNiFiGv0sC+RsZuZqXlzPqaSh
	 FRzf8dRHIcU5RP3b6KeO9+3/wrEoys9oWPnmPWJScoVfjk0kadx/puJVVb+pu+JXCg
	 VBuqe3wnwLAmWFjHM3yDl6od04/yN64CuRo5tItNNNtv5L+lx0Bn6eSnntLRdhByg5
	 cwP28qoir2UPzFUyULwfgtE/7Bnzzyo8Ap1Jh92t5WELBV7auP9i/Jrv1W3Nynndw4
	 Qltz4CXHd94q9GROtivKwsuepMtbygwICxVVj0LSk+U7Mzr1sLKbOisTaXXRyfFfBi
	 CaydY5Gl0/mCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D66F3800470;
	Fri, 30 Oct 2026 18:00:07 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261029183811.347902-1-sboyd@kernel.org>
References: <20261029183811.347902-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261029183811.347902-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 0d9678b125d8315d62de1261bee67c7e6f21457e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4517b5a6c8745f244d89971dc34ec69f5a9eb3d5
Message-Id: <179338320614.1671436.10546377232510425224.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 18:00:06 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 29 Oct 2026 11:38:10 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4517b5a6c8745f244d89971dc34ec69f5a9eb3d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
