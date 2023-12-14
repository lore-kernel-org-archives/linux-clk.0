Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB9692A5;
	Thu, 14 Dec 2023 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq52NFA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEFFC433C7;
	Thu, 14 Dec 2023 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702581689;
	bh=jm6nUfXARM/+3uSABtPYsvnGGVA6apuuP0n3hJprDYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=gq52NFA22AGMRg52jmM3DeGIPtBjfUhunjKrKslNXI1dHumVWnA2zQ3iNaej/5ZTu
	 y3NhCQIFXe4ft0bPkMW1AhgV13TH/jL1xd5DOE3TfzHPfPoPg4G8Q7FZolkdqiKsu0
	 A8xHpLwIzoxlE6+sjLkB+20LLvdkKE7WHWpHlp8YsSeG65MOnbb6hWDDnBYMKQzwvo
	 UiclqdxdcF5rqb1CjXlXCbAKWtLVvRfuF0U8KJwmmiCepzJHPZnbHfYu6KHhSj6Wbc
	 KDYdFvM6o3Rli/BciPDRzOCnTCqA7u9bWDckFAQm4Tf6AXIYYDCBobrgYTSTPVF0Ai
	 azHHszw6+ZeHQ==
Date: Thu, 14 Dec 2023 20:21:25 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.8
Message-ID: <ZXtVtZt30bBU77m6@archlinux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.8.

Best regards,
Jernej

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.8-1

for you to fetch changes up to 89e00444cb894a42c33ba88738eaae788b05b924:

  clk: sunxi-ng: nkm: remove redundant initialization of tmp_parent (2023-11-18 23:20:34 +0100)

----------------------------------------------------------------
- cleanup variable init in nkm module

----------------------------------------------------------------
Colin Ian King (1):
      clk: sunxi-ng: nkm: remove redundant initialization of tmp_parent

 drivers/clk/sunxi-ng/ccu_nkm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
