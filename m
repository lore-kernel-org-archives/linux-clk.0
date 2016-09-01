Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] clk: samsung: exynos5410: Use
 samsung_cmu_register_one() to simplify code
To: Chanwoo Choi <cw00.choi@samsung.com>
References: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
 <1471834185-20249-3-git-send-email-cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org,
 kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <cf7b4b6f-f156-3460-761c-2268203c7593@samsung.com>
Date: Thu, 01 Sep 2016 19:07:30 +0200
MIME-version: 1.0
In-reply-to: <1471834185-20249-3-git-send-email-cw00.choi@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/22/2016 04:49 AM, Chanwoo Choi wrote:
> This patch uses the samsung_cmu_register_one() to simplify code
> and move the pll/mux/div/gate data to initconst section.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied, thanks.
