Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <555CC357.5090105@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-14-git-send-email-rklein@nvidia.com>
	<CANLzEkuqCB+wF65MrtWwnsgTDhw0T9Vae9C5sBALGDbPvwrr_w@mail.gmail.com>
	<555CC357.5090105@nvidia.com>
Date: Wed, 20 May 2015 10:26:16 -0700
Message-ID: <CANLzEksw9dDJFJRo-bTaafCr+PRAnEMYoP2ojbiKEz-Uzsw2ag@mail.gmail.com>
Subject: Re: [PATCH v5 12/21] clk: tegra: pll: Add specialized logic for T210
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

On Wed, May 20, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> No, this was intentional. tegra_clk_register_pllss isn't used on
> Tegra210, it adds its own version "register_clk_register_pllss_tegra210"
> which it uses and it doesn't need the tegra_clk_pllss_ops either. So it
> should be fine without this.


Sounds good.

Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
