Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E473446CA;
	Thu, 25 Jun 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782417489; cv=none; b=pYA1GxUk+9JJ2GglAnCf5XQKaTuViD06Xv+n7vDAK/DKa+9Zwx/vU7KdKD+7pYyM/rH4JZauoILRXYvYper05dv3IVE8txucetyzWTpuyTgeeDQRO78/i079CfRpfsEjh3RqthjHYMmk600yAi8lSL61Tw4qLRV7x4BL9KFf2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782417489; c=relaxed/simple;
	bh=RwcKUxv61z/ZSoBpZ3few82ZRebqX+it5jFkSIpzF5Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M1JYStTmPLCEoVQsFzRo/1W9o7qhkMTKsxhFtubLhVZ5GkJWpRPuOhHJ+MN6EJnALsIKv+j00kCesodEdAYYI22B0lfdzatBv9OUC4RiGVPDK7YVdcnbdkUqpKpL91j8ITIW7WR7Sg2qGR0XjhNlwUQkSWzc/0JpswI5DlzD0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3IFMIfe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3IFMIfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABB71F000E9;
	Thu, 25 Jun 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782417488;
	bh=eseArUhrL89KwJjQ74K2tKh/ObN05dW/e/PREs+kolI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J3IFMIfes80AvFyyWCHSaqEUebJUw38SilYqHEE/JSybGaS2RlGq/JPqC5ODLwwab
	 qU3EEmJOn16u8c+rAvW6Ix5NKZQ+SLEdMt6vWlRacAxR8fQr3W6Osqc8PVj22KmpHj
	 ZPXPd10JxszZKkLAddB46UL/kQpj5DlDv0iVmeJWXk4pgfv1Eha8lJlSiErid9MIma
	 cu6+VY9QAg1Ux/FuQoUsHGTrCepQ3/RJ9pukh0sEdVwZSrWV+SMRSF1HPu12zyQB/h
	 aTpKzYl++RTfoihpDiazjkg9vW1ufM3mvmHyuaiMD3x5YvLYJe6fiIZeQf+ukmUZUS
	 4n3dlgzNH4/eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D099639387B1;
	Thu, 25 Jun 2026 19:57:56 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260625151438.8471-1-sboyd@kernel.org>
References: <20260625151438.8471-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260625151438.8471-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 92010229c4b38897f1319d260162d2f96925ed17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c04c1292dca29a57ea82c6a44348be49749fc22
Message-Id: <178241747549.135849.17145989824433508087.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jun 2026 19:57:55 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 25 Jun 2026 08:14:37 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c04c1292dca29a57ea82c6a44348be49749fc22

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
