Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Saravanan Sekar <sravanhome@gmail.com>, afaerber@suse.de,
 manivannan.sadhasivam@linaro.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180719090649.12460-2-sravanhome@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com,
 sravanhome@gmail.com, support@cubietech.com, catalin.marinas@arm.com,
 mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org,
 thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pn@denx.de, linux-clk@vger.kernel.org,
 jeff.chen@actions-semi.com, mp-cs@actions-semi.com
References: <20180719090649.12460-1-sravanhome@gmail.com>
 <20180719090649.12460-2-sravanhome@gmail.com>
Message-ID: <153256212945.48062.14143557798405781571@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v7 1/5] clk: actions: Add missing REGMAP_MMIO dependency
Date: Wed, 25 Jul 2018 16:42:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Saravanan Sekar (2018-07-19 02:06:45)
> Add REGMAP_MMIO as dependency to avoid undefined
> reference to regmap symbols.
> =

> Fixes: d85d20053e19 ("clk: actions: Add S900 SoC clock support")
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
