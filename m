Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE93E0080;
	Fri, 14 Aug 2026 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748352; cv=none; b=MS1ri6ggW1mnPCanHZAVMKpCcnUFCCdNMFlfbziwzrl8fGg70fn+LtJC115u8cWV8PCGaHisAWl96e7ectsU1OSu1jZUBY7jwk95val9vH8/uSGTn6XNNR3P51nW9lo+3rtXUOPm9qUdDT+v7u1pAES9mU7YukSBvzefXM/c+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748352; c=relaxed/simple;
	bh=zuSwtGuEYEdOmn3HvB4siXU7KuOJsfzWbliuuJzN+iA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dlluNjblTV7AOkMlXN4Mzo7ThtFn/iKmcmncvXgLmhCmvOTDl+HSDBvecNCcCnStA41F8vt8OEpb2550H80UFSvssixAuhMN3ml0LJar0QOxkVc3wK+Paww3sPqCgOEPosuY+Aj9QJEtNAbcD2qyAsTOjhR9WDicAiKiPVJ9znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hf+oWO4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hf+oWO4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BAA1F00A3D;
	Fri, 14 Aug 2026 22:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748350;
	bh=OsVBHCmRu/SS8qttOTS/FSERjv96TIyWGfZokpfte+w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Hf+oWO4PrtyfaQZ0jf2Xe5orNbJW/UxXLE+uG+MFuvX2sBLhZBSX5H8PRX0KaVKbH
	 oMxCcrqf9HahaRnd+Eb8exD0gAlXsn1h2mrcCww5wM9bPHIqHnW7Eg25u3uwGSrbZg
	 FgPwly2WEZ2DcO1k7ETLlgldT0BhGf9+ZreMp4V9kH0T2olFAM+cSJ6Znjp27TOqgt
	 NxRJ2938Wyqr+HFUo+ccEW1DESaeGHdXqiRO8myfb+RWcUNhPdk37NQB+zZxQIK1lT
	 /3lZZjozL2ndM4glyaDisX8CIxYWzrfU0BUyRrrC7haUNfMHSUG0pexH6n1aRCuS4V
	 gdcTiuu8paxYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B03924460;
	Fri, 14 Aug 2026 22:58:25 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260814190437.464381-1-sboyd@kernel.org>
References: <20260814190437.464381-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260814190437.464381-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 7ae8acad2d5c415ecb754409a4b64f09169c082e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b26d316aaa8e8b7ff6f4f77006a9b7c20ee848c8
Message-Id: <178674830445.3991221.7987501947530770795.pr-tracker-bot@kernel.org>
Date: Fri, 14 Aug 2026 22:58:24 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Aug 2026 12:04:36 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b26d316aaa8e8b7ff6f4f77006a9b7c20ee848c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
