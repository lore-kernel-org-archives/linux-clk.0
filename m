Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1428943097-2768-1-git-send-email-rklein@nvidia.com>
References: <1428943097-2768-1-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 13:32:09 -0700
Message-ID: <CANLzEktaOSEFjszR6sRe4heQkp6H_eGi5aKEg8zeLCzaQMMVjQ@mail.gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix comments for structure definitions
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 13, 2015 at 9:38 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> Some fields moved from the tegra_clk_pll struct to
> the tegra_pll_params struct. Update the struct comments
> to reflect where the fields really are.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h |   74 +++++++++++++++++++++++------------------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 751a97966354..4eae99a4f32e 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -171,6 +171,30 @@ struct div_nmp {
>   * @lock_bit_idx:              Bit index for PLL lock status


By the way,

It looks like the kernel doc for this structure hasn't been updated
for some of the fields added or modified since. lock_bit_idx is
actually no longer here (now lock_mask), and the bunch added for 114
(including ext_misc_reg) aren't documented.

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
