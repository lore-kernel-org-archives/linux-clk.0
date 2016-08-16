Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 17:14:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Hoan Tran <hotran@apm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, Duc Dang <dhdang@apm.com>,
	Loc Ho <lho@apm.com>
Subject: Re: [PATCH v2] clk: Add fractional scale clock support
Message-ID: <20160816001431.GX361@codeaurora.org>
References: <1466458269-460-1-git-send-email-hotran@apm.com>
 <20160630202358.GC27880@codeaurora.org>
 <CAFHUOYxS-aZGE-W8Oaop6hgfvd6MsvJ_N+GHTYdOzQZhH7hUPA@mail.gmail.com>
 <20160701183845.GD27880@codeaurora.org>
 <CAFHUOYz82wyLPJjoG8V9QvXmF10qnQkioe9-oxUR0-aiho-Pjw@mail.gmail.com>
 <CAFHUOYw9rJe7+1kvz9gwxSZO=FucztfhdO_6vOz8kA7QsS9EyA@mail.gmail.com>
 <CAFHUOYxT0BB6dCz8xEht7MmjgBT7HQwaOKsSnF1wFfgYFwjy=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAFHUOYxT0BB6dCz8xEht7MmjgBT7HQwaOKsSnF1wFfgYFwjy=g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Sorry I was away for some time. 

On 08/08, Hoan Tran wrote:
> On Wed, Jul 20, 2016 at 11:36 AM, Hoan Tran <hotran@apm.com> wrote:
> > On Fri, Jul 1, 2016 at 5:09 PM, Hoan Tran <hotran@apm.com> wrote:
> >>
> >> Hi Stephen,
> >>
> >> On Fri, Jul 1, 2016 at 11:38 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> >> > Sorry I replied offlist before. Pressed the wrong key.
> >> >
> >> > On 06/30, Hoan Tran wrote:
> >> >> On Thu, Jun 30, 2016 at 1:23 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> >> >> >
> >> >> > How is this different from clk-fractional-divider.c?
> >> >> >
> >> >>
> >> >> This is a driver which clock output is multiplied with a fixed fractional
> >> >> scale (denominator).
> >> >> A field inside a register is used to configure the multiplier.
> >> >>
> >> >> Example: With fractional scale is 1/8.
> >> >> Freq_out = Freq_parent * multiplier * (1/8)
> >> >>
> >> >> For fractional-divider, there are 2 fields of a register are used which
> >> >>  - A field for numerator
> >> >>  - A field for denominator
> >> >> Freq_out = Freq_parent * numerator / denominator
> >> >>
> >> >
> >> > Ok so the difference is that the denominator is a fixed value?
> >>
> >> The major difference is a fixed denominator.
> >> Another difference is:
> >> In case CLK_FRACTIONAL_SCALE_INVERTED=1, the freq_out is calculated as below
> >>
> >> Freq_out = Freq_parent * (fixed_denominator - multiplier) / fixed_denominator.
> >>
> >> > Perhaps that can be modeled as a clk-multiplier that is used as
> >> > the only parent of a fixed divider?
> >>
> >> Because of CLK_FRACTIONAL_SCALE_INVERTED flag, I don't know how to
> >> model as a clk-multiplier. And how to pass the fixed denominator into
> >> a clk-multiplier.

Would it be possible to add a flag to clk-multiplier to handle
the inverted case? I haven't seen anyone else with hardware like
that though, so perhaps the implementation should just go into
the vendor specific clk driver instead of being written
as a "basic clk type".

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
