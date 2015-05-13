Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-12-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-12-git-send-email-rklein@nvidia.com>
Date: Tue, 12 May 2015 17:01:38 -0700
Message-ID: <CANLzEksWoyJ9o6EcaktfqU8X-z7Pdg_weYaovjyb_SsGRGRC9g@mail.gmail.com>
Subject: Re: [PATCH v5 10/21] clk: tegra: pll: Add logic for out-of-table
 rates for T210
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> For Tegra210, the logic to calculate out-of-table rates is different
> from previous generations. Add callbacks that can be overridden to
> allow for different ways of calculating rates. Default to
> _cal_rate when not specified.
>
> This patch also includes a new flag which is used to set which method
> of fixed_mdiv calculation is used. The new method for calculating the
> fixed divider value for M can be more accurate especially when
> fractional dividers are in play. This allows for older chipsets to use
> the existing logic and new generations to use a newer version which
> may work better for them.
>
> Based on original work by Aleksandr Frid <afrid@nvidia.com>
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> v5:
>   - Updated description to include mentioning the NEW_MDIV flag
>   - Added kerneldoc info for new members




-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
