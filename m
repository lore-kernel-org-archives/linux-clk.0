Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail1.bemta8.messagelabs.com ([216.82.243.197]:58523 "EHLO
	mail1.bemta8.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934085AbbKTJmq (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2015 04:42:46 -0500
Subject: Re: clk: tango4: undefined CONFIG_ARCH_TANGOX
To: Valentin Rothberg <valentinrothberg@gmail.com>
CC: <sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>,
	Andreas Ziegler <ziegler@cs.fau.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>
References: <20151120085039.GA2832@debian-vm>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <564EEB0F.9000208@sigmadesigns.com>
Date: Fri, 20 Nov 2015 10:42:39 +0100
MIME-Version: 1.0
In-Reply-To: <20151120085039.GA2832@debian-vm>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 20/11/2015 09:50, Valentin Rothberg wrote:

> your commit ed12dfc92f01 ("clk: tango4: clkgen driver for Tango4
> platforms") has shown up in today's linux-next tree (i.e.,
> next-20151120) adding the following build condition to the tango4 clk
> driver:
> 
> drivers/clk/Makefile:45:obj-$(CONFIG_ARCH_TANGOX) += clk-tango4.o
> 
> However, ARCH_TANGOX is nowhere defined in Kconfig so that the driver
> cannot be compiled at the current state.  I checked the LKML, and found
> a bunch of patches referencing ARCH_TANGOX as well, but I could not find
> any patch adding this option.
> 
> Is there a patch queued somewhere that adds ARCH_TANGOX?

Hello Valentin,

Platform support has not been accepted yet.

http://thread.gmane.org/gmane.linux.ports.arm.kernel/456280

In fact, Kevin Hilman has pointed out that the arch should not
be called TANGOX, because X is a wildcard.

(However, several unrelated drivers have been submitted with
TANGOX in the name. Is that a problem?)

tango3 was a MIPS-based design
tango4 is an ARM-based design (with one MIPS-based outlier).
tango5 is an ARM-based design

Although Mans is against the idea, I believe there should be one
different clk driver for each arch.

I'm not sure how to handle situations where there's
A) a separate driver for 3,4,5
B) a   single driver for 3,4,5
C) one driver for 2 arches, another driver for the other arch

Regards.

