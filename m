Return-Path: <pdeschrijver@nvidia.com>
Date: Thu, 4 May 2017 10:42:26 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: fix SS control on PLL enable/disable
Message-ID: <20170504074226.GR30730@tbergstrom-lnx.Nvidia.com>
References: <1492691989-30539-1-git-send-email-pdeschrijver@nvidia.com>
 <20170422023848.GJ7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20170422023848.GJ7065@codeaurora.org>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 21, 2017 at 07:38:48PM -0700, Stephen Boyd wrote:
> On 04/20, Peter De Schrijver wrote:
> > PLL SS was only controlled when setting the PLL rate, not when the PLL
> > itself is enabled or disabled. This means that if the PLL rate was set
> > before the PLL is enabled, SS will not be enabled, even when configured.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Fixes tag? Or this isn't a problem right now, just future fix?
> 

This isn't a problem right now, at least noone complained about it.

Peter.
