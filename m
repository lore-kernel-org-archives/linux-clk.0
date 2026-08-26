Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1414939A7EA;
	Wed, 26 Aug 2026 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769685; cv=none; b=gomtslvH/Hsab+0mDJhzVjZ4vQIdksMVmsBRS8fksVl6zJa8wyNmaHp0ZSbf4ArXWSzf77JB6goWW/uun9BfiMLT6rzzK+c4VEvid5qDTb1mWrw6gndDOzHKKne9+Kfo53CtevRkWenr2c/EQG33ZFhPymeqbIqS+F8Vfxqar/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769685; c=relaxed/simple;
	bh=gReGmE1/cLJaKfOplEbYGMwMn7y3EAF2eWQ3WT/RweE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FlQgCtSBQfK1j5ZkLxjiTEgats67+HbNwsXmi2bk2aMNhEDMl76Mp9c6PmNAAxECUNgOnrGa8EOhanO3D5SLHPNvbQyhxT5ZIxSUDpEKruO2Y/K9Q1CvL/okhm6WCtbHVvj9tQH7bVFs1Zcv9K68EjT3xjVkPmDP3OwBEEkrbCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RI0o1BXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RI0o1BXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE191F00A3E;
	Wed, 26 Aug 2026 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787769673;
	bh=GHgN47fcm66FKMvq9HPLl1KMG0+LE6+6iSVOZ4wRA7g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RI0o1BXxuqucZ0Oq5qHGeVzi9jcmpRixY4Ws0Suuj4o/KP2ZSjwqccRdTwwIWW5Mn
	 1+n3Ug83VqNsiZLHjKXCMMG/coYiakWwqW001JR6nPdJkHidd+pdmKz+hOTYbX11WQ
	 wjzjgpy5ad/yXetoNu5Y137AQOBovJ8ORkTp4ghEiWhk6vmrOJnyUL5nrg25L40hP3
	 vEcTyxZrDH5T323Yh8+YqhwfMupTdoWBRb5Hu8cpiQuQ5jc6PlYH4NLXk6hlKeW5xK
	 qCQTMd/i1xuD5B/jLN5Jdn7mYTjO6cR35mnF7T917TS2Rwphw21V2dETcdirDCPkzp
	 wzM3ZCiiRk2lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19C55380820D;
	Wed, 26 Aug 2026 18:40:21 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260826165611.236321-1-sboyd@kernel.org>
References: <20260826165611.236321-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260826165611.236321-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: dd8eb789f18c4c600f28e61176a02bcf3b790117
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 502d45774af09f1c681c754c4b7cdfb5d7f72fd9
Message-Id: <178776961985.801860.9851676902423938203.pr-tracker-bot@kernel.org>
Date: Wed, 26 Aug 2026 18:40:19 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Aug 2026 09:56:10 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/502d45774af09f1c681c754c4b7cdfb5d7f72fd9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
