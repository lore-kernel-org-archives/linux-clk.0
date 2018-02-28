Return-Path: <shawnguo@kernel.org>
Date: Wed, 28 Feb 2018 08:45:34 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-imx@nxp.com,
	Fabio Estevam <fabio.estevam@nxp.com>
Subject: [GIT PULL] i.MX clock fixes for 4.16
Message-ID: <20180228004533.GY3217@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Michael,

Please consider to take this into 4.16 as fix.  There are details about
this pull request in tag description.  Thanks.

Shawn


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-fixes-4.16

for you to fetch changes up to a275b315334dea3c2151094765387ede421aac92:

  clk: imx51-imx53: Fix UART4/5 registration on i.MX50 and i.MX53 (2018-02-22 11:27:30 +0800)

----------------------------------------------------------------
i.MX clock fixes for 4.16:
 - Update i.MX5 clock driver to register UART4/5 clock only on i.MX50
   and i.MX53.  It fixes a kernel warning seen on i.MX53, caused by
   commit 59dc3d8c8673 ("clk: imx51: uart4, uart5 gates only exist on
   imx50, imx53").

----------------------------------------------------------------
Fabio Estevam (1):
      clk: imx51-imx53: Fix UART4/5 registration on i.MX50 and i.MX53

 drivers/clk/imx/clk-imx51-imx53.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)
