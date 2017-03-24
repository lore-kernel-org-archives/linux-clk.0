Return-Path: <pdeschrijver@nvidia.com>
Date: Fri, 24 Mar 2017 11:25:46 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Stephen
 Warren" <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] clk: tegra: don't warn for PLL defaults
 unnecessarily
Message-ID: <20170324092546.GA22128@tbergstrom-lnx.Nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
 <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
 <d6435129-4c67-1126-429d-ffef52d0b2d4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <d6435129-4c67-1126-429d-ffef52d0b2d4@nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 23, 2017 at 02:37:23PM +0000, Jon Hunter wrote:
> Hi Peter,
> 
> On 23/02/17 10:44, Peter De Schrijver wrote:
> > If the PLL is on, only warn if the defaults are not yet set. Otherwise be
> > silent.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> This patch is breaking boot for Tegra210 Smaug on -next [0]. Reverting
> this on top of -next allows the board to boot again. I have not had
> chance to dig into this any further yet, but can unless you have some
> thoughts.

My guess would be pllm. Maybe the bootloader on Smaug switches to pllm for
a higher emc frequency? On jetson cboot doesn't do that, so at least that
could be a difference.

Peter.
