Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-11-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-11-git-send-email-rklein@nvidia.com>
Date: Mon, 18 May 2015 15:35:14 -0700
Message-ID: <CANLzEkuPGQTDrqe4R2_s3ZedLCT-deQudOFo6y1_sYZpgpNhcQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/21] clk: tegra: pll: Add logic for handling SDM data
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
> This adds logic for taking SDM_DIN (Sigma Delta Modulator) setting into
> the equation to calculate the effective N value for PLL which supports
> fractional divider.
>
> The effective N = NDIV + 1/2 + SDM_DIN/2^13, where NDIV is the integer
> feedback divider.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks for making the suggested changes.
> ---
> v5:
>   - made use of sdm_en_mask when possible to clean up logic
>   - added kerneldoc info for new struct params
>   - Added info about SDM near sdm_set_data
>   - rewrote check in sdm_set_data to make it clearer




-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
