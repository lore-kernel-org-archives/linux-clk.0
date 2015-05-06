Return-Path: <sboyd@codeaurora.org>
Date: Tue, 5 May 2015 22:56:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 0/8] clk: Minor cleanups
Message-ID: <20150506055653.GF10871@codeaurora.org>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> Changes since v1
> ================
> 1. Rebase on next-20150427 and Sascha Hauer's:
>    clk: make strings in parent name arrays const [1]
> 2. Add patch "clk: tegra: Fix inconsistent indenting".
> 
> 
> Description and dependencies
> ============================
> Small cleanups for different clock drivers.
> 
> The first three patches are independent.
> 
> Rest of the patches (these related to constifying parent names,
> including the change for MIPS) depend on the "clk: make strings in
> parent name arrays const" from Sascha Hauer [1].
> 
> 
> Tested on Arndale Octa (Exynos5420) and Trats2 (Exynos4412). Other
> drivers (and MIPS related) only compile tested plus some static
> checkers.
> 
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg413763.html
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (8):
>   clk: rockchip: Staticize file-scope declarations
>   clk: exynos: Staticize file-scope declarations
>   clk: tegra: Fix inconsistent indenting
>   clk: tegra: Fix duplicate const for parent names
>   clk: cdce706: Constify parent names in clock init data
>   clk: sirf: Constify parent names in clock init data
>   clk: ls1x: Fix duplicate const for parent names
>   MIPS: Alchemy: Remove unneeded cast removing const

Applied 1,2,5,6,7 to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
