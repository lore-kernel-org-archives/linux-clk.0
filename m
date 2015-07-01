Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-id: <55947EA9.60204@samsung.com>
Date: Thu, 02 Jul 2015 08:58:33 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Chanwoo Choi <cw00.choi@samsung.com>, s.nawrocki@samsung.com,
	tomasz.figa@gmail.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, kgene@kernel.org
Cc: thomas.ab@samsung.com, b.zolnierkie@samsung.com,
	kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] ARM: exynos: Add exynos3250 compatible to use
 generic cpufreq driver
References: <1435756877-26736-1-git-send-email-cw00.choi@samsung.com>
 <1435756877-26736-4-git-send-email-cw00.choi@samsung.com>
In-reply-to: <1435756877-26736-4-git-send-email-cw00.choi@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01.07.2015 22:21, Chanwoo Choi wrote:
> This patch add exynos3250 compatible string to exynos_cpufreq_matches
> for supporting generic cpufreq driver on Exynos3250.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

