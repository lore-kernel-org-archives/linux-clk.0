Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75037C0E6;
	Tue, 21 Apr 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788750; cv=none; b=octKQOyZ96cgaTGGfuaRUq/71WVXEJFFJKlbNIpjuZtku3DgqTEHJxa6pp9dsbOOvqJB7koIZxAn12vG5i4/x8Ydx/fz8UkkVLoO+vjDEhV29Qc74sXv5BmxPrk/K8IS7qinqf5m57f5M2xDUcD2b4hlcW4nIgAD+ZFo499QcKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788750; c=relaxed/simple;
	bh=hExDVXGYJmRHPkwF3oYEGRC9ZxTtf82Qy/Gw/q1eet0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HnduxNNNkAfsqnGkohsMgj3GYodjncB58Vybya5H5L3hiep4buOvCuTE2JzNy0Z9mG+O45aSh3XyJixWnYnPdc7FKhl2d/HradwjRyfRmxZwK4cxGvRg/QGOHDztAHw/sZ59E38Fn1Fd2NOBTzsfGiYcQulRqQNZTE5KPtF3IDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njv3WO70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njv3WO70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39D6C2BCB0;
	Tue, 21 Apr 2026 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776788749;
	bh=hExDVXGYJmRHPkwF3oYEGRC9ZxTtf82Qy/Gw/q1eet0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=njv3WO70flkl4z29FsbFgqkXYPwUOT7bBa7QGpZuvEg3Lso6h1BnVr+r/vb/YbPyO
	 F2LB2w9VAJhsSH6V4qfIvv9Jfu38f5w38aI37g70DmnQnuLMDcHKRGrZ6NsRJUsCrS
	 wEoJ8iTO3Z4SXUUVaDAs8U9KWhpvKYeH8SUacHndr0C99yXSzjLzGZK5A5DK1kajJd
	 HefbwWExZhWypZVUxJ0kcWZnUeHbjL4Mv3gcEju9NlGpCiU8xtHUPfc0Dut/ntjqHm
	 oAg/f11A8i99han3vDbseYF5mJpBqpqHnL1XABpTgtS/kjUUh61jVlZWFpDh4DDEl5
	 VvRU1MB/0mpNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF1439301AE;
	Tue, 21 Apr 2026 16:25:14 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260420183208.2287306-1-sboyd@kernel.org>
References: <20260420183208.2287306-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260420183208.2287306-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 6b701fde9b31f085f39fc2a371cb33212fab6f68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ee64205ffaa587e8114d84a67ac721399ccb369
Message-Id: <177678871307.2896080.10150995842388995786.pr-tracker-bot@kernel.org>
Date: Tue, 21 Apr 2026 16:25:13 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Apr 2026 11:32:08 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ee64205ffaa587e8114d84a67ac721399ccb369

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
