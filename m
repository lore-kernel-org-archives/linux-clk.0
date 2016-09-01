Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>
CC: <ssantosh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>
Subject: [PATCHv2 0/3] ARM: K2G: support for TI-SCI Clocks
Date: Thu, 1 Sep 2016 15:40:32 +0300
Message-ID: <1472733635-22661-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi,

Changes compared to previous version:
- converted the driver to use xlate hw functionality instead of legacy
  xlate
- bunch of other fixes proposed by Stephen Boyd

Series still depends on https://lkml.org/lkml/2016/8/19/768, pull
request for this has been sent out so it would be possible to
pull this to clock tree also and merge this for 4.9.

Boot tested locally with Nishanth's integrated SCI branch, and seems to
be working fine.

Refer to v1 cover letter for more details if required:
https://lkml.org/lkml/2016/8/19/811

-Tero
