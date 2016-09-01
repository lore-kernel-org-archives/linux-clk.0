Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/3] clk: samsung: exynos5420: Add clocks for CMU_CDREX
 domain
To: Chanwoo Choi <cw00.choi@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
 <1472108238-24309-3-git-send-email-cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org,
 kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <5c3c5a13-ca2b-272d-e137-d7eaaffaafac@samsung.com>
Date: Thu, 01 Sep 2016 19:32:18 +0200
MIME-version: 1.0
In-reply-to: <1472108238-24309-3-git-send-email-cw00.choi@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/25/2016 08:57 AM, Chanwoo Choi wrote:
> This patch adds the mux/divider clocks for CMU_CDREX (DRAM Express
> Controller) which generates the clocks for DRAM and NoC (Network on Chip) bus
> clock. But, there is differnet source of MUX_MX_MSPLL_CCORE between exynos5420
> and exynos5422. So, each MUX_MX_MSPLL_CCORE uses the different parent source
> group.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied, thanks,
