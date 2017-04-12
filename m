Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Apr 2017 09:59:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Colin King <colin.king@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	Konstantin Porotchkin <kostap@marvell.com>,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: apn806: fix spelling mistake: "mising" -> "missing"
Message-ID: <20170412165936.GQ7065@codeaurora.org>
References: <20170411133743.21073-1-colin.king@canonical.com>
 <877f2qgdzh.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <877f2qgdzh.fsf@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Gregory CLEMENT wrote:
> Hi Colin,
>  
>  On mar., avril 11 2017, Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > trivial fix to spelling mistake in dev_warn message
> >
> > Fixes: f109ca864414dc ("clk: apn806: Turn the eMMC clock as optional for dts backwards compatible")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> 
> The intial patch was merged through the mmc subsystem while it modifies
> a clk driver. So I would suggest either Ulf applying it or waiting for
> v4.12-rc1 to apply the patch through the clk subsystem.
> 

In case Ulf wants to take it now

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
