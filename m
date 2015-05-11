Return-Path: <pdeschrijver@nvidia.com>
Date: Mon, 11 May 2015 14:50:36 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Rhyland Klein <rklein@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>, Stephen Warren
	<swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bill Huang <bilhuang@nvidia.com>
Subject: Re: [PATCH v2 16/19] clk: tegra: pll: Add Set_default logic
Message-ID: <20150511115036.GG22637@tbergstrom-lnx.Nvidia.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com>
 <1430328109-537-17-git-send-email-rklein@nvidia.com>
 <20150430101225.GU3097@tbergstrom-lnx.Nvidia.com>
 <55424ACA.9010406@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <55424ACA.9010406@nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 30, 2015 at 11:31:22AM -0400, Rhyland Klein wrote:
> On 4/30/2015 6:12 AM, Peter De Schrijver wrote:
> > On Wed, Apr 29, 2015 at 01:21:46PM -0400, Rhyland Klein wrote:
> >> From: Bill Huang <bilhuang@nvidia.com>
> >>
> >> Add logic which (if specified for a pll) can verify that a PLL is set
> >> to the proper default value and if not can set it. This can be
> >> specified per PLL as each will have different default values.
> >>
> > 
> > Why can't we just set the default values at init time?
> 
> Sorry, I did some investigation into this and wrote up a nice response
> ... and forgot to hit send ...
> 
> The reason this can't be run only once at init time is the following. In
> reality, we want to have the defined default values written as early as
> possible. Idealy, the bootloader could write these, so the kernel need
> only check, see they are right, and not touch them. However, since we
> can't rely on the bootloader to do so, the kernel needs the support to
> be able to write these default values. At init time, some pll's will be
> enabled (from bootloader) and because they are enabled (and the rest of
> the clk framework isn't done being setup yet) we can't disable them to
> write the full register values. Therefore, the set_defaults logic uses a
> 2-pass system.
> 
> first pass: Try to set defaults at init/registration time. If pll is
> disabled, this works fine. If it is enabled, then we update a subset of
> the register as a "best effort" setting of the defaults.
> 
> second pass: Should only run the first time we go through set_rate for a
> pll. If the first pass already wrote default value, then it skips this
> step. Otherwise it will go in, once the pll is disabled in the set_rate
> path, and write the full register default.
> 
> This is required because some registers need to be reset to the default
> values we have to ensure locking works correctly. Does that make sense?

Ok. I see... Should we print a warning (pr_warn()) the bootloader isn't
initializing the hw correctly if the second pass needs to write the default
values?

Thanks,

Peter.
