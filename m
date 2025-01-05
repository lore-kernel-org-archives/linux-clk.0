Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8861C5F16;
	Sun,  5 Jan 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107422; cv=none; b=rUR+OT+HKQsNPh3VaRli7c/mkMAy0GmrBfwWW6q2bv603WBxqUQA7AHHvfdvGzYexSrnjmlvWHPpCsRtyQZ9uhzhyqFsXBrqORDJzLAyqhsAUJm8TM2XK91SJ5KWGdzCvXkOaue//gygfesA3nhhbHNpJCX0hzGXXtw5VY557Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107422; c=relaxed/simple;
	bh=2QiVVvEdyfEV4KKA76024dZMQPxMJ4sgx97ZvsCV5is=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mOmWGUw2ExQtMMwjCxaFNPnXqXcSR9szxHtMq3Wjfjhs47+XAQZRjFljcHI9i16VKoTslFVXCYbqeWc9veldHi44Yj1Cz2AWgMp34TC5NrHPX+kZt+Ry/mJVyWG/ZJgVzNncMQjPUGEU8h7yGQ0TrFUNoy85aR9QKs0rAEipoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnhl1/YI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnhl1/YI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445CCC4CED0;
	Sun,  5 Jan 2025 20:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736107422;
	bh=2QiVVvEdyfEV4KKA76024dZMQPxMJ4sgx97ZvsCV5is=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pnhl1/YIz2a/Czv/h6Ejb1ABu/9lZExBeiVPC+LP27577Wc3orsfve+J9YTpFuJKa
	 sMwA8rsPluUIMC/GDPS8sNLbplIdsJfnFa97rB8H87SL5C81/8GYgEoEXYc70wLhlS
	 REbadKkFyh68rH0yKT1LEgFpXAvx/ZMZJYD04DGcsUGjhttQd5+Q1U4B6UUYGg1VUC
	 atZcIL199adBVh888Q4Mx9O53xRdWIyNsEAeghszANMTeSUW6bM8a4YX6uRWjemtwn
	 gkeAbFFgFBZLtc4m1QAIhsxHecTzp2BEI91q/WtSCvJaltcaWnN4Jke0pqehprpafS
	 l63ZD3ANZTx1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72215380A976;
	Sun,  5 Jan 2025 20:04:04 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250104205557.116554-1-sboyd@kernel.org>
References: <20250104205557.116554-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250104205557.116554-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: c384481006476ac65478fa3584c7245782e52f34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a5b6fc8bd70cbb22b1e9eacd7edaf5626e9fc74
Message-Id: <173610744315.2663043.159221947203607777.pr-tracker-bot@kernel.org>
Date: Sun, 05 Jan 2025 20:04:03 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  4 Jan 2025 12:55:56 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a5b6fc8bd70cbb22b1e9eacd7edaf5626e9fc74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
