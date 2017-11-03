Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Nov 2017 08:16:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: tegra: Add sor1_out clock
Message-ID: <20171103151644.GT11011@codeaurora.org>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
 <20171102081648.GJ11011@codeaurora.org>
 <20171102084605.GA29341@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171102084605.GA29341@ulmo>
List-ID: <linux-clk.vger.kernel.org>

On 11/02, Thierry Reding wrote:
> On Thu, Nov 02, 2017 at 01:16:48AM -0700, Stephen Boyd wrote:
> > On 09/01, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > The sor1_src clock implemented on Tegra210 is modelled the wrong way
> > > around, which causes some issues with HDMI and DP support. This clock
> > > implementation is provided by BPMP on Tegra186, which models this in
> > > a more correct way. Since this introduces incompatibilities between
> > > the two SoC generations which we want to avoid, the Tegra210 will be
> > > fixed in subsequent patches.
> > > 
> > > This change adds sor1_out as an alias for sor1_src.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > 
> > Applied to clk-next
> 
> Hi Stephen,
> 
> sorry for not having been clear about this. This patch and the  2-4 are
> part of the pull request I sent out earlier (and for which I have an
> updated one to fix the regression I mentioned last week). I'd prefer to
> send this to you via pull request because there is a dependency on this
> from the ARM SoC tree (for a DT change).
> 

Sure I can back out the changes. Next time please indicate your
merge path/strategy in some sort of cover letter so I can ignore
changes in the review queue. Also, if you pick up a patch from
the list please send a note that you applied it to your tree so I
know to wait for a PR later.

Is the PR coming soon? I forgot about it because we were waiting
for the second one.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
