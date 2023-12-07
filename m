Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653EF1713
	for <linux-clk@vger.kernel.org>; Thu,  7 Dec 2023 12:46:40 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rBLGY-000639-88; Thu, 07 Dec 2023 21:46:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock fixes for 6.7
Date: Thu, 07 Dec 2023 21:46:37 +0100
Message-ID: <5734430.DvuYhMxLoT@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

for a change, this time I have some fixes that would be really
good to have in the current 6.7 cycle.

Please pull.

Thanks
Heiko

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.7-rockchip-clkfixes1

for you to fetch changes up to 99fe9ee56bd2f7358f1bc72551c2f3a6bbddf80a:

  clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name (2023-11-28 10:30:59 +0100)

----------------------------------------------------------------
Fixes for a wrong clockname, a wrong clock-parent, a wrong clock-gate
and finally one new PLL rate for the rk3568 to fix display artifacts
on a handheld devices based on that soc.

----------------------------------------------------------------
Alex Bee (1):
      clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name

Chris Morgan (1):
      clk: rockchip: rk3568: Add PLL rate for 292.5MHz

Finley Xiao (1):
      clk: rockchip: rk3128: Fix aclk_peri_src's parent

Weihao Li (1):
      clk: rockchip: rk3128: Fix HCLK_OTG gate register

 drivers/clk/rockchip/clk-rk3128.c | 24 +++++++++---------------
 drivers/clk/rockchip/clk-rk3568.c |  1 +
 2 files changed, 10 insertions(+), 15 deletions(-)



