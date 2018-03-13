Return-Path: <tedheadster@gmail.com>
MIME-Version: 1.0
Reply-To: whiteheadm@acm.org
In-Reply-To: <CAHp75VdgU8sOQAwDZFU5biP+u6zE35fNtwuTC4F1fg_cTvJkSQ@mail.gmail.com>
References: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
 <CAHp75VdgU8sOQAwDZFU5biP+u6zE35fNtwuTC4F1fg_cTvJkSQ@mail.gmail.com>
From: tedheadster <tedheadster@gmail.com>
Date: Tue, 13 Mar 2018 13:13:55 -0400
Message-ID: <CAP8WD_ZhUB1v30MHqkWq782WBDEXk+CS4+y1zC60_-tnDyK2nw@mail.gmail.com>
Subject: Re: x86 : Kconfig : INTEL_PMC_CORE not specific enough
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Cox, Alan" <alan.cox@intel.com>, linux-clk@vger.kernel.org,
	Platform Driver <platform-driver-x86@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
	Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Irina Tirdea <irina.tirdea@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

> Long story, but main concern here, that if you do s/ATOM/X86/ it will
> be more clear since we provide as less kernels as possible to cover
> all x86 architectures.
>
> Currently we have one kernel per:
> - any x86_64 case
> - any i686 case
> - uniprocessor i586 TSC case (Intel Quark)
> - (the rest exotic cases which is probably no-one using anymore)
>
> Your change disrupts this quite badly.

This simplifies your situation, but it forces everybody else to
include extra code they will never use.

>
> So, I think your point that you don't need it by default, and here is
> another story related to the design of Intel BayTrail / CherryTrail
> platforms where we have a nasty bug and we can't use the driver as a
> module.
>

Please explain the history so we can understand.


In more detail, here are the Kconfig dependencies:

- Symbol: PMC_ATOM [=y]
- Depends on: X86 [=y] && PCI [=y]
- Selects: COMMON_CLK [=y]

Symbol: COMMON_CLK [=y]
- Selected by:  PMC_ATOM [=y] && X86 [=y] && PCI [=y]
- Selects: HAVE_CLK_PREPARE [=y] && CLKDEV_LOOKUP [=y] && SRCU [=y] &&
RATIONAL [=y]

So having _any_ X86 and PCI pulls in these four files:

drivers/clk/x86/clk-pmc-atom.c
drivers/platform/x86/pmc_atom.c (you are right, I cut-and-pasted the
wrong file earlier)
drivers/clk/clkdev.c
lib/rational.c


>> Would this change (or something similar) make sense?
>
> No.
>

Okay, my novice solution isn't the right way. There must be an elegant
way to leave this configured in by default (what you want), and still
be able to turn it off if you desire (what I want).


> MATOM is for really old CPUs. Mentioned BayTrail et al rather normal
> x86 in that sense.
>
>>         select COMMON_CLK
>
> Definitely NAK by the reasons mentioned above.
>


- Matthew
