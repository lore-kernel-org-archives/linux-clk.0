Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662322611
	for <linux-clk@vger.kernel.org>; Sun,  5 May 2024 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714939546; cv=none; b=rMa3BHbEqlkLBYwM4Z/hv8j974R3MoBDHDDs6+WSStEUGkN+gb+nAY2fHh0fXBiIR0A6+ohb0U9aBR5HuzUh7fn48X7KGzayeECQHHedEoJdp3wow1DrToSDVEr9R0saJWZu/apff0RCgqKAvq59/+va3x/b5thCVayDu4pvrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714939546; c=relaxed/simple;
	bh=GJ5JcMW/liDzfCwbgDdnSL2SSSzmEMily64/xO3PlNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t1hwob/wiRiu+3HFUXj9mLLYBCw8CErrDB7SxvmkYkLXp4yXeX/UWRvwplykyN2AIxOtgOf4GxuGer0WlRDhXwrzSYmGj5bQiHjdNKk/Af+KEmMeg/iknLk9mXkMIcGLMYOS0tZzMAms9V88Y/KIAngAq2dSoMo+qF0r8H0pt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1s3i79-0007rv-5O; Sun, 05 May 2024 22:05:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.10 #1
Date: Sun, 05 May 2024 22:05:38 +0200
Message-ID: <7502061.LvFx2qVVIh@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some Rockchip clock changes for 6.10

Nothing really stands out, it's just some small changes.

Please pull.

Thanks
Heiko


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.10-rockchip-clk1

for you to fetch changes up to f513991b69885025995dcb4ca75d2ee7261e1273:

  clk: rockchip: rk3568: Add PLL rate for 724 MHz (2024-05-04 12:38:13 +0200)

----------------------------------------------------------------
A new PLL rate and missing mux on rk3568, a missing reset line on rk3588
and removal of an unused field.

----------------------------------------------------------------
Christophe JAILLET (1):
      clk: rockchip: Remove an unused field in struct rockchip_mmc_clock

David Jander (1):
      clk: rockchip: rk3568: Add missing USB480M_PHY mux

Heiko Stuebner (1):
      Merge branch 'v6.10-shared/clkids' into v6.10-clk/next

Lucas Stach (1):
      clk: rockchip: rk3568: Add PLL rate for 724 MHz

Sascha Hauer (1):
      dt-bindings: clock: rockchip: add USB480M_PHY mux

Shreeya Patel (2):
      dt-bindings: reset: Define reset id used for HDMI Receiver
      clk: rockchip: rk3588: Add reset line for HDMI Receiver

 drivers/clk/rockchip/clk-mmc-phase.c            | 1 -
 drivers/clk/rockchip/clk-rk3568.c               | 5 +++++
 drivers/clk/rockchip/rst-rk3588.c               | 1 +
 include/dt-bindings/clock/rk3568-cru.h          | 1 +
 include/dt-bindings/reset/rockchip,rk3588-cru.h | 2 ++
 5 files changed, 9 insertions(+), 1 deletion(-)



