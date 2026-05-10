Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B92D3A1D0F;
	Sun, 10 May 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778428521; cv=none; b=ixkPillv8hYmGuz2StWBB4Ek1IAuwomTDZbbhjOffPajd8S8WhkxJgyFKRBdjT+wLsbcjq0IVbVzlfAMiwbnXcPBc5L+EHihoaclTeNzr+bMvUxRnRCTNtp8MsnLJ4gh6HFtDsR08nU3LtHfttaY7OZWYhpk74WJXDSQUgSBsV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778428521; c=relaxed/simple;
	bh=1JHVuYHpBvYXVYQBhIwjs0lfVU8P1go9liWUhFSz1zM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gFYfVef5Hb5DydpE6AubxfvVvV5G1umQ2duJ0SSl8lJJGxAehfD21ETA39ZwRZnRnRnOUZD7FQgj9ai7kwB27aBYEEHxfgrNudNk0XNYYqNjo5ALL/LBF64Fth9Erh4iZ9/LK9ds6DXec8DIq8xX5/xzKh1wzS9fKhF4Pb+abtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCoGGvK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCoGGvK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE98EC2BCB8;
	Sun, 10 May 2026 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778428520;
	bh=1JHVuYHpBvYXVYQBhIwjs0lfVU8P1go9liWUhFSz1zM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sCoGGvK7PmAtMTe2iGmqJb8V/P030cRGa7L/L9e9QcYH6gXjMNwJWRBHrhMpbVw6s
	 JDvNae3BX5ZYNUIay79L+745U90kq4ziq3ded7efCE8ry4Q8+CcKhugchpmucBE35Q
	 OdVPZTpGnHPv2tienoC7tm+6XTdsI0TBTELavl1vkhS0xw4BzQN5dBoVUqcHsC6NyU
	 YYsKfC1MK8/LR26silcX1er7iF4R6NPMOBsN1gGW7zXh1hlUxtEnbLfvJH4j8S8VhX
	 TONzBepP5MM+Btb4ndCNU30FpDMqOpVOmc/MUcOXyJmpIgmULY9oCXtonyxZNpTm8e
	 qJy7ytuMzkA+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEB7393001B;
	Sun, 10 May 2026 15:54:29 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v7.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260510150635.3330901-1-sboyd@kernel.org>
References: <20260510150635.3330901-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260510150635.3330901-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: de019f203b0d472c98ead4081ad4f05d92c9b826
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1a10cdbc6551ba359169a3033f193b7f8c1b95d
Message-Id: <177842846820.1418180.16571446141985188508.pr-tracker-bot@kernel.org>
Date: Sun, 10 May 2026 15:54:28 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 10 May 2026 08:06:34 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1a10cdbc6551ba359169a3033f193b7f8c1b95d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
