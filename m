Return-Path: <sboyd@codeaurora.org>
Date: Thu, 9 Apr 2015 08:23:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>,
	Mike Turquette <mturquette@linaro.org>,
	kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: versatile: test returned value
Message-ID: <20150409152338.GA18835@codeaurora.org>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428159570-19467-2-git-send-email-Julia.Lawall@lip6.fr>
 <CACRpkdYU+hN6gEtVzwahGz+B07dqrDzQkTZz2xikGH0dMdYX1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdYU+hN6gEtVzwahGz+B07dqrDzQkTZz2xikGH0dMdYX1Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/09, Linus Walleij wrote:
> On Sat, Apr 4, 2015 at 4:59 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> 
> > Put NULL test on the result of the previous call instead on one of its
> > arguments.  A simplified version of the semantic match that finds this
> > problem is as follows (http://coccinelle.lip6.fr/):
> >
> > // <smpl>
> > r@
> > expression *e1;
> > expression *e2;
> > identifier f;
> > statement S1,S2;
> > @@
> >
> > e1 = f(...,e2,...);
> > (
> > if (e1 == NULL || ...) S1 else S2
> > |
> > *if (e2 == NULL || ...) S1 else S2
> > )
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Yep that's a bug:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 

Thanks. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
