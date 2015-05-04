Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1430757460-9478-8-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-8-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 14:42:47 -0700
Message-ID: <CANLzEksOMYUQ9PxPFmDbHub=eW5u4c6qtduFqeGXYTu3gcOhXA@mail.gmail.com>
Subject: Re: [PATCH v4 07/20] clk: tegra: pll: Don't unconditionally set LOCK flags
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> SoC specific drivers should define the appropriate flags for each
> PLL rather than relying on the registration functions to automatically
> set flags on their behalf. This will properly allow for changes between
> SoC generations where flags might be different and allow sharing the
> same logic functions.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
