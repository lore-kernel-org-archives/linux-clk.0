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
Subject: [PATCH v3 0/3] Armada 7k/8k CP110 system controller fixes
Date: Wed, 21 Sep 2016 11:05:56 +0200
Message-Id: <1474448759-24482-1-git-send-email-mw@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

Here is the third version of the patchset adding fixes to CP110
system controller clock driver. Comparing to v2, the only change
is return value on alloc failures.

Any feedback would be very welcome.

Best regards,
Marcin

Changelog:
v3 -> v2
* return -ENOMEM on alloc failures

v1 -> v2
* replace setting CLK_IS_BASIC flag with clearing init structure fields
  with memset
* minor improvements of allocation and error checking
* add migration to clk_hw


Marcin Wojtas (3):
  clk: mvebu: fix setting unwanted flags in CP110 gate clock
  clk: mvebu: dynamically allocate resources in Armada CP110 system
    controller
  clk: mvebu: migrate CP110 system controller to clk_hw API and
    registration

 drivers/clk/mvebu/cp110-system-controller.c | 155 +++++++++++++++-------------
 1 file changed, 81 insertions(+), 74 deletions(-)

-- 
1.8.3.1
