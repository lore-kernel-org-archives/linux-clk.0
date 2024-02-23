Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3E1DDC3;
	Fri, 23 Feb 2024 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721769; cv=none; b=Ex2kEzyWcaJp02hH3rvihKTCEHYL8AND0olHjnAdhHcriMcbWSrYk4iHlnF9gviUbTJRuneEHsSZTKHXSx0s6hg1Quo2b9zjvDwBEfFtQGYjaLICiKAqpBBKDf2ZWYOg2aqg/QQH8d0FGEcLUQQO2SJJCbtVXkDnWu1zJgHnD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721769; c=relaxed/simple;
	bh=R11JzMxSbfU8nLkjIAyElVT1gcK7t3t67qjYaeTMU3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpZ0ZrtWfyx2dp4Zxow13Z2t8U1KZ8tfYLmDRJ1XBkI1jkuCT1dd2K/SMwIxortWCMVu2Vy5HOVpufW75A8mmHCKLi7F5u02c4l8pSZslx7R8H7PkPRQEnnAa4m06QeEcBO13t0lthMNTpSLvRhdAq4C2n8Oc0ofivKASsJGdHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plq5sPgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plq5sPgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D81C433F1;
	Fri, 23 Feb 2024 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708721769;
	bh=R11JzMxSbfU8nLkjIAyElVT1gcK7t3t67qjYaeTMU3s=;
	h=Date:From:To:Cc:Subject:From;
	b=plq5sPgIzg5f5FJe67+QLFQiXdc/SS59DyH+f+5xEt6Emr++2Hl1okVDK2BygiMs4
	 7QDEPsLokjP2FAKhKvhfUSWGlk5mPeAZGgxmdoRd6uhDB5gNDs37z3pxP0DbmCHmN9
	 rEsU0n9ydRln5w/jcveX6axhZ/qTnHNn5zHerQ9ossT9wtK9oH6uz4HC1jHAsOFunA
	 v0gFmzEiQ0fJrMGtBrPJtaDiYXMtQxJjXk7I/queG7BTqMdI13wK5bkVjQCwf4ivX2
	 3d9UKAk5TZP0GG3SLPci+sv8Xv0zDvN1DBaviIA4ISDOgv/BegplpKFuo0+WChmv8w
	 0UivCz2Tdl1hw==
Date: Fri, 23 Feb 2024 21:56:05 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.9
Message-ID: <20240223205605.GA8950@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.9.

Best regards,
Jernej

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.9-1

for you to fetch changes up to aed6d713187b8c47af40c0b39462e21e2737e307:

  clk: sunxi: usb: fix kernel-doc warnings (2024-01-23 21:47:54 +0100)

----------------------------------------------------------------
- fix kerneldoc warnings

----------------------------------------------------------------
Randy Dunlap (3):
      clk: sunxi: a20-gmac: fix kernel-doc warnings
      clk: sunxi: sun9i-cpus: fix kernel-doc warnings
      clk: sunxi: usb: fix kernel-doc warnings

 drivers/clk/sunxi/clk-a20-gmac.c   | 21 +++++++++++----------
 drivers/clk/sunxi/clk-sun9i-cpus.c |  7 ++++---
 drivers/clk/sunxi/clk-usb.c        |  9 ++++++---
 3 files changed, 21 insertions(+), 16 deletions(-)
