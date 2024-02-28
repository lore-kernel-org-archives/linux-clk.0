Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8F2D61B
	for <linux-clk@vger.kernel.org>; Wed, 28 Feb 2024 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109204; cv=none; b=kSaohfkBpGdnVJDLXexYNZAIcNxEXud7Y4GxudPHVtWGuHNbGj1fXr027aawWg8Pj6HoLipdXPSs3ZjSuaz2qzRU9EUijtBzGzNYba6Uszsuwi2WmNZtZf0TU77IVM1hputAecP8rnfaewkW+UFkfQGaUB19VSUKNkVJXPqkGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109204; c=relaxed/simple;
	bh=2G3WDbEm4Z8W3oJpPV8afr0EGY9eG1A5cwSw98YFeI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oJ3QwrADdgn33RjOQEA9VcmjwhkhS7DgASxXQ5SOal8eD5CIlWUMkH3gefnJd1cFaOnJnahRBq8Ee70CpjcCyp0TlJleVi8W0DnDCzzRwXzEiHtysJHXG2KQ3c6NdI3tl8NM2cgYH52998Mkj9Tf1GAjQGtLAaY1Q7Fgyn/9fDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rfFNO-0007e7-0U; Wed, 28 Feb 2024 09:33:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.9 #1
Date: Wed, 28 Feb 2024 09:33:17 +0100
Message-ID: <4130821.6PsWsQAL7t@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some Rockchip clock changes for 6.9

I guess the most interesting change is the removal of the CLK_NR_CLKS
constant from the rk3588 binding. While it was nice to define the upper
limit of clocks for array-search purposes, it was noted that changing this
when adding new clocks actually breaks the ABI.

Thankfully Sebastian invested the time to find a solution to not need that
constant in the driver anymore.

That change also got the needed review by dt-maintainers and people
also checked the usage in i.e. u-boot, so it's better to do this now than
later :-) .


Please pull.

Thanks
Heiko


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-clk1

for you to fetch changes up to 1361d75503fccc0e6b3ecbcd5bb53bbdfdc52f0a:

  clk: rockchip: rk3399: Allow to set rate of clk_i2s0_frac's parent (2024-02-27 23:45:53 +0100)

----------------------------------------------------------------
New pll-rate for rk3568, i2s rate improvements for rk3399,
rk3588 syscon clock fixes and removal of overall clock-number
from the rk3588 binding header and a prerequisite for later
improvements to the rk3588 linked clocks.

----------------------------------------------------------------
Chris Morgan (1):
      clk: rockchip: rk3568: Add PLL rate for 128MHz

Heiko Stuebner (1):
      Merge branch 'v6.9-shared/clkids' into v6.9-clk/next

Ondrej Jirman (1):
      clk: rockchip: rk3399: Allow to set rate of clk_i2s0_frac's parent

Sebastian Reichel (6):
      clk: rockchip: rk3588: fix CLK_NR_CLKS usage
      dt-bindings: clock: rk3588: drop CLK_NR_CLKS
      dt-bindings: clock: rk3588: add missing PCLK_VO1GRF
      clk: rockchip: rk3588: fix pclk_vo0grf and pclk_vo1grf
      clk: rockchip: rk3588: fix indent
      clk: rockchip: rk3588: use linked clock ID for GATE_LINK

 drivers/clk/rockchip/clk-rk3399.c               |  6 +--
 drivers/clk/rockchip/clk-rk3568.c               |  1 +
 drivers/clk/rockchip/clk-rk3588.c               | 55 +++++++++++++------------
 drivers/clk/rockchip/clk.c                      | 17 ++++++++
 drivers/clk/rockchip/clk.h                      |  2 +
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  3 +-
 6 files changed, 52 insertions(+), 32 deletions(-)



