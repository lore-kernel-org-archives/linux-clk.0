Return-Path: <mw@semihalf.com>
Return-Path: <mw@semihalf.com>
From: Marcin Wojtas <mw@semihalf.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: sebastian.hesselbarth@gmail.com,
	andrew@lunn.ch,
	jason@lakedaemon.net,
	thomas.petazzoni@free-electrons.com,
	gregory.clement@free-electrons.com,
	nadavh@marvell.com,
	alior@marvell.com,
	tn@semihalf.com,
	jaz@semihalf.com,
	Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 0/2] Armada 7k/8k CP110 system controller fixes
Date: Tue, 23 Aug 2016 08:26:47 +0200
Message-Id: <1471933609-8456-1-git-send-email-mw@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

Newly added clock driver for Marvell Armada 7k/8k CP110 HW block occurred
not to be working properly, especially when using two instances of CP110
in Armada 8k. Below tiny patchset comprise fixes for that (prevent from
using uninitialized 'flag' field and static global resources).

Any feedback would be very welcome.

Best regards,
Marcin

Marcin Wojtas (2):
  clk: mvebu: set flags in CP110 gate clock
  clk: mvebu: dynamically allocate resources in Armada CP110 system
    controller

 drivers/clk/mvebu/cp110-system-controller.c | 30 ++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

-- 
1.8.3.1
