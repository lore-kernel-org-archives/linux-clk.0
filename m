Return-Path: <akinobu.mita@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160215230252.2278.43532@quark.deferred.io>
References: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
	<20160215230252.2278.43532@quark.deferred.io>
Date: Wed, 17 Feb 2016 22:18:41 +0900
Message-ID: <CAC5umyhFucgW2Yv73T0ePurxH4O396+OcM3oRQ-poEFYUQUdSw@mail.gmail.com>
Subject: Re: [PATCH] clk: add userspace clock consumer
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-02-16 8:02 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
> Hello Akinobu Mita,
>
> Quoting Akinobu Mita (2016-02-15 06:40:51)
>> This adds userspace consumer for common clock.
>>
>> This driver is inspired from Userspace regulator consumer
>> (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
>> some classes of devices that are controlled entirely from user space.
>
> Thanks for submitting the patch. Your implementation looks OK, but I
> generally do not like to expose clock hardware controls to userspace
> (and have a NAK'd a lot of patches trying to do this in the past). It
> can be quite dangerous for the system to allow userspace to control
> clocks.

I understand your concern.  I'll happily add the features and
documentation for this module to avoid misuses and abuses.

> Can you explain your use case more? If your main concern is testing,

I can use this for my own electrical circuit.  But mainly it's
useful for testing.  When I tried to add clock provider for DS3231
clkout, I wrote very ad hoc kernel code for testing it.  I think
other people also have been trying something similar.

> should COMMON_CLK_USERSPACE_CONSUMER be hidden behind CONFIG_DEBUG_FS?

But this driver does not use debugfs.  Instead of that, I have no
problem moving this driver to lib/ and add config option to
lib/Kconfig.debug.  (under "Kernel hacking" in menuconfig)

> Have you looked at the per-provider DEBUGFS hooks? See commit
> fb2b3c9f6857, "clk: define and export clk_debugs_add_file".

I think it is useful for providing device specific debug features.
But this userspace consumer only provides generic feature for most
clock provider and allows controlling the devices specified in
the device tree.
