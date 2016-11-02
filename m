Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:38:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	kernel-janitors@vger.kernel.org,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/15] clk: tegra: dfll: improve function-level
 documentation
Message-ID: <20161102003852.GN16026@codeaurora.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
 <1475351192-27079-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475351192-27079-13-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/01, Julia Lawall wrote:
> Adjust variables to correspond to the names used in the parameter list of
> the function.  Move the struct device * variable up to the place where it
> appears in the parameter list.
> 
> Issue detected using Coccinelle (http://coccinelle.lip6.fr/)
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
