Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35307 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161067AbbKTIum (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2015 03:50:42 -0500
Date: Fri, 20 Nov 2015 09:50:39 +0100
From: Valentin Rothberg <valentinrothberg@gmail.com>
To: marc_gonzalez@sigmadesigns.com
Cc: sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>,
	Andreas Ziegler <ziegler@cs.fau.de>
Subject: clk: tango4: undefined CONFIG_ARCH_TANGOX
Message-ID: <20151120085039.GA2832@debian-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Marc,

your commit ed12dfc92f01 ("clk: tango4: clkgen driver for Tango4
platforms") has shown up in today's linux-next tree (i.e.,
next-20151120) adding the following build condition to the tango4 clk
driver:

drivers/clk/Makefile:45:obj-$(CONFIG_ARCH_TANGOX) += clk-tango4.o

However, ARCH_TANGOX is nowhere defined in Kconfig so that the driver
cannot be compiled at the current state.  I checked the LKML, and found
a bunch of patches referencing ARCH_TANGOX as well, but I could not find
any patch adding this option.

Is there a patch queued somewhere that adds ARCH_TANGOX?

I detected the issue with scripts/checkkconfigsymbols.py by diffing
yesterday's and today's linux-next.

Kind regards,
 Valentin
