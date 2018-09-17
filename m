Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbeIQWCk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Sep 2018 18:02:40 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: "Spruyt, Randy" <Randy.Spruyt@christiedigital.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <BC3A5CD34524E4468CEC38A99142631601AD938581@cktexmb01.cds.int>
In-Reply-To: <BC3A5CD34524E4468CEC38A99142631601AD938581@cktexmb01.cds.int>
Message-ID: <153720207238.119890.3699299252732950681@swboyd.mtv.corp.google.com>
Subject: Re: getting a PHC reference in a kernel module?
Date: Mon, 17 Sep 2018 09:34:32 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Spruyt, Randy (2018-09-06 07:00:07)
> I'm new to kernel driver development, so I hope you bear with me on the q=
uestion. =

> =

> I'd like to timestamp an IRQ event in a kernel moudle using a PTP synchro=
nized clock (e.g. the PHC from eth0 =3D /dev/ptp0). E.g. a GPIO pin goes hi=
gh, I'd like to keep track of when this happened. Low latency is important.=
 One option is to use getnstimeofday() and have phc2sys synchronize /dev/pt=
p0 with the system=C2=A0 clock. =

> =

> This seems to work but I feel like there is a more direct way to just que=
ry the PHC clock e.g. using struct ptp_clock* and gettime64(). The question=
 is how to get this pointer, find_driver()? Or something else?
> =

> If this is the wrong way to go about this, by all means, I'm open to sugg=
estions.
> =


linux-clk is for discussion about clk hardware that is used for power
management and frequency scaling, not timekeeping hardware used for
things like PTP. Please move your discussion to the linux-kernel mailing
list and Cc the Timekeeping maintainers:

TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
M:      John Stultz <john.stultz@linaro.org>
M:      Thomas Gleixner <tglx@linutronix.de>
R:      Stephen Boyd <sboyd@codeaurora.org>
L:      linux-kernel@vger.kernel.org
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timer=
s/core
S:      Supported
F:      include/linux/clocksource.h
F:      include/linux/time.h
F:      include/linux/timex.h
F:      include/uapi/linux/time.h
F:      include/uapi/linux/timex.h
F:      kernel/time/clocksource.c
F:      kernel/time/time*.c
F:      kernel/time/alarmtimer.c
F:      kernel/time/ntp.c
F:      tools/testing/selftests/timers/
