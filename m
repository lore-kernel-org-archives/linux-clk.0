Return-Path: <emil@limesaudio.com>
Return-Path: <emil@limesaudio.com>
From: Emil Lundmark <emil@limesaudio.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	"Ken . Lin" <ken.lin@advantech.com>,
	Emil Lundmark <emil@limesaudio.com>
Subject: [PATCH v3 0/2] clk: imx: fix AV PLL rate setting
Date: Wed, 12 Oct 2016 12:31:39 +0200
Message-Id: <cover.1476267249.git.emil@limesaudio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

I discovered a problem when trying to set the rate of the audio PLL
(pll4_post_div) on an i.MX6Q. The rate I wanted to set was 196.608 MHz, but
the actual rate I got was 192.000570 MHz. This patch series fixes this
issue and also improves the precision of the audio/video PLLs.

Changes since v2:
- Cast result of 'parent_rate * mfn / mfd' to unsigned long instead of u32.
- Clarify how this issue was discovered in the commit message.
- Rebased on Linux 4.8.

Changes since v1:
- Use correct subsystem name in commit summary.
- Use 'Fixes:' tag to indicate bug fix.
- Revise argument for choosing the denominator register value after
  comments from Lothar Waßmann.

v2: http://lists.infradead.org/pipermail/linux-arm-kernel/2016-October/460809.html
v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2016-October/460350.html

Emil Lundmark (2):
  clk: imx: fix integer overflow in AV PLL round rate
  clk: imx: improve precision of AV PLL to 1 Hz

 drivers/clk/imx/clk-pllv3.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.7.4
