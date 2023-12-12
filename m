Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA50AD
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 13:05:01 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rD9w2-0006qK-SQ; Tue, 12 Dec 2023 22:04:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.8 #1
Date: Tue, 12 Dec 2023 22:04:58 +0100
Message-ID: <2913962.e9J7NaK4W3@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some small Rockchip stuff.

Please pull.

Thanks
Heiko


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-clk1

for you to fetch changes up to 721bf080f249ab2adcc4337abe164230bfb8594f:

  clk: rockchip: rk3568: Mark pclk_usb as critical (2023-12-05 10:45:55 +0100)

----------------------------------------------------------------
Two new pll rates and an additional critical clock on rk3568.

----------------------------------------------------------------
Chris Morgan (3):
      clk: rockchip: rk3568: Add PLL rate for 115.2MHz
      clk: rockchip: rk3568: Add PLL rate for 126.4MHz
      clk: rockchip: rk3568: Mark pclk_usb as critical

 drivers/clk/rockchip/clk-rk3568.c | 3 +++
 1 file changed, 3 insertions(+)



