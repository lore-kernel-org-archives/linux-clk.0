Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1430757460-9478-3-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-3-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 14:19:04 -0700
Message-ID: <CAL1qeaH9N0nmdhRDc0ARtBh04rooPBgfttp79shLLeJg_LWzMQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
From: Andrew Bresticker <abrestic@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Rhyland,

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> Tegra210 has significant differences in muxes for peripheral clocks.
> One of the most important changes is that pll_m isn't to be used
> as a source for peripherals. Therefore, we need to define the new
> muxes and new clocks to use those muxes for Tegra210 support.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

A couple more clocks worth adding here are HSIC_TRK (clock 209),
USB2_TRK (clock 210), and their divider in CLK_SOURCE_USB2_HSIC_TRK.

-Andrew
