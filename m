Return-Path: <jonmason@broadcom.com>
From: Jon Mason <jonmason@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens
	<hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH v3 0/10] clk: iproc: add support for BCM NS, NSP, and NS2 
Date: Thu, 15 Oct 2015 15:48:23 -0400
Message-ID: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: jonmason@broadcom.com
List-ID: <linux-clk.vger.kernel.org>


v3 - Added a patch to fix cygnus clk link failures, and added back the
DT documentation patches that were removed from v2.

v2 - Added a patch to change the Cygnus clk macros to uppercase,
removed the device tree changes from the series (will send out those as
an RFC), and other minor changes that Stephen Boyd requested.

This patch series adds support for the Broadcom Northstar, Northstar
Plus, and Northstar 2 clocks.  Some slight modifications were necessary
to clk-iproc-pll to get Northstar and Northstar Plus working, due to
differences in register layout.  This is the reason why the first patch
is necessary.  Some more modifications were necessary to clk-iproc-pll
to get Northstar 2 working, due to differences in register layout (and
resulting fallout in Cygnus and NSP).  This is the reason why the sixth
and seventh patches are necessary.  The fifth patch is clean-up to
prevent accidentally forgetting to adjust for the base write errata
(which happened a few times, but was caught in internal review).

Thanks,
Jon
