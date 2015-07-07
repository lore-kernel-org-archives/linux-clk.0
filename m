Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0069.outbound.protection.outlook.com ([65.55.169.69]:11268
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752171AbbGGEFZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 7 Jul 2015 00:05:25 -0400
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCHv2 0/6] clk: make use of of_clk_parent_fill helper function
Date: Mon, 6 Jul 2015 22:59:00 -0500
Message-ID: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Hello,

This is v2 of the patchset that makes use of of_clk_parent_fill helper function
on various platforms.

Thanks,

Dinh Nguyen (6):
  clk: at91: make use of of_clk_parent_fill helper function
  clk: qoriq: make use of of_clk_parent_fill helper function
  clk: keystone: make use of of_clk_parent_fill helper function
  clk: st: make use of of_clk_parent_fill helper function
  clk: sunxi: make use of of_clk_parent_fill helper function
  clk: ti: make use of of_clk_parent_fill helper function

 drivers/clk/at91/clk-main.c         |    7 +------
 drivers/clk/at91/clk-master.c       |    7 +------
 drivers/clk/at91/clk-programmable.c |    7 +------
 drivers/clk/at91/clk-slow.c         |   14 ++------------
 drivers/clk/at91/clk-smd.c          |    7 +------
 drivers/clk/at91/clk-usb.c          |    7 +------
 drivers/clk/clk-qoriq.c             |    5 ++---
 drivers/clk/keystone/pll.c          |    3 +--
 drivers/clk/st/clk-flexgen.c        |    6 ++----
 drivers/clk/st/clkgen-mux.c         |    7 ++-----
 drivers/clk/sunxi/clk-a20-gmac.c    |    4 +---
 drivers/clk/sunxi/clk-factors.c     |    4 +---
 drivers/clk/sunxi/clk-sun6i-ar100.c |    3 +--
 drivers/clk/sunxi/clk-sunxi.c       |   10 ++--------
 drivers/clk/ti/apll.c               |    4 +---
 drivers/clk/ti/composite.c          |    4 +---
 drivers/clk/ti/dpll.c               |    4 +---
 drivers/clk/ti/fapll.c              |    3 +--
 drivers/clk/ti/mux.c                |    4 +---
 19 files changed, 24 insertions(+), 86 deletions(-)

-- 
1.7.9.5

