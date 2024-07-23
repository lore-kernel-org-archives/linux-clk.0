Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD021527A7
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721739517; cv=none; b=joESvt4b+m7eFlqEKZ/sRcoYJzxahfDq4PlpsDHy9xEh6E/lvauZNp2reaUZxtSiUI/E2rppJi+ilFm1cioHpAgXsW1cLtIERu5MSsvIyMkLDEjcj8/jdlbYpW9jTDjGrqeU+cV9KDLxFMtIiRkQk2p/8akmBPYdjablTyipMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721739517; c=relaxed/simple;
	bh=WajohK/Qu4zEpddE3qakoWHVAncIfRVEiqpOcTt35YA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=p0Q7heQ5I/1T4BN+vJTN40Tu6iymCmlttX5o22mzEbDD8KUMOaUEU5ttnwV4BV4RNDYWKo7WIMUJ8vPUSJZHFsUbS+scQoKFXJPCdLONr4SaJo5ktdWgmTgZaU6fM/XaVKWF+smCmKjrKCrZ2Xli1feLuF/HKG3Q88rwYqzPBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vImnpBuv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vImnpBuv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD7A5C4AF50;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=WajohK/Qu4zEpddE3qakoWHVAncIfRVEiqpOcTt35YA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vImnpBuvXem+cpOSDW3F9q9E1IEBFU4A8s/5N5SrvOwHDpzfMIbP5X6ynpJq4SNut
	 5f71/NrQsotHg+FugzxtfGfwE+D8OSnMLJeCfCCDgEu7CvWgcqn7Mi2GaF9UsK+eCu
	 4rX7Goe5SBBhtkSuw+HDovjGIOJO86gBJ+IlJ0pSHtEr2/NIWgLC6ZFiwOOx9fhBM2
	 smHI37p+HSHaIlkqFgRlojfESiHcbx9w0zDMx6zlOv95qeRWqf0B8jWRN1aUOXTS5y
	 Ysj8ObXqLcB0lG4TUoLyRXk1VScwjdrLG7zZ/MRVdKwj3En5MY4eyO3NFBylPpvdR9
	 3f4IGNEAy/iaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97932C4333D;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <172173951661.10883.11626056916219005908.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org, sboyd@kernel.org,
 linux-clk@vger.kernel.org, conor@kernel.org, inochiama@outlook.com,
 xiaoguang.xing@sophgo.com, haijiao.liu@sophgo.com, chao.wei@sophgo.com

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Stephen Boyd <sboyd@kernel.org>:

On Fri, 14 Jun 2024 15:28:22 +0800 you wrote:
> Hey, Stephen,
> 
> Please pull clock changes for RISC-V/Sophgo/SG2042.
> 
> For dts part, I will handle it at my side.
> 
> I send this PR just want to expedite patches for this clock driver. The
> patches have gone through 16 rounds of review [1], and I have carefully
> checked and revised all of them based on everyone's comments.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
    https://git.kernel.org/riscv/c/54cb3bb48337

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


