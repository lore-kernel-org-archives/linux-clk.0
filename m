Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D01214A9B;
	Wed, 22 Jan 2025 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572774; cv=none; b=IIxhir0p2ny5KXhVOqP1ILJzizbArnJpL7XT/kwpoBME6YdHZgGXWiOcJW2hk8pu+/zOADwhjuftxWtrSmu91p3FxzXm0ROa8uo7oNEQ/QXc3DFi5UaBTU0qLmApKUrjIUHgJIOF2S2VIrOX2YdAAWSRGR3rjALypasHZIj/d9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572774; c=relaxed/simple;
	bh=gG+8Z4kL38ZgIqVkVjKZyBs3Fh4c9WqnwgTO8Nxixyg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VFMN9RHSk2RrvsoTZa0n1ZSQwDq0Nxgivzm9MNI0A9h9mI1dkttBsESDBvyN2SKI3GvvMp8mjsodlLTf4DMEplVIfjB+HA37/7VTIzG9MYZSwHl6EoFCeBesrlcl3yaF2QnBFEko3iOZ7tOr0UwH8EuGQD7xFrOG1p9n+pr1HBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt7UrH3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt7UrH3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A44C4CED2;
	Wed, 22 Jan 2025 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737572773;
	bh=gG+8Z4kL38ZgIqVkVjKZyBs3Fh4c9WqnwgTO8Nxixyg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Zt7UrH3vpe4F+10DSiIYihPwHUl9OFZ4K9xrvCIOGxzoEwNC5E8ioV6rSWTqgGgLe
	 nrhqElwvyHM6Z0m/yzoviVuDasKDNS+ZtFH+nM9ueeR8fFCamV7DLHFxBvtv2miGBp
	 7ytz7h4+HxiM80ne5za3+QoRcID7jUBoFjhKLqxs/xPnBwoobK/VKYHYKl0r/Eypze
	 Q0Q35GLdxlHCrpXglffZL6OdYbTm5eEBfGJ6gRboNwZypjw7dNhRKKLec8lBFyIBYp
	 b5qItUX0mHtgR5aGYhI1lYd/z/6dvyVUj47hn1I4eGDX6O9wXjZhhwPUM1fCDiFDLf
	 6PeN2OJmX1RAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E33380AA62;
	Wed, 22 Jan 2025 19:06:39 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250122002344.3107447-1-sboyd@kernel.org>
References: <20250122002344.3107447-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250122002344.3107447-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 53c9c27672bb0241998ddf2d1588106920d4064b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 641b0c64b85a9b21110268f511f20d6887406117
Message-Id: <173757279817.783272.13399659562587626052.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 19:06:38 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 Jan 2025 16:23:42 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/641b0c64b85a9b21110268f511f20d6887406117

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
