Return-Path: <akinobu.mita@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160217212415.2278.61232@quark.deferred.io>
References: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
	<20160215230252.2278.43532@quark.deferred.io>
	<CAC5umyhFucgW2Yv73T0ePurxH4O396+OcM3oRQ-poEFYUQUdSw@mail.gmail.com>
	<20160217212415.2278.61232@quark.deferred.io>
Date: Thu, 18 Feb 2016 23:09:46 +0900
Message-ID: <CAC5umyiYhE=xGhN9yHEMfgxkdK9rdoMcVcqBwRinuFB+Whg_kQ@mail.gmail.com>
Subject: Re: [PATCH] clk: add userspace clock consumer
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-02-18 6:24 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
> Quoting Akinobu Mita (2016-02-17 05:18:41)
>> 2016-02-16 8:02 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
>> > Hello Akinobu Mita,
>> >
>> > Quoting Akinobu Mita (2016-02-15 06:40:51)
>> >> This adds userspace consumer for common clock.
>> >>
>> >> This driver is inspired from Userspace regulator consumer
>> >> (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
>> >> some classes of devices that are controlled entirely from user space.
>> >
>> > Thanks for submitting the patch. Your implementation looks OK, but I
>> > generally do not like to expose clock hardware controls to userspace
>> > (and have a NAK'd a lot of patches trying to do this in the past). It
>> > can be quite dangerous for the system to allow userspace to control
>> > clocks.
>>
>> I understand your concern.  I'll happily add the features and
>> documentation for this module to avoid misuses and abuses.
>>
>> > Can you explain your use case more? If your main concern is testing,
>>
>> I can use this for my own electrical circuit.  But mainly it's
>> useful for testing.  When I tried to add clock provider for DS3231
>> clkout, I wrote very ad hoc kernel code for testing it.  I think
>> other people also have been trying something similar.
>>
>> > should COMMON_CLK_USERSPACE_CONSUMER be hidden behind CONFIG_DEBUG_FS?
>>
>> But this driver does not use debugfs.  Instead of that, I have no
>> problem moving this driver to lib/ and add config option to
>> lib/Kconfig.debug.  (under "Kernel hacking" in menuconfig)
>
> Hiding it behind some sort of debug option sounds good to me. Taking a
> quick look through lib/Kconfig.debug, it seems that there are no other
> examples of debug options from drivers/* in there.
>
> I'm wondering what is the best way to do it? Just create a
> CONFIG_COMMON_CLK_DEBUG symbol and source drivers/clk/Kconfig.debug
> conditionally?

How about just add that to drivers/clk/Kconfig like below?

config COMMON_CLK_DEBUG
        bool "Clock driver debugging support"
        depends on DEBUG_KERNEL
        ...

config COMMON_CLK_USERSPACE_CONSUMER
        tristate "Userspace clock consumer support"
        depends on COMMON_CLK_DEBUG
        ...


We can add COMMON_CLK_DEBUG_FS for /sys/kernel/debug/clk/ if preferred.
