Return-Path: <Alexey_Firago@mentor.com>
From: Alexey Firago <alexey_firago@mentor.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<marek.vasut@gmail.com>, <geert@linux-m68k.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v2 0/3] clk: Add support for IDT 5P49V5935
Date: Wed, 5 Apr 2017 14:46:56 +0300
Message-ID: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
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

Alexey Firago (3):
  clk: vc5: Add structure to describe particular chip features
  clk: vc5: Add bindings for IDT VersaClock 5P49V5935
  clk: vc5: Add support for IDT VersaClock 5P49V5935

 .../devicetree/bindings/clock/idt,versaclock5.txt  | 16 ++++-
 drivers/clk/clk-versaclock5.c                      | 80 +++++++++++++++++-----
 2 files changed, 77 insertions(+), 19 deletions(-)

-- 
2.7.4
