Return-Path: <andy.shevchenko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
References: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Mar 2018 17:14:21 +0200
Message-ID: <CAHp75VdgU8sOQAwDZFU5biP+u6zE35fNtwuTC4F1fg_cTvJkSQ@mail.gmail.com>
Subject: Re: x86 : Kconfig : INTEL_PMC_CORE not specific enough
To: whiteheadm@acm.org, "Cox, Alan" <alan.cox@intel.com>
Cc: linux-clk@vger.kernel.org,
	Platform Driver <platform-driver-x86@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
	Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Irina Tirdea <irina.tirdea@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

+Cc: Alan (perhaps he has something to add or correct me)

On Tue, Mar 13, 2018 at 1:20 PM, tedheadster <tedheadster@gmail.com> wrote:
> Intel PMC Core and CLK API teams,
>   I am trying to build a minimal kernel config on old
> regression-testing hardware. Presently there is the following
> drivers/platform/x86/Kconfig item:
>
> config PMC_ATOM
>        def_bool y
>        depends on PCI
>        select COMMON_CLK
>
> This creates a cascade of Kconfig "select" statements and pulls in two files:
>
> drivers/clk/x86/clk-pmc-atom.c
> drivers/platform/x86/intel_pmc_core.c
>
> The Kconfig seems too general to me. Compiling for my i586 Pentium-I
> pulls in these files (I think) unnecessarily. Why does _anybody_ with
> a PCI bus need these ATOM-specific files?

Long story, but main concern here, that if you do s/ATOM/X86/ it will
be more clear since we provide as less kernels as possible to cover
all x86 architectures.

Currently we have one kernel per:
- any x86_64 case
- any i686 case
- uniprocessor i586 TSC case (Intel Quark)
- (the rest exotic cases which is probably no-one using anymore)

Your change disrupts this quite badly.

So, I think your point that you don't need it by default, and here is
another story related to the design of Intel BayTrail / CherryTrail
platforms where we have a nasty bug and we can't use the driver as a
module.

> Would this change (or something similar) make sense?

No.

> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1217,5 +1217,5 @@ endif # X86_PLATFORM_DEVICES
>
>  config PMC_ATOM
>         def_bool y
> -       depends on PCI
> +       depends on PCI && MATOM

MATOM is for really old CPUs. Mentioned BayTrail et al rather normal
x86 in that sense.

>         select COMMON_CLK

Definitely NAK by the reasons mentioned above.

-- 
With Best Regards,
Andy Shevchenko
