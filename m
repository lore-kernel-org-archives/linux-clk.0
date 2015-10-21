Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, "Ray Jui" <rjui@broadcom.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <56256BA5.3090705@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, "Simran Rai" <ssimran@broadcom.com>
References: <1445035458-29340-1-git-send-email-rjui@broadcom.com>
 <1445035458-29340-2-git-send-email-rjui@broadcom.com>
 <20151019214911.GB19782@codeaurora.org> <562566C1.8080409@broadcom.com>
 <56256BA5.3090705@codeaurora.org>
Message-ID: <20151021094617.20687.61996@quantum>
Subject: Re: [PATCH] clk: iproc: Fix PLL output frequency calculation
Date: Wed, 21 Oct 2015 02:46:17 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2015-10-19 15:16:05)
> On 10/19/2015 02:55 PM, Ray Jui wrote:
> >
> >
> > On 15-10-19 02:49 PM, Stephen Boyd wrote:
> >> On 10/16, Ray Jui wrote:
> >>> From: Simran Rai <ssimran@broadcom.com>
> >>>
> >>> This patch affects the clocks that use fractional ndivider in their
> >>> PLL output frequency calculation. Instead of 2^20 divide factor, the
> >>> clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
> >>> integer shift with 2^20 factor.
> >>>
> >>> Signed-off-by: Simran Rai <ssimran@broadcom.com>
> >>> Signed-off-by: Ray Jui <rjui@broadcom.com>
> >>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> >>> ---
> >>
> >> Did you want any Fixes: tag so this goes back to stable?
> >>
> >
> > Yes, we want this fix to go back to the stable kernel.
> >
> > I will re-submit the patch with the Fixes: tag and at the same time cc
> > stable@vger.kernel.org .
> =

> Please just tell me the commit that this fixes, I can add the tag and
> apply to the right tree then.

I applied v2 of this patch and amended the commit log with:

Cc: <stable@vger.kernel.org> # v4.1+

Regards,
Mike

> =

> -- =

> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
