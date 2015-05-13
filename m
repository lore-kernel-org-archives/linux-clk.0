Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-15-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-15-git-send-email-rklein@nvidia.com>
Date: Wed, 13 May 2015 15:04:04 -0700
Message-ID: <CANLzEkuC7yDKEHPKC1oOF9ty=pBJ7Ry0_y7mmoymJX7dOpYJfQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/21] clk: tegra: pll: Add support for PLLMB for T210
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
> Tegra210 SoC's have 2 PLLS for memory usage. Add plumbing to register
> and handle PLLMB.
>
> PLLMB is used to allow switching between 2 PLLM's without having to use
> and intermediate backup PLL, as we need to lock the PLL before we can
> switch to it.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
