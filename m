Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19999 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965539AbcIHOt4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2016 10:49:56 -0400
Subject: Re: [PATCH v2 0/7] clk/samsung: exynos5410: Add sound subsystem
 related clocks
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Cc: b.zolnierkie@samsung.com, krzk@kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <9e3c332d-b7eb-d7c1-d055-d09efcfe4bf3@samsung.com>
Date: Thu, 08 Sep 2016 16:49:45 +0200
MIME-version: 1.0
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/06/2016 02:04 PM, Sylwester Nawrocki wrote:
> This patch adds support for the EPLL and the peripheral DMA clocks required
> for sound support on Odroid-XU board.
> 
> The clk-exynos-audss driver has been reworked to support
> "samsung,exynos5412-audss-clock" compatible.
> 
> This series also includes a cleanup patch consolidating the PLL clocks
> code, i.e. switching exynos5440 to use common code.
> 
> Sylwester Nawrocki (7):
>   clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
>   clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
>   clk: samsung: Use common registration function for pll2550x
>   clk: samsung: Add support for EPLL on exynos5410
>   clk: samsung: clk-exynos-audss: controller variant handling rework
>   clk: samsung: clk-exynos-audss: Add exynos5410 compatible
>   clk: samsung: clk-exynos-audss: Whitespace and debug trace cleanup


I have applied all patches from this series, except
"clk: samsung: Add support for EPLL on exynos5410", to my tree.

-- 
Thanks,
Sylwester
