Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <578616AE.7010805@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 b.zolnierkie@samsung.com
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
 <146799700614.73491.6564650478987470074@resonance>
 <578616AE.7010805@samsung.com>
Message-ID: <146844721045.73491.956929587069230335@resonance>
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem CLKCON
 driver
Date: Wed, 13 Jul 2016 15:00:10 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Sylwester Nawrocki (2016-07-13 03:23:42)
> On 07/08/2016 06:56 PM, Michael Turquette wrote:
> > Quoting Sylwester Nawrocki (2016-07-08 07:15:00)
> >> > Any clock dependencies can be properly handled with deferred probing
> >> > so we can remove core_initcall and switch to a proper loadable platf=
orm
> >> > driver module.
> >> > This change has been tested on Exynos4412 Odroid U3 based board.
> >> > =

> >> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >
> > Looks good to me.
> =

> Thanks, I have added this patch to my tree, however at the moment
> I have only two patches queued there. Please feel free to apply
> this patch directly to clk-next.

Applied.

Regards,
Mike

> =

> -- =

> Regards,
> Sylwester
