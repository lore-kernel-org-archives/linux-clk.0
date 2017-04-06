Return-Path: <Alexey_Firago@mentor.com>
From: Alexey Firago <alexey_firago@mentor.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<marek.vasut@gmail.com>, <geert@linux-m68k.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v3 0/3] clk: Add support for IDT 5P49V5935
Date: Thu, 6 Apr 2017 12:15:27 +0300
Message-ID: <1491470130-6655-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

This series adds support for IDT VersaClock 5P49V5935 programmable clock
generator to the existing clk-versaclock5 driver.

Patches were verified on Avnet UltraZed-EG board with IO Carrier Card.

Changes in V2:
- Introduce vc5_chip_info structure describing chip features
- Set vc5_chip_info for the supported chips using clk_vc5_of_match[].data
- Add 5P49V5935 support using vc5_chip_info approach
- Fix idx comparison in vc5_of_clk_get ('>' to '>=')

Changes in V3:
- Change type of clk_fod_cnt and clk_out_cnt to unsigned int
- Add missed 'const' to vc5_chip_info instance declaration
- Use of_device_get_match_data() to initialize vc5_chip_info on probe 

Alexey Firago (3):
  clk: vc5: Add structure to describe particular chip features
  clk: vc5: Add bindings for IDT VersaClock 5P49V5935
  clk: vc5: Add support for IDT VersaClock 5P49V5935

 .../devicetree/bindings/clock/idt,versaclock5.txt  | 16 ++++-
 drivers/clk/clk-versaclock5.c                      | 76 +++++++++++++++++-----
 2 files changed, 71 insertions(+), 21 deletions(-)

-- 
2.7.4
