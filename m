Return-Path: <Alexey_Firago@mentor.com>
From: Alexey Firago <alexey_firago@mentor.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<marek.vasut@gmail.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH 0/2] clk: Add support for IDT 5P49V5935
Date: Tue, 4 Apr 2017 16:16:26 +0300
Message-ID: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

This series adds support for IDT VersaClock 5P49V5935 programmable clock
generator to the existing clk-versaclock5 driver.

Patches were verified on Avnet UltraZed-EG board with IO Carrier Card. 

Alexey Firago (2):
  clk: vc5: Add bindings for IDT VersaClock 5P49V5935
  clk: vc5: Add support for IDT VersaClock 5P49V5935

 .../devicetree/bindings/clock/idt,versaclock5.txt  | 16 +++++--
 drivers/clk/clk-versaclock5.c                      | 50 +++++++++++++++++-----
 2 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.7.4
