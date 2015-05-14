Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-20-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-20-git-send-email-rklein@nvidia.com>
Date: Wed, 13 May 2015 17:29:28 -0700
Message-ID: <CANLzEktz7Dqd9nRkGMK-iv--wo_LQM0wen8Qsq+jrvG96oSsfA@mail.gmail.com>
Subject: Re: [PATCH v5 18/21] clk: tegra: pll: Fix _pll_ramp_calc_pll logic
 and _calc_dynamic_ramp_rate
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

On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> This removes the conversion from pdiv to hw, which is already taken
> care of by _get_table_rate before this code is run. This avoids
> incorrectly converting pdiv to hw twice and getting the wrong hw value.
>
> Also set the input_rate in the freq cfg in _calc_dynamic_ramp_rate while
> setting all the other fields.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>


Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
