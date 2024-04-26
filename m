Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F06BFB1;
	Fri, 26 Apr 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714149709; cv=none; b=h/1dYWowPdMb8U7MkBNSb7qVGiq6LMeXC/vWFPocjXuxEtcw4A2Sc5XxwNbUcTw6gNweGuNscMg/1bY4uCxEwm+xytZM/xccH7kKRzbBNGAl6nL9O9u2xHGsBrapuIfeOyJpo1aezvUY8uiYShlyIV+44SlKsveIlnvvfsjxIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714149709; c=relaxed/simple;
	bh=vK8IJTYpHItgQcPNQD252lOsNwqRtnalrXG7tCv83JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UlsecsAYwnR0CYOjbgzA/+IeEDkCEYXotrgXKrPyHtb4h7XhC+s85ppCNznSyj7ff4dQlYTfSmpgrhWq9ta6MV57DCNREZa566+sXbr+CPpitEcgJuLcyC6eMKQpQLXKz0aVI7eb863JJ9n0iRvnooCclvS7AN18ziLj9n0tbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgjeFEtl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgjeFEtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC65C116B1;
	Fri, 26 Apr 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149708;
	bh=vK8IJTYpHItgQcPNQD252lOsNwqRtnalrXG7tCv83JY=;
	h=Date:From:To:Cc:Subject:From;
	b=kgjeFEtlNyCr6lf4+6MT4/FLie3CAqkS3iTKdaailhdqR3W2HtFVDaP/RCT172vbC
	 bIiQZ3izjiU82Uq3yGwwXg38q1tRpfGgcmr8NEMZ4BaRI0HoG3AEtltpKYdfHyZ543
	 sBsYOnlbN1cNWF2yCL6Th52HU+w2nYmuzYCViSXRv1ulL5HTXib/wNQ1D9xp9+4HOh
	 AMDUYvIaR0cV/wY5OGJ6rh6uer0VbjWD41zHzod3FGP5xYI8y/CmxCPrZoW0zFa+Gh
	 ItEOANBhyrSrJPUlhK00+tp87/giUd5Dd8BNttIF0IwdSXbc94x3UXA6/Ox8Zdduav
	 90Z7sr28QGljg==
Date: Fri, 26 Apr 2024 18:41:44 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 6.9
Message-ID: <20240426164144.GA100911@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock fixes for 6.9.

Best regards,
Jernej

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.9-1

for you to fetch changes up to 69f16d9b789821183d342719d2ebd4a5ac7178bc:

  clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI (2024-04-15 23:21:56 +0200)

----------------------------------------------------------------
- fix H6 CPU rate change via reparenting
- set A64 MIPI PLL min & max rate

----------------------------------------------------------------
Frank Oltmanns (2):
      clk: sunxi-ng: common: Support minimum and maximum rate
      clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI

Jernej Skrabec (1):
      clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c  | 19 +++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_common.c     | 19 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h     |  3 +++
 4 files changed, 41 insertions(+), 2 deletions(-)
