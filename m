Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 18:44:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH] clk: Don't write error code into divider register
Message-ID: <20170901014404.GV21656@codeaurora.org>
References: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
 <20170726003208.GF2146@codeaurora.org>
 <20170726082506.GC26726@tbergstrom-lnx.Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170726082506.GC26726@tbergstrom-lnx.Nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/26, Peter De Schrijver wrote:
> On Tue, Jul 25, 2017 at 05:32:08PM -0700, Stephen Boyd wrote:
> > On 07/25, Peter De Schrijver wrote:
> > > From: Alex Frid <afrid@nvidia.com>
> > > 
> > > Add a check for error returned by divider value calculation to avoid
> > > writing error code into hw register.
> > > 
> > > Signed-off-by: Alex Frid <afrid@nvidia.com>
> > > Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > > Reviewed-by: Jon Mayo <jmayo@nvidia.com>
> > > ---
> > 
> > Fixes: bca9690b9426 ("clk: divider: Make generic for usage elsewhere")
> > 
> > perhaps?
> > 
> > Also, curious how this got triggered? Presumably round_rate would
> > have failed before a set_rate call with something invalid came
> > through so that's why nobody has reported anything so far.
> > 
> 
> I don't really know. Aleks do you remember?
> 

Still wondering.

> > 	if ((s32)value < 0)
> > 
> > to see if there was an error. Sort of annoying that we've limited
> > the available space of divider_get_val() by combining the value
> > with the error code number space. We may want to not do that in
> > case people have huge dividers.
> > 
> 
> Yes. It would have been better to return the divider in a separate variable.
> There seem to be few users though, only 6.

Patches welcome.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
