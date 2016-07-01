Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Jul 2016 11:38:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Hoan Tran <hotran@apm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Duc Dang <dhdang@apm.com>, lho@apm.com
Subject: Re: [PATCH v2] clk: Add fractional scale clock support
Message-ID: <20160701183845.GD27880@codeaurora.org>
References: <1466458269-460-1-git-send-email-hotran@apm.com>
 <20160630202358.GC27880@codeaurora.org>
 <CAFHUOYxS-aZGE-W8Oaop6hgfvd6MsvJ_N+GHTYdOzQZhH7hUPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAFHUOYxS-aZGE-W8Oaop6hgfvd6MsvJ_N+GHTYdOzQZhH7hUPA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Sorry I replied offlist before. Pressed the wrong key.

On 06/30, Hoan Tran wrote:
> On Thu, Jun 30, 2016 at 1:23 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> >
> > How is this different from clk-fractional-divider.c?
> >
> 
> This is a driver which clock output is multiplied with a fixed fractional
> scale (denominator).
> A field inside a register is used to configure the multiplier.
> 
> Example: With fractional scale is 1/8.
> Freq_out = Freq_parent * multiplier * (1/8)
> 
> For fractional-divider, there are 2 fields of a register are used which
>  - A field for numerator
>  - A field for denominator
> Freq_out = Freq_parent * numerator / denominator
> 

Ok so the difference is that the denominator is a fixed value?
Perhaps that can be modeled as a clk-multiplier that is used as
the only parent of a fixed divider? Or we can add a flag to the
clk-fractional-divider code to handle this minor difference.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
