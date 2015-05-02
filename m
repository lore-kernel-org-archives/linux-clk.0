Return-Path: <jilin@nvidia.com>
From: Jim Lin <jilin@nvidia.com>
To: Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver
	<pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>, Stephen Warren
	<swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 12/20] clk: tegra: pll: Add specialized logic for T210
Date: Sat, 2 May 2015 03:12:27 +0000
Message-ID: <3e078ce64eff4ac992900523b1b67f19@HKMAIL103.nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
 <1430506447-29074-13-git-send-email-rklein@nvidia.com>
In-Reply-To: <1430506447-29074-13-git-send-email-rklein@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


> +static void clk_plle_tegra210_is_enabled(struct struct clk_hw *hw) {
Returned type is "int" instead of "void".
Also one "struct" only for "clk_hw *hw"?

> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +	u32 val;
> +
> +	val =3D pll_readl_base(pll);
> +
> +	return val & PLLE_BASE_ENABLE ? 1 : 0; }
> +
--nvpublic
