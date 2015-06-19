Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:37499 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753719AbbFSNww (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2015 09:52:52 -0400
Date: Fri, 19 Jun 2015 15:52:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Subject: [PULL] clk: at91: fixes for 4.1
Message-ID: <20150619155246.18af1068@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

As you suggested, here is a PR including several fixes for the at91 clk
drivers. BTW, thanks for accepting to take this PR so late in the release
cycle.

Best Regards,

Boris

The following changes since commit 03bc10ab5b0f9b8f81bffbe6e40c944f9d3dbcc5:

  clk: check ->determine/round_rate() return value in clk_calc_new_rates (2015-04-12 21:09:49 -0700)

are available in the git repository at:

  https://github.com/bbrezillon/linux-at91.git ccf/atmel-fixes-for-4.1

for you to fetch changes up to 28df9c2fb6f896179fcffd5a3f5a86e2d1dff0a5:

  clk: at91: fix h32mx prototype inclusion in pmc header (2015-06-19 15:48:34 +0200)

----------------------------------------------------------------
Boris Brezillon (2):
      clk: at91: pll: fix input range validity check
      clk: at91: fix PERIPHERAL_MAX_SHIFT definition

Nicolas Ferre (2):
      clk: at91: trivial: typo in peripheral clock description
      clk: at91: fix h32mx prototype inclusion in pmc header

 Documentation/devicetree/bindings/clock/at91-clock.txt |  2 +-
 drivers/clk/at91/clk-peripheral.c                      |  8 ++++----
 drivers/clk/at91/clk-pll.c                             | 12 ++++++++++--
 drivers/clk/at91/pmc.h                                 |  2 +-
 4 files changed, 16 insertions(+), 8 deletions(-)



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-clk" in
