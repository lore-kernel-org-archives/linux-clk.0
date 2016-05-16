Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:57225 "EHLO
	e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754293AbcEPSsy (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2016 14:48:54 -0400
Received: from localhost
	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-clk@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 16 May 2016 14:48:53 -0400
Date: Mon, 16 May 2016 11:48:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: tony@atomide.com, mingo@kernel.org, linux@roeck-us.net,
	rostedt@goodmis.org
Subject: [PATCH omap v2 0/6] Fix OMAP uses of RCU from idle loop
Message-ID: <20160516184844.GA20144@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello!

The following series fixes a number of uses of RCU from the idle loop.
These are all due to tracing, so the fix is simply to append _rcuidle
to the event-tracing call.

Changes since v1: Fix commit-log subjects and add maintainers on CC.

							Thanx, Paul

------------------------------------------------------------------------

 arch/arm/kernel/smp.c             |    2 +-
 arch/arm/mach-omap2/powerdomain.c |    9 +++++----
 drivers/base/power/runtime.c      |   14 +++++++-------
 drivers/clk/clk.c                 |    8 ++++----
 4 files changed, 17 insertions(+), 16 deletions(-)

