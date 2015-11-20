Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:54361 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754664AbbKTMk0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2015 07:40:26 -0500
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>,
	<sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>,
	Andreas Ziegler <ziegler@cs.fau.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>
Subject: Re: clk: tango4: undefined CONFIG_ARCH_TANGOX
References: <20151120085039.GA2832@debian-vm>
	<564EEB0F.9000208@sigmadesigns.com>
Date: Fri, 20 Nov 2015 12:40:23 +0000
In-Reply-To: <564EEB0F.9000208@sigmadesigns.com> (Marc Gonzalez's message of
	"Fri, 20 Nov 2015 10:42:39 +0100")
Message-ID: <yw1x37w0ete0.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Marc Gonzalez <marc_gonzalez@sigmadesigns.com> writes:

> On 20/11/2015 09:50, Valentin Rothberg wrote:
>
>> your commit ed12dfc92f01 ("clk: tango4: clkgen driver for Tango4
>> platforms") has shown up in today's linux-next tree (i.e.,
>> next-20151120) adding the following build condition to the tango4 clk
>> driver:
>> 
>> drivers/clk/Makefile:45:obj-$(CONFIG_ARCH_TANGOX) += clk-tango4.o
>> 
>> However, ARCH_TANGOX is nowhere defined in Kconfig so that the driver
>> cannot be compiled at the current state.  I checked the LKML, and found
>> a bunch of patches referencing ARCH_TANGOX as well, but I could not find
>> any patch adding this option.
>> 
>> Is there a patch queued somewhere that adds ARCH_TANGOX?
>
> Hello Valentin,
>
> Platform support has not been accepted yet.
>
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/456280
>
> In fact, Kevin Hilman has pointed out that the arch should not
> be called TANGOX, because X is a wildcard.
>
> (However, several unrelated drivers have been submitted with
> TANGOX in the name. Is that a problem?)
>
> tango3 was a MIPS-based design
> tango4 is an ARM-based design (with one MIPS-based outlier).
> tango5 is an ARM-based design
>
> Although Mans is against the idea, I believe there should be one
> different clk driver for each arch.

It's essentially the same clock generator.  It should be a single
driver.

-- 
Måns Rullgård
mans@mansr.com
