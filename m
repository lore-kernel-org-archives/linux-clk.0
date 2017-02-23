Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1487004724-2806-1-git-send-email-der.herr@hofr.at>
References: <1487004724-2806-1-git-send-email-der.herr@hofr.at>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Feb 2017 17:29:03 +0900
Message-ID: <CAK7LNATjV39QfXJH=pfXnMF-vHmJHhSu+RyFC7BuBWqcpqZWDA@mail.gmail.com>
Subject: Re: [PATCH RFC] iopoll: allow for poll_timeout to back-off
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Nicholas,


2017-02-14 1:52 GMT+09:00 Nicholas Mc Guire <der.herr@hofr.at>:

>
> One case in /drivers/mmc/host/sdhci-cadence.c has a timeout_us of 1 and
> sleep_us of 0 which might actually be a bug as it means that the poll loop
> would do a single read OP in many cases (this is non-atomic context) so it
> would have to be robust for a single read, thus the poll_timeout might not
> be suitable - not sure though - but thats a different problem.

Sorry, I could not understand why you thought sdhci-cadence.c seemed a bug.

The SDHCI_CDNS_HRS06_TUNE_UP is auto-cleared by the hardware.
This will normally be done really soon (within 1us),
but it may not be cleared if the hardware is in trouble.
It is the intention of the code:

    readl_poll_timeout(reg, tmp, !(tmp & SDHCI_CDNS_HRS06_TUNE_UP),
                       0, 1);




>  which results in min,max values for the initial iterations of:
>       min  max
>       0    1
>       0    2
>       1    4
>       2    8
>       4    16
>       8    32
>       16   64
>       32   128
>       ...


I notice you were sending this to me, but
please notice I am not responsible for this file
(include/linux/iopoll.h) in any way.

Please take my comments for grain of salt:

With this patch, the sleep range is doubled in each iteration.
Let's say this routine is called with delay_us=1, timeout_us=50,
then it slept 16 us, then 32 us.
If it sleeps 64 us in the next iteration,
it ends up with sleeping 112 us (=16 + 32 + 64) in total
where we know waiting 50 us is enough.
So, the sleep range granularity may get bigger than
users' intention.

Probably, waiting too long is not a problem in most cases.
If so, what is the meaning of the argument "sleep_us" after all?




-- 
Best Regards
Masahiro Yamada
