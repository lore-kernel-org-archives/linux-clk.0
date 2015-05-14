Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-23-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-23-git-send-email-rklein@nvidia.com>
Date: Thu, 14 May 2015 13:02:56 -0700
Message-ID: <CANLzEkuDOZQKK4OGBP_z1eHArXC-du0hHLh9Tnojvmd-SzsZwg@mail.gmail.com>
Subject: Re: [PATCH v5 21/21] clk: tegra: pll: Fix issues with rates for VCO PLLs
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>
> Without this change clk_get_rate would return the final output
> rather than the VCO output as it would factor in the pdiv when
> it shouldn't. This will cause problems for all dividers in the
> subtree of the VCO PLL.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
