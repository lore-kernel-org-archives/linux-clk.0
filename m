Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 23 Feb 2017 10:06:04 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] iopoll: allow for poll_timeout to back-off
Message-ID: <20170223100604.GC6457@osadl.at>
References: <1487004724-2806-1-git-send-email-der.herr@hofr.at>
 <CAK7LNATjV39QfXJH=pfXnMF-vHmJHhSu+RyFC7BuBWqcpqZWDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNATjV39QfXJH=pfXnMF-vHmJHhSu+RyFC7BuBWqcpqZWDA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 23, 2017 at 05:29:03PM +0900, Masahiro Yamada wrote:
> Hi Nicholas,
> 
> 
> 2017-02-14 1:52 GMT+09:00 Nicholas Mc Guire <der.herr@hofr.at>:
> 
> >
> > One case in /drivers/mmc/host/sdhci-cadence.c has a timeout_us of 1 and
> > sleep_us of 0 which might actually be a bug as it means that the poll loop
> > would do a single read OP in many cases (this is non-atomic context) so it
> > would have to be robust for a single read, thus the poll_timeout might not
> > be suitable - not sure though - but thats a different problem.
> 
> Sorry, I could not understand why you thought sdhci-cadence.c seemed a bug.
> 
> The SDHCI_CDNS_HRS06_TUNE_UP is auto-cleared by the hardware.
> This will normally be done really soon (within 1us),
> but it may not be cleared if the hardware is in trouble.
> It is the intention of the code:
> 
>     readl_poll_timeout(reg, tmp, !(tmp & SDHCI_CDNS_HRS06_TUNE_UP),
>                        0, 1);
>

Im not sure my selfe but as this would need to be robust for a single read try
to be reliable I did not see the point in using a pool loop of 1 microsecond
on x86 I tried this and timeout_us of 1 will resulted in a single
read in more than 10% on the idle system and in almost 100% doing
a single read on loaded systems. So if the poll loop was introduced with
the assumption that just reading once imediately could miss the ritical
event with resonable probability then timeout_us==1 does not change that.

 
> 
> 
> 
> >  which results in min,max values for the initial iterations of:
> >       min  max
> >       0    1
> >       0    2
> >       1    4
> >       2    8
> >       4    16
> >       8    32
> >       16   64
> >       32   128
> >       ...
> 
> 
> I notice you were sending this to me, but
> please notice I am not responsible for this file
> (include/linux/iopoll.h) in any way.

I included you as your it showed up with:
scripts/get_maintainer.pl -f include/linux/iopoll.h

> 
> Please take my comments for grain of salt:
> 
> With this patch, the sleep range is doubled in each iteration.
> Let's say this routine is called with delay_us=1, timeout_us=50,
> then it slept 16 us, then 32 us.
> If it sleeps 64 us in the next iteration,
> it ends up with sleeping 112 us (=16 + 32 + 64) in total
> where we know waiting 50 us is enough.

that is right - but the assumption of poll_timeout is that the
timeout case would actually be rare and if you look at the actual
timings that one has of poll_timout routines (that are based on
usleep_range()) on loaded systems they overrun by 100s of microseconds
very frequnently. 

But you are right that in the 50us case this is not ideal - the 
focus I had was on the very long timeouts that in some cases were set
to up to 5 seconds with tight-loops (or close to timght-loops)

> So, the sleep range granularity may get bigger than
> users' intention.
> 
> Probably, waiting too long is not a problem in most cases.
> If so, what is the meaning of the argument "sleep_us" after all?

The problem really is that on idle ssytems the sleep_us argument
works ok and the overruns are not that dramatic - but on loaded
systems the sleep_us routlinely overruns significantly

usleep_range() 5000 samples - idle system
 100,200         200,200         190,200
 Min.   :188481  Min.   :201917  Min.   :197793
 1st Qu.:207062  1st Qu.:207057  1st Qu.:207051
 Median :207139  Median :207133  Median :207133
 Mean   :207254  Mean   :207233  Mean   :207244
 3rd Qu.:207341  erd Qu.:207262  3rd Qu.:207610
 Max.   :225340  Max.   :214222  Max.   :214885

CONFIG_PREEMPT_VOLUNTARY=y
usleep_range() 5000 samples - load ~ 8
 100,200         190,200          200,200
 Min.   : 107812 Min.   :  203307 Min.   :  203432
 1st Qu.: 558221 1st Qu.:  557490 1st Qu.:  510356
 Median :1123425 Median : 1121939 Median : 1123316
 Mean   :1103718 Mean   : 1100965 Mean   : 1100542
 3rd Qu.:1541986 3rd Qu.: 1531478 3rd Qu.: 1517414
 Max.   :8979183 Max.   :13765789 Max.   :12476136

CONFIG_PREEMPT=y
usleep_range() 5000 samples - load ~ 8
 100,200          190,200          200,200
 Min.   :  115321 Min.   :  203963 Min.   :  203864
 1st Qu.:  510296 1st Qu.:  451479 1st Qu.:  548131
 Median : 1148660 Median : 1062576 Median : 1145228
 Mean   : 1193449 Mean   : 1079379 Mean   : 1154728
 3rd Qu.: 1601552 3rd Qu.: 1378622 3rd Qu.: 1570742
 Max.   :12936192 Max.   :12346313 Max.   :13858732

so really small sleep_us make no sense I think - setting it to 0
tight-loop might be justified for small timeout_us (say 10us)
but long busy-wait loops are bad (and probably technically not
that sensible ither). If a busy-wait loop does not get the data/state
it wants within a few loops then busy-waiting is nonsentical and
that is why the intent of the exponential back-off solution does
a few tight-loops and then switches to sleeping delays.

It might be necessary to set it to a more fine grain stepping than
the brute-force *2 - but the principle I think would be better
than what is being done now.

and thanks for your comments !

thx!
hofrat
